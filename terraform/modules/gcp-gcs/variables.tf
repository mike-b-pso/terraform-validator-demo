variable "project_id" {
  type = string
}

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

variable "bucket_name" {
  type = string
}

variable "bucket_location" {
  type = string
}