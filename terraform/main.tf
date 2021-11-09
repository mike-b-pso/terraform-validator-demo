module "project_keyring" {
  source = "./modules/gcp-kms/keyring"

  keyring_name = "tfvalidator-demo-keyring-2"
  project = var.project_id
  keyring_location = "us"
}

//resource "google_kms_crypto_key" "crypto_key" {
//  name     = "tfv-test-key-2"
//  key_ring = module.project_keyring.keyring_id
//  purpose  = "ENCRYPT_DECRYPT"
//
//  # 90 day rotation period
//  rotation_period = "7776000s"
//
//  version_template {
//    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
//    protection_level = "SOFTWARE"
//  }
//  //  lifecycle {
//  //    prevent_destroy = true
//  //  }
//}