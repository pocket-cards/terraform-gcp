# ----------------------------------------------------------------------------------------------
# Project - Cloud Build Role - Project IAM Admin
# ----------------------------------------------------------------------------------------------
resource "google_project_iam_member" "cloudbuild_iam" {
  role   = "roles/resourcemanager.projectIamAdmin"
  member = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

# ----------------------------------------------------------------------------------------------
# Google Cloud Build - Terraform
# ----------------------------------------------------------------------------------------------
resource "google_cloudbuild_trigger" "terraform" {
  provider = google-beta

  filename    = local.cloudbuild_trigger_filename
  description = "Terraform"

  github {
    owner = var.repo_owner
    name  = var.repo_terraform
    push {
      tag    = lookup(local.cloudbuild_tags, local.environment)
      branch = lookup(local.cloudbuild_branches, local.environment)
    }
  }

  substitutions = {
    _ENVIRONMENT = local.environment
  }
}
