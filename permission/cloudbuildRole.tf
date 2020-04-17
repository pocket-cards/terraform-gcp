# # --------------------------------------------------
# # Project - Cloud Build Role - Cloud Functions Admin
# # --------------------------------------------------
# resource "google_service_account_iam_binding" "cloudbuild" {
#   service_account_id = "projects/${local.project_id}/serviceAccounts/${local.project_id}@appspot.gserviceaccount.com"
#   role               = "roles/iam.serviceAccountUser"

#   members = [
#     "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com",
#   ]
# }
# # --------------------------------------------------
# # Project - Cloud Build Role - Cloud Functions Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_cloudfunctions" {
#   project = local.project_id
#   role    = "roles/cloudfunctions.admin"
#   member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Security Reviewer
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_security" {
#   depends_on = [google_project_iam_member.cloudbuild_cloudfunctions]
#   project    = local.project_id
#   role       = "roles/iam.securityReviewer"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Dialogflow Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_dialogflow" {
#   depends_on = [google_project_iam_member.cloudbuild_security]
#   project    = local.project_id
#   role       = "roles/dialogflow.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - KMS Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_kms" {
#   depends_on = [google_project_iam_member.cloudbuild_dialogflow]
#   project    = local.project_id
#   role       = "roles/cloudkms.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - KMS Decrypter
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_kms_decrypter" {
#   depends_on = [google_project_iam_member.cloudbuild_dialogflow]
#   project    = local.project_id
#   role       = "roles/cloudkms.cryptoKeyDecrypter"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Datastore user
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_datastore" {
#   depends_on = [google_project_iam_member.cloudbuild_dialogflow]
#   project    = local.project_id
#   role       = "roles/datastore.user"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - PubSub Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_pubsub" {
#   depends_on = [google_project_iam_member.cloudbuild_kms]
#   project    = local.project_id
#   role       = "roles/pubsub.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }


# # --------------------------------------------------
# # Project - Cloud Build Role - Project IAM Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_lb" {
#   depends_on = [google_project_iam_member.cloudbuild_iam]
#   project    = local.project_id
#   role       = "roles/compute.loadBalancerAdmin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }
# # --------------------------------------------------
# # Project - Cloud Build Role - Storage Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_storage" {
#   depends_on = [google_project_iam_member.cloudbuild_lb]
#   project    = local.project_id
#   role       = "roles/storage.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }


# # --------------------------------------------------
# # Project - Cloud Build Role - Service Account User
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_service_account_user" {
#   project = local.project_id
#   role    = "roles/iam.serviceAccountUser"
#   member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Service Account Creater
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudbuild_service_account_creater" {
#   project = local.project_id
#   role    = "roles/iam.serviceAccountCreator"
#   member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Cloud Scheduler Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "cloudscheduler" {
#   depends_on = [google_project_iam_member.cloudbuild_lb]
#   project    = local.project_id
#   role       = "roles/cloudscheduler.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }
# # --------------------------------------------------
# # Project - Cloud Build Role - DNS Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "dns" {
#   depends_on = [google_project_iam_member.cloudbuild_lb]
#   project    = local.project_id
#   role       = "roles/dns.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

# # --------------------------------------------------
# # Project - Cloud Build Role - Service Management Admin
# # --------------------------------------------------
# resource "google_project_iam_member" "servicemanagement" {
#   depends_on = [google_project_iam_member.cloudbuild_lb]
#   project    = local.project_id
#   role       = "roles/servicemanagement.admin"
#   member     = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
# }

