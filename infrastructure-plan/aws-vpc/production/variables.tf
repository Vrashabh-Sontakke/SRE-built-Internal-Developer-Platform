variable "VPC_Name" {
  type = string
  default = "prod-vpc"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "aws_s3_bucket" {
  type = string
  default = "aws-terra-s3"
}


variable "tfstate" {
  type = string
  default = "eks-prod.tfstate"
}