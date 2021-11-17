
output "project_keyring_id" {
  value = module.project_keyring.keyring_id
}

output "gcs_crypto_key_id" {
  value = module.gcs_crypto.crypto_key_id
}

output "gcs_crypto_key_name" {
  value = module.gcs_crypto.crypto_key_name
}

output "bq_crypto_key_id" {
  value = module.bigquery_crypto.crypto_key_id
}

output "gcs_bucket_name" {
  value = google_storage_bucket.bucket_2.self_link
}

output "gcs_bucket_url" {
  value = google_storage_bucket.bucket_2.url
}