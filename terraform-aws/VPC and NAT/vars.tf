variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "RDS_DB_PASSWORD" {}
variable "RDS_DB_USERNAME" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-08c40ec9ead489470"
    us-west-2 = "ami-017fecd1353bcc96e"
    eu-west-1 = "ami-096800910c1b781ba"
  }
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "aws_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "aws_key"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}