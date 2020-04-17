locals {
  # ----------------------------------------------------------------------------------------------
  # Project Information
  # ----------------------------------------------------------------------------------------------
  environment = terraform.workspace

  # ----------------------------------------------------------------------------------------------
  # CloudBuild
  # ----------------------------------------------------------------------------------------------
  cloudbuild_trigger_filename = "cloudbuild.yaml"

  cloudbuild_tags = {
    default : null,
    dev : null,
    staging : null,
    prod : ".*"
  }

  cloudbuild_branches = {
    default : "^master$",
    dev : "^develop$",
    staging : "^master$",
    prod : null
  }

  # ----------------------------------------------------------------------------------------------
  # Terraform Remote State
  # ----------------------------------------------------------------------------------------------
  project_id     = data.google_project.this.project_id
  project_number = data.google_project.this.number
  project_name   = data.google_project.this.name
}

data "google_project" "this" {
}
