#default values for declared variables
project_id        = "swift-radar-399606"
work_region       = "us-central1"
subnets_cidr_list = ["192.168.1.0/24", "10.1.0.0/16"]
regions_list      = ["us-central1", "us-east1"]
vm_roles = [
  "roles/container.admin",        # Manage GKE Cluster
  "roles/artifactregistry.writer" # Tag and push images
]
cluster_roles = [
  "roles/artifactregistry.reader" # Pull images
]