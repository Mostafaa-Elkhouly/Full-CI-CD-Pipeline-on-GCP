#Compute Module Input Arguments
variable "instance_sa_email" {
  description = "The email address of the instance service account from the IAM module"
  type        = string
}

variable "vpc_network_name" {
  description = "The name of the VPC network from the Network module"
  type        = string
}

variable "vm_subnet" {
  description = "Subnet name of the VM instance from the Network module"
  type        = string
}

variable "vm_region" {
  description = "The VM instance region"
  type        = string
}