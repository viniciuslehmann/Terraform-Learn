resource "aws_instance" "example" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo Private IP=${aws_instance.example.private_ip} >> private_ips.txt"
  }
}

output "public_ip" {
  value= aws_instance.example.public_ip
}

output "public_dns" {
    value = aws_instance.example.public_dns
}

output "az_zone" {
    value = aws_instance.example.availability_zone
}

output "host_id" {
    value = aws_instance.example.host_id
}

output "vpc_secgroup" {
    value = aws_instance.example.vpc_security_group_ids
}