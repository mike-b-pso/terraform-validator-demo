variable "project" {
  type = string
  default = "tfvalidator-integration-demo"
}

variable "keyring_location" {
  type    = string
}

variable "keyring_name" {
  type = string
}

variable "crypto_key_name" {
  type = string
}

variable "purpose" {
  type = string
  default = "ENCRYPT_DECRYPT"
}

variable "key_rotation_period" {
  type = string
  default = "7776000s"
}
variable "algorithm" {
  type  = string
  default = "GOOGLE_SYMMETRIC_ENCRYPTION"
}
variable "protection_level" {
  type  = string
  default = "HSM"
}