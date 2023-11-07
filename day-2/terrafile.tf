module "servers" {
  source  = "./servers"
  servers = 1
}

output "public_ip" {
  value = module.servers.public_ip[0].public_ip
}
