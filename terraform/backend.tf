terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-new"
    prefix = "terraform/state"
  }
}
