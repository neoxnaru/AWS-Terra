provider "aws"{
    region = "us-east-1"
}

provider "aws" {
    region = "us-west-1"
    alias = "usa2"
  
}


# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  
  tags = {
    Name = "dev"
  }
}

resource "aws_vpc" "dev2" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  provider = aws.usa2
  tags = {
    Name = "dev"
  }
}


# Creating Public Subnets in VPC
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  

  tags = {
    Name = "dev-public-1"
  }
}

resource "aws_subnet" "dev-public-2" {
  vpc_id                  = aws_vpc.dev2.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1b"
  provider = aws.usa2

  tags = {
    Name = "dev-public-2"
  }
}

# Creating EC2 instances in public subnets
resource "aws_instance" "public_inst_1" {
  ami           = "ami-08e4e35cccc6189f4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-public-1.id}"
  key_name = "Virginia"
  tags = {
    Name = "public_inst_1"
  }
}

resource "aws_instance" "public_inst_2" {
  ami           = "ami-02d03ce209db75523"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-public-2.id}"
  key_name = "Cali"
  provider = aws.usa2
  tags = {
    Name = "public_inst_2"
  }
}

