terraform {
  backend "s3" {
    bucket = ""  # bucket defined in GitHub Actions Workflow file and variable with vars.AWS_S3_BUCKET variable
    key    = ""  # key is defined in GitHub Actions Workflow file variable according to the var.ENVIRONMENT variable
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# required import subnet ids form VPC
data "terraform_remote_state" "vpc" {
  backend = "s3"
    config = {
      bucket = var.aws_s3_bucket
      key    = "${var.environment}-vpc.tfstate"
      region = "us-east-1"
    }
}

# IAM Role for EKS to have access to the appropriate resources
resource "aws_iam_role" "eks-iam-role" {
  name = var.eksIAMRole

  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

## Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-iam-role.name
}

## Create the EKS cluster
resource "aws_eks_cluster" "eks" {
  name = "${var.environment}-${var.cluster_name}"
  role_arn = aws_iam_role.eks-iam-role.arn

  enabled_cluster_log_types = ["api", "audit", "scheduler", "controllerManager"]
  version = var.k8sVersion
  
  vpc_config {
    # Import subnet IDs from remote state outputs
    subnet_ids = var.environment == "prod" ? [
      data.terraform_remote_state.vpc.outputs.pubsub1_id,
      data.terraform_remote_state.vpc.outputs.pubsub2_id
    ] : var.environment == "dev" ? [
      data.terraform_remote_state.vpc.outputs.privsub1_id,
      data.terraform_remote_state.vpc.outputs.privsub2_id
    ] : []
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}

## Worker Nodes
resource "aws_iam_role" "workernodes" {
  name = var.workerNodeIAM

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  role       = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicy-eks" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.workernodes.name
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.environment}-workernodes"
  node_role_arn   = aws_iam_role.workernodes.arn
  
  subnet_ids = var.environment == "prod" ? [
      data.terraform_remote_state.vpc.outputs.pubsub1_id,
      data.terraform_remote_state.vpc.outputs.pubsub2_id
    ] : var.environment == "dev" ? [
      data.terraform_remote_state.vpc.outputs.privsub1_id,
      data.terraform_remote_state.vpc.outputs.privsub2_id
    ] : []
    
  instance_types = var.instanceType

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
  ]
}

resource "aws_eks_addon" "csi" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "aws-ebs-csi-driver"
}
