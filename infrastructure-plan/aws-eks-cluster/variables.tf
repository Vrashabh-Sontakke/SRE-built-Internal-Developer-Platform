variable "pubsub1" {
  type    = string
}

variable "pubsub2" {
  type    = string
}

dynamic "variable_defaults" {
  for_each = {
    pubsub1 = local.pubsub1_id
    pubsub2 = local.pubsub2_id
  }
  content {
    set {
      name  = var.variable_defaults.key
      value = var.variable_defaults.value
    }
  }
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
