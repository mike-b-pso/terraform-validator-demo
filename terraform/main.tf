module "project_keyring" {
  source = "./modules/gcp-kms/keyring"

  keyring_name = "tfvalidator-demo-keyring"
  project = var.project_id
  keyring_location = "us"
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "test-key-1"
  key_ring = "tfvalidator-demo-keyring"
  purpose  = "ENCRYPT_DECRYPT"

  # 90 day rotation period
  rotation_period = "7776000s"

  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
  }
  //  lifecycle {
  //    prevent_destroy = true
  //  }
}