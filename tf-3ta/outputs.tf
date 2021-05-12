// output "vpc" {
//   value = module.project_vpc.vpc
// }

// output "bastion_sg" {
//   value = module.bastion_sg.sg
// }

output "bastion_host1_public_dns" {
  value = module.bastion_host1.instance.public_dns
}