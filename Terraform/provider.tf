provider "google" {
  credentials = file("~/terraform-key.json")
  project     = var.project_id
}

variable "gcp_service_list" {
  description = "The list of APIs necessary for the project"
  type        = list(string)
  default = [
    "serviceusage.googleapis.com", # The Service Usage API
    "compute.googleapis.com",
    "container.googleapis.com",
    "artifactregistry.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services" {
  count   = length(var.gcp_service_list)
  project = var.project_id
  service = var.gcp_service_list[count.index]

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = true
  disable_dependent_services = true
}


