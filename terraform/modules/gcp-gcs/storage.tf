data "google_storage_project_service_account" "gcs_account" {
}

resource "google_storage_bucket" "bucket" {
  project = var.project_id
  name = var.bucket_name
  location = var.bucket_location

  encryption {
    default_kms_key_name = "${var.keyring_name}/cryptoKeys/${google_kms_crypto_key.crypto_key.name}"
  }

  # Ensure the KMS crypto-key IAM binding for the service account exists prior to the
  # bucket attempting to utilise the crypto-key.
  depends_on = [google_kms_crypto_key.crypto_key]
}