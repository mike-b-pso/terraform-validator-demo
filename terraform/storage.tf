data "google_storage_project_service_account" "gcs_account" {
}

module "gcs_crypto" {
  source            = "./modules/gcp-kms/crypto-key"

  keyring_name      = module.project_keyring.keyring_id
  key_name          = "gcs_crypto_key"
  kms_binding_members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}

resource "google_storage_bucket" "bucket" {
  project = var.project_id
  name = "kms-protected-bucket"
  location = "us-east4"

  encryption {
    default_kms_key_name = module.gcs_crypto.crypto_key_id
  }

  # Ensure the KMS crypto-key IAM binding for the service account exists prior to the
  # bucket attempting to utilise the crypto-key.
  depends_on = [module.gcs_crypto]
}