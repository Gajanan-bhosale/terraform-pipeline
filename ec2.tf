data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "my_sec_gp" {
  name    = "my_sec_gp"
  ingress = []
  egress  = []
}

resource "aws_instance" "mynewinstance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  count           = var.instance_count
  
  tags = {
    Name = "mynewinstance"
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "mybucket"
    Environment = "Dev"
  }
}