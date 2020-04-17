locals {
  # ----------------------------------------------------------------------------------------------
  # Project Information
  # ----------------------------------------------------------------------------------------------
  environment    = terraform.workspace
  remote_install = data.terraform_remote_state.install.outputs

  # ----------------------------------------------------------------------------------------------
  # Terraform Remote State
  # ----------------------------------------------------------------------------------------------
  project_id     = local.remote_install.project_id
  project_number = data.google_project.this.number
  project_name   = data.google_project.this.name
}

data "google_project" "this" {
  project_id = local.project_id
}
