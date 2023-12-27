output "vcn_state" {
  description = "O estado da VCN."
  value       = oci_core_vcn.internal.state
}

output "vcn_cidr" {
  description = "Bloco CIDR da VCN principal"
  value       = oci_core_vcn.internal.cidr_block
}
