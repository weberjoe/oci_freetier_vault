# data "oci_core_images" "demo_Images" {
#   compartment_id   = var.demo_compartment_ocid
#   operating_system = "Canonical Ubuntu" 
#   filter {
#     name = "display_name"
#     values = ["^Canonical-Ubuntu-18.04-([\\.0-9-]+)$"]
#     regex = true
#   } 
#   shape = var.compute_shape
# }

data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}