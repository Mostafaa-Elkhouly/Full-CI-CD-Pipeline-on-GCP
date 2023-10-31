resource "google_storage_bucket" "bucket" {
  name = "terraform-backend-tfstate-bucket"
  #location      = "us-central1" -> regional
  location      = "US" #multi region in US
  storage_class = "STANDARD"
  force_destroy = false

  public_access_prevention = "enforced" #private access bucket

  versioning {
    enabled = true
  }
}

terraform {
  backend "gcs" {
    bucket = "terraform-backend-tfstate-bucket"
    prefix = "terraform/state"
  }
}