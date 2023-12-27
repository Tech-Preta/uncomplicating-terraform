variable "compartment_id" {
  description = "OCID da sua tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaaouenl5dkovcw7niegbzakvve3denegzmxykgpvw7f4p24ee46epq"
  type        = string
}
variable "region" {
  description = "Região do OCI tenancy"
  type        = string
  default     = "us-ashburn-1"
}

variable "display_name" {
  description = "Nome do recurso"
  type        = string
  default     = "My internal VCN"

}
