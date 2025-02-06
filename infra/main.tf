provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "data-lacke" {
  name     = "gs-${var.random_string}"
  location = var.location

  versioning {
    enabled = true
  }
}

resource "google_bigquery_dataset" "data-warehouse" {
  dataset_id    = "daat_${var.random_string}"
  location      = var.location
  friendly_name = "data-war"
  description   = "This is a test description"
}
