#Auto Scaling Group in Single AZ

#Configuring AWS Provider
provider "aws" {
  region = "us-east-1"
}

#VPC 
resource "aws_vpc" "asg" {
  cidr_block = "10.111.0.0/16"
}

#Subnet Public
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.asg.id
  cidr_block        = "10.111.1.0/24"
  availability_zone = "us-east-1a"
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.asg.id
}

#Route Tables
#Public Route table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.asg.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#Create route table associations
#Associate public Subnet to public route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}