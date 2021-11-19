output "gcs_crypto_key_id" {
  value = google_kms_crypto_key.crypto_key.id
}

output "gcs_bucket_name" {
  value = google_storage_bucket.bucket.self_link
}

output "gcs_bucket_url" {
  value = google_storage_bucket.bucket.url
}