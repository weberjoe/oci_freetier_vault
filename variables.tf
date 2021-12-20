variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}

# demo compartment
# variable "demo_compartment_ocid" {
#   default = "ocid1.compartment.oc1..aaaaaaaaurvqqjxpppbhya7oftmrlx2nvjhldshhfupqzhdlbfim2zv7zjkq"
# }
# demo vault vars
variable "vault_display_name" {
  default = "demo-vault"
}
variable "vault_vault_type" {
  default = "DEFAULT"
}
# demo master key vars
variable "key_display_name" {
  default = "demo-key"
}
variable "key_key_shape_algorithm" {
  default = "AES"
}
variable "key_key_shape_length" {
  default = "24"
}
variable "key_protection_mode" {
  default = "SOFTWARE"
}

# demo instance & vcn
variable "opc_user_name" {
  default = "ubuntu"
}
variable "AD" {
  default = "2"
}
variable "local_jupyter_port" {
  default = 8882
}
variable "compute_shape" {
  #default = "VM.Standard2.1"
  default = "VM.Standard.E2.1.Micro"
}

variable "dynamic_group_name" {
  default = "demo-dynamic-group"
}