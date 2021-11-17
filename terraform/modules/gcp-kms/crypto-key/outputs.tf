output "crypto_key_id" {
  value = google_kms_crypto_key.crypto_key.id
}

output "crypto_key_name" {
  value = google_kms_crypto_key.crypto_key.name
}