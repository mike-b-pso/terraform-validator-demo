terraform {
  backend "gcs" {
    bucket  = "tf-validator-demo"
    prefix  = "tf-demo"
  }
}