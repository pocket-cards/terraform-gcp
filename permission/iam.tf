# ----------------------------------------------------------------------------------------------
# Project - Cloud Build Role - Cloud Functions Admin
# ----------------------------------------------------------------------------------------------
resource "google_project_iam_member" "cloudbuild_cloudfunctions" {
  project = local.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

# ----------------------------------------------------------------------------------------------
# Project - Cloud Build Role - Cloud Run Admin
# ----------------------------------------------------------------------------------------------
resource "google_project_iam_member" "cloudbuild_run" {
  project = local.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}
