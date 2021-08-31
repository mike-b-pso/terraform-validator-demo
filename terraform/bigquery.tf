data "google_bigquery_default_service_account" "bq_sa" {
}

resource "google_kms_crypto_key_iam_member" "bq_key_sa_user" {
  crypto_key_id = module.bigquery_crypto.crypto_key_id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_bigquery_default_service_account.bq_sa.email}"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "demo_dataset"
  friendly_name               = "test"
  description                 = "This is a demo dataset"
  location                    = "us-east4"
  default_table_expiration_ms = 3600000

  default_encryption_configuration {
    kms_key_name = module.bigquery_crypto.crypto_key_id
  }

  # Ensure the KMS crypto-key IAM binding for the service account exists prior to the
  # bq table attempting to utilise the crypto-key.
  depends_on = [google_kms_crypto_key_iam_member.bq_key_sa_user]
}

