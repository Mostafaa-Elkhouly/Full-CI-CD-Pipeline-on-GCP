#GKE Module Input Arguments
variable "vpc_network_name" {
  description = "The name of the VPC network from the Network module"
  type        = string
}

variable "subnets_list"{
  description = "List of Network Subnets from the Network module"
  type = list(any)
}

variable "cluster_sa_email" {
  description = "The email address of the GKE Cluster instances service account from the IAM module"
  type        = string
}
