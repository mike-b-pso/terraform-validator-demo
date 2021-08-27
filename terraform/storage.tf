data "google_storage_project_service_account" "gcs_account" {
}

  resource "google_kms_crypto_key_iam_binding" "binding" {
  crypto_key_id = module.gcs_crypto.crypto_key_id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}


  resource "google_storage_bucket" "bucket" {
  name = "kms-protected-bucket"
  location = "us-east4"

//  encryption {
//    default_kms_key_name = module.gcs_crypto.crypto_key_id
//  }

  # Ensure the KMS crypto-key IAM binding for the service account exists prior to the
  # bucket attempting to utilise the crypto-key.
  depends_on = [google_kms_crypto_key_iam_binding.binding]
}