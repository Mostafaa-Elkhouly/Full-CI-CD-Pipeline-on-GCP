resource "google_artifact_registry_repository" "my-repo" {
  location      = var.subnets_list[0].region
  repository_id = "my-repo"
  description   = "Docker Repository"
  format        = "DOCKER"
}