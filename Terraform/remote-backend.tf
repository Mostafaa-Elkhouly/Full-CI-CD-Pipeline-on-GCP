data "google_storage_bucket" "existing_bucket" {
  name = "terraform-backend-tfstate-bucket"
}

resource "google_storage_bucket" "bucket" {
  # Create only if the bucket doesn't exist
  count = length(data.google_storage_bucket.existing_bucket) == 0 ? 1 : 0  

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