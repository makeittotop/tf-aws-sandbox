output "public_ip" {
    description = "aws instance public ip"
    value       = aws_instance.helloworld.public_ip
}

output "public_dns" {
    description = "aws instance public dns"
    value       = aws_instance.helloworld.public_dns
}