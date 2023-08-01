variable "VPC_Name" {
  type = string
  default = "prod-vpc"
}

variable "AWS_Region" {
  type = string
  default = "us-east-1"
}

variable "AWS_S3_Bucket" {
  type = string
  default = "aws-terra-s3"
}


variable "tfstate" {
  type = string
  default = "eks-prod.tfstate"
}