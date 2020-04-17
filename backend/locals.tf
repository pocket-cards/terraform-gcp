locals {
  # ----------------------------------------------------------------------------------------------
  # Project Information
  # ----------------------------------------------------------------------------------------------
  environment    = terraform.workspace
  remote_install = data.terraform_remote_state.install.outputs

  # ----------------------------------------------------------------------------------------------
  # Terraform Remote State
  # ----------------------------------------------------------------------------------------------
  repo_owner     = local.remote_install.repo_owner
  repo_backend   = local.remote_install.repo_backend
  project_id     = local.remote_install.project_id
  project_number = data.google_project.this.number
  project_name   = data.google_project.this.name

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
}

data "google_project" "this" {
  project_id = local.project_id
}
