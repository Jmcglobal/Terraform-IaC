# Terraform Output Values

# EC2 Instance Private IP
output "instance_private-a" {
  description = "EC2 Instance private IP"
  value = aws_instance.privateInstance-a.private_ip

}

output "instance_private-b" {
  description = "EC2 Instance private IP"
  value = aws_instance.privateInstance-b.private_ip
}


##Output Instance Public IP
output "instance_public-a" {
  description = "EC2 Instance Public IP"
  value = [
    aws_instance.publicInstance-a.public_ip,
    aws_instance.publicInstance-a.private_ip,
    aws_instance.publicInstance-b.public_dns
  ]
}

output "instance_public-b" {
  description = "EC2 Instance Public IP"
  value = [
    aws_instance.publicInstance-b.public_ip,
    aws_instance.publicInstance-b.private_ip,
    aws_instance.publicInstance-b.public_dns
  ]
}