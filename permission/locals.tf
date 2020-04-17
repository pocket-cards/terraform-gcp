locals {
  # ----------------------------------------------------------------------------------------------
  # Project Information
  # ----------------------------------------------------------------------------------------------
  environment = terraform.workspace

  # ----------------------------------------------------------------------------------------------
  # Terraform Remote State
  # ----------------------------------------------------------------------------------------------
  project_id     = data.google_project.this.project_id
  project_number = data.google_project.this.number
  project_name   = data.google_project.this.name
}

data "google_project" "this" {}
