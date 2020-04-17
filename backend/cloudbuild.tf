# ----------------------------------------------------------------------------------------------
# Google Cloud Build - Backend
# ----------------------------------------------------------------------------------------------
resource "google_cloudbuild_trigger" "backend" {
  provider = google-beta

  description = "Backend"

  github {
    owner = local.repo_owner
    name  = local.repo_backend
    push {
      tag    = lookup(local.cloudbuild_tags, local.environment)
      branch = lookup(local.cloudbuild_branches, local.environment)
    }
  }

  substitutions = {
    _ENVIRONMENT = local.environment
  }
}
