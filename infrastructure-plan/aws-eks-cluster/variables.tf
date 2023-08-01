variable "chooseSubnet" {
  type = string
  default = "public" # "public" will use [pubsub1, pubsub2]
                     # "private" or leaving blank will use [privsub1, privsub2]
}

variable "default_sub1_id" {
  type = string
  default = ""
}

variable "default_sub2_id" {
  type = string
  default = ""
}

variable "eksIAMRole" {
  type = string
  default = "prod-eks-cluster"
}

variable "EKSClusterName" {
  type = string
  default = "prod-eks"
}

variable "AWS_Region" {
  type = string
  default = "us-east-1"
}

variable "AWS_S3_Bucket" {
  type = string
  default = "aws-terraform-s3"
}


variable "tfstate" {
  type = string
  default = "prod-eks.tfstate"
}

variable "k8sVersion" {
  type = string
  default = "1.26"
}

variable "workerNodeIAM" {
  type = string
  default = "prod-worker-nodes"
}

variable "max_size" {
  type = string
  default = 4
}

variable "desired_size" {
  type = string
  default = 3
}
variable "min_size" {
  type = string
  default = 3
}

variable "instanceType" {
  type = list
  default = ["t2.xlarge"]
}

variable "environment" {
  type = string
  default = "prod"
}
