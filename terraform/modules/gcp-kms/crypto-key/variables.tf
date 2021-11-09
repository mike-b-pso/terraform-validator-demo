variable "keyring_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "kms_binding_members" {
  type = list(string)
  default = []
}