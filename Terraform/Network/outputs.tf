#Network Module Output Attributes
output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "subnets_list" {
  description = "The list of names for the subnets"
  value       = google_compute_subnetwork.subnets
}