# -----------------------------------------------
# Google Cloud Build - Infra
# -----------------------------------------------
resource "google_cloudbuild_trigger" "install" {
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

