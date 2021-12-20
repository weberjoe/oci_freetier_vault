# output "output-all" {
#     value = "${
#         [oci_kms_vault.demo_vault.crypto_endpoint,
#         oci_kms_vault.demo_vault.management_endpoint,
#         oci_kms_key.demo_key.id]
#     }"
# }

output "ssh_connection" {
    value = "ssh -i keys/key_private.pem ${var.opc_user_name}@${oci_core_instance.demo_VM.public_ip}"
    description = "ssh connection to the oci compute instance"
}
