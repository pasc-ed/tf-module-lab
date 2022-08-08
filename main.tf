resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# CHILD MODULE - PUBLIC SUBNET
module "public" {
  source = "./network-module"

  vpc_id      = aws_vpc.main_vpc.id
  subnet_cidr = "10.0.1.0/24"
  subnet_name = "public_subnet"
  is_public   = true
}

# CHILD MODULE - PRIVATE SUBNET
module "private" {
  source = "./network-module"

  vpc_id      = aws_vpc.main_vpc.id
  subnet_cidr = "10.0.2.0/24"
  subnet_name = "private_subnet"
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  subnet_id     = module.public.subnet_id

  tags = {
    Name = "Web Server"
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  subnet_id     = module.private.subnet_id

  tags = {
    Name = "App Server"
  }
}