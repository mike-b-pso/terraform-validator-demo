module "project_keyring" {
  source = "./modules/gcp-kms/keyring"

  keyring_name = "tfvalidator-demo-keyring-2"
  project = var.project_id
  keyring_location = "us"
}

module "gcs_bucket" {
  source = "./modules/gcp-gcs"

  project_id = var.project_id
  keyring_name = module.project_keyring.keyring_id
  key_name = "gcs_crypto_key"
  bucket_name = "kms-protected-bucket"
  bucket_location = "us-east4"
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