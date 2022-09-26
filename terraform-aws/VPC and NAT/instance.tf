resource "aws_instance" "example" {
  # Imagem a ser aplicada à EC2 - Ubuntu
  ami = lookup(var.AMIS, var.AWS_REGION)
  # Tipo da Instância
  instance_type = "t2.micro"

  # Sub-rede onde EC2 estará
  subnet_id = aws_subnet.main-public-1.id

  # Security Group que define regras de permissão a acesso SSH
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # Chave pública de acesso à instância
  key_name = aws_key_pair.mykey.key_name
}

# Criação de um volume EBS
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "${var.AWS_REGION}a"
  size = 20
  type = "gp2"
  tags = {
    "Name" = "extra volume data"
  }
} 

# Acoplar volume à uma instância
resource "aws_volume_attachment" "ebs-volume-1-attach" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example.id}"
}