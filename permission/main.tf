# ----------------------------------------------------------------------------------------------
# Terraform Provider
# ----------------------------------------------------------------------------------------------
provider "google" {
  region = var.region
}

provider "google-beta" {
  region = var.region
}

# ----------------------------------------------------------------------------------------------
# Terraform Settings
# ----------------------------------------------------------------------------------------------
terraform {
  backend "gcs" {
    bucket = "terraform-settings"
    prefix = "permission"
  }
}

# ----------------------------------------------------------------------------------------------
# Terraform Remote State
# ----------------------------------------------------------------------------------------------
data "terraform_remote_state" "install" {
  backend   = "gcs"
  workspace = terraform.workspace

  config = {
    bucket = "terraform-settings"
    prefix = "install"
  }
}
