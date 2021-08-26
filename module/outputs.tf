output "keyring_name" {
  value = google_kms_key_ring.keyring.self_link
}

output "keyring_id" {
  value = google_kms_key_ring.keyring.id
}

output "crypto_key_id" {
  value = google_kms_crypto_key.crypto_key.id
}