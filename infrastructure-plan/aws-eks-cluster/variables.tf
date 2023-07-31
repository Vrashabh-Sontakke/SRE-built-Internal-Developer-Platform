variable "eksIAMRole" {
  type = string
  default = "prod-eks-cluster"
}

variable "EKSClusterName" {
  type = string
  default = "prod-eks"
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
