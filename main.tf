terraform {
  backend "gcs" {
    bucket = "lakshan-terraform-bucket"
    prefix = "terraform/state"
  }
}


provider "google" {
  project = var.project_id
  region  = var.region
}