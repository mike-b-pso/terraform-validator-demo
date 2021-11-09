resource "google_kms_crypto_key" "crypto_key" {
  name     = var.key_name
  key_ring = var.keyring_name
  purpose  = "ENCRYPT_DECRYPT"

  # 100 day rotation period
  rotation_period = "2400h"

  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "HSM"
  }
  //  lifecycle {
  //    prevent_destroy = true
  //  }
}

resource "google_kms_crypto_key_iam_binding" "kms_binding" {
  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = var.kms_binding_members
}
