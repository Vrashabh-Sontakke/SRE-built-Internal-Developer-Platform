# terraform.tfvars

# Choose the subnet type: "public" or "private"
chooseSubnet = "public" # "public" will use [pubsub1, pubsub2] | "private" or leaving blank will use [privsub1, privsub2]

# Subnet IDs if using "private" subnet type
default_sub1_id = "subnet-xxxxxxxxxxxxxxxxx"
default_sub2_id = "subnet-xxxxxxxxxxxxxxxxx"

# EKS Cluster settings
eksIAMRole = "prod-eks-cluster"
EKSClusterName = "prod-eks"

# AWS Region
AWS_Region = "us-east-1"

# S3 Bucket for Terraform state storage
AWS_S3_Bucket = "aws-terraform-s3"

# Terraform state file name
tfstate = "prod-eks.tfstate"

# Kubernetes version
k8sVersion = "1.26"

# IAM Role for worker nodes
workerNodeIAM = "prod-worker-nodes"

# Autoscaling Group settings
max_size = "4"
desired_size = "3"
min_size = "3"

# EC2 instance type for worker nodes
instanceType = ["t2.xlarge"]

# Environment (e.g., "prod", "dev", "test")
environment = "prod"
