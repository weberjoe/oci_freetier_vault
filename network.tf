resource "oci_core_vcn" "demo_VCN" {
  cidr_block      = "10.0.0.0/16"
  compartment_id  = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid

  display_name    = "demo-VCN"
}

resource "oci_core_internet_gateway" "demo_VCN" {
  compartment_id  = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
  vcn_id          = oci_core_vcn.demo_VCN.id

  display_name    = "demo-IGW"
}

resource "oci_core_route_table" "demo_RT" {
  compartment_id  = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
  vcn_id          = oci_core_vcn.demo_VCN.id
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.demo_VCN.id
  }

  display_name    = "demo-RT"
}

resource "oci_core_subnet" "demo_SN" {
  compartment_id    = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
  vcn_id            = oci_core_vcn.demo_VCN.id
  cidr_block        = "10.0.1.0/24"
  security_list_ids = [oci_core_security_list.demo_SL.id]
  route_table_id    = oci_core_route_table.demo_RT.id

  display_name    = "demo-SN"
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1], "name")
}

resource "oci_core_security_list" "demo_SL" {
  compartment_id  = oci_identity_compartment.demo_vault_compartment.id #var.demo_compartment_ocid
  vcn_id          = oci_core_vcn.demo_VCN.id

  egress_security_rules { 
    destination = "0.0.0.0/0" 
    protocol = "all" 
  }

  ingress_security_rules { 
    protocol = "6"
    source = "0.0.0.0/0"
    tcp_options { 
      max = 22
      min = 22 
    }
  }

  ingress_security_rules {
    protocol = "6"
    source = "0.0.0.0/0"
    tcp_options { 
      max = 80
      min = 80 
    }
  }

  display_name   = "training_sl"
}


