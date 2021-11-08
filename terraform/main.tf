module "gcs_crypto" {
  source            = "./modules/gcp-kms"
  project           = var.project_id

  keyring_location  = "us-east4"
  keyring_name      = "gcs_keyring_2"
  crypto_key_name   = "gcs_crypto_key_2"
}

module "bigquery_crypto" {
  source            = "./modules/gcp-kms"
  project           = var.project_id

  keyring_location  = "us-east4"
  keyring_name      = "bq_keyring"
  crypto_key_name   = "bq_crypto_key"
}