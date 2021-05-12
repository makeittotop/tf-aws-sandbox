// output "vpc" {
//   value = module.project_vpc.vpc
// }

// output "bastion_sg" {
//   value = module.bastion_sg.sg
// }

output "bastion_hosts_public_dns" {
  value = module.bastion_hosts[*].instance.public_dns[0]
}