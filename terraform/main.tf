module "project_keyring" {
  source = "./modules/gcp-kms/keyring"

  keyring_name = "tfvalidator-demo-keyring"
  project = var.project_id
  keyring_location = "us"
}
