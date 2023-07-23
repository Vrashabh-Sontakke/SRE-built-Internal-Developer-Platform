variable "pubsub1" {
  type = string
  default = "subnet-03b044c93503d6ade"
}

variable "pubsub2" {
  type = string
  default = "subnet-025866d9702b29499"
}

variable "eksIAMRole" {
  type = string
  default = "prodEKSCluster"
}

variable "EKSClusterName" {
  type = string
  default = "prodEKS"
}

variable "k8sVersion" {
  type = string
  default = "1.26"
}

variable "workerNodeIAM" {
  type = string
  default = "prodWorkerNodes"
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
