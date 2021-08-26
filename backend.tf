terraform {
  backend "gcs" {
    bucket  = "tf-validator-kms-demo"
    prefix  = "tf-demo"
  }
}