terraform {
  required_version = ">= 0.13.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.52.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.52.0"
    }
  }
}

provider "google" {
  region  = "europe-west1"
  project = var.google_project
}

provider "google-beta" {
  region  = "europe-west1"
  project = var.google_project
}
