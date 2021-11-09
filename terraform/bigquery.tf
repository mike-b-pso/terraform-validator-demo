//data "google_bigquery_default_service_account" "bq_sa" {
//}
//
//module "bigquery_crypto" {
//  source            = "./modules/gcp-kms/crypto-key"
//
//  keyring_name      = module.project_keyring.keyring_id
//  key_name          = "bq_crypto_key"
//  kms_binding_members = ["serviceAccount:${data.google_bigquery_default_service_account.bq_sa.email}"]
//}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "demo_dataset"
  friendly_name               = "test"
  description                 = "This is a demo dataset"
  location                    = "us-east4"
  default_table_expiration_ms = 3600000

//  default_encryption_configuration {
//    kms_key_name = module.bigquery_crypto.crypto_key_id
//  }

  # Ensure the KMS crypto-key IAM binding for the service account exists prior to the
  # bq table attempting to utilise the crypto-key.
  depends_on = [module.bigquery_crypto]
}

