#IAM Module Output Attributes
output "instance_sa_email" {
  description = "The email address of the VM instance service account"
  value       = google_service_account.instance_sa.email
}

output "cluster_sa_email" {
  description = "The email address of the GKE Cluster instances service account"
  value       = google_service_account.cluster_sa.email
}