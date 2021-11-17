
output "project_keyring_id" {
  value = module.project_keyring.keyring_id
}

//output "gcs_crypto_key_id" {
//  value = module.gcs_crypto.crypto_key_id
//}

output "bq_crypto_key_id" {
  value = module.bigquery_crypto.crypto_key_id
}

//output "gcs_bucket_name" {
//  value = google_storage_bucket.bucket.self_link
//}
//
//output "gcs_bucket_url" {
//  value = google_storage_bucket.bucket.url
//}