# COMPARTMENT
resource "oci_identity_compartment" "demo_vault_compartment" {
    compartment_id = var.tenancy_ocid
    description = "compartment for keyvault demo"
    name = "demo_keyvault_compartment_2"
}

# DYNAMIC GROUP
resource "oci_identity_dynamic_group" "demo_dynamic_group" {
    compartment_id = var.tenancy_ocid
    description = "allow instance to make calls against OCI-ke-vault"
    #matching_rule = "instance.compartment.id = '${var.demo_compartment_ocid}'}" 
    matching_rule = "ANY {instance.compartment.id = '${oci_identity_compartment.demo_vault_compartment.id}'}"
    name = var.dynamic_group_name
}

# POLICY
resource "oci_identity_policy" "demo_policy" {
    compartment_id = var.tenancy_ocid # oci_identity_compartment.demo_vault_compartment.id
    description = "allow dynamic group to access key-vault"
    name = "demo-policy"
    statements = ["Allow dynamic-group ${var.dynamic_group_name} to manage all-resources in tenancy"] # secret-family
}
