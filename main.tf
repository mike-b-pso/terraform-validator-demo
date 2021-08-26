module "gcs_crypto" {
  source            = "module"
  project           = "tfvalidator-integration-demo"

  keyring_location  = "us-east4"
  keyring_name      = "gcs_keyring"
  crypto_key_name   = "gcs_crypto_key"
}

module "bigquery_crypto" {
  source            = "module"
  project           = "tfvalidator-integration-demo"

  keyring_location  = "us-east4"
  keyring_name      = "bq_keyring"
  crypto_key_name   = "bq_crypto_key"
}