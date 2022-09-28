resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow SSH on port 22 from any IP address"
  vpc_id      = aws_vpc.main-vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb-securitygroup.id]
  }

  tags = {
    SecGroup-Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "allow-mariadb"
  description = "allow-mariadb"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.allow-ssh.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    "Name" = "allow-mariadb"
  }

}

resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "elb"
  description = "elb-securitygroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "elb"
  }
}