# ------ create vault ------

resource "oci_kms_vault" "demo_vault" {
    compartment_id = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
    display_name   = var.vault_display_name
    vault_type     = var.vault_vault_type
}

# ------ create master key in vault ------

resource "oci_kms_key" "demo_key" {
    compartment_id  = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
    display_name    = var.key_display_name
    key_shape {
        algorithm   = var.key_key_shape_algorithm
        length      = var.key_key_shape_length
    }
    management_endpoint = oci_kms_vault.demo_vault.management_endpoint
    protection_mode     = var.key_protection_mode
}

# ------ write JSON vault connection file ------

resource "local_file" "demo_vault_access" {
    content  = "{\"crypto_endpoint\": \"${oci_kms_vault.demo_vault.crypto_endpoint}\", \"crypto_key_ocid\": \"${oci_kms_key.demo_key.id}\"}"
    filename = "keys/vault_access.json"
}
