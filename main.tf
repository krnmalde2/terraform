provider "aws" {
    region = "ap-south-1"
  
}

variable "cidr_block" {
  description = "cidr_block"
}

variable "availzone" {}


resource "aws_vpc" "devlopemnt_vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name: "development"
        
    }
}

resource "aws_subnet" "dev-subnet-1"{
    vpc_id = aws_vpc.devlopemnt_vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = var.availzone
    tags = {
        Name: "subnet-dev-1"
    }
}

# data "aws_vpc" "existing-vpc" {
#     default = true

# }

# resource "aws_subnet" "dev-subnet-2"{
#     vpc_id = data.aws_vpc.existing-vpc.id
#     cidr_block = "172.31.48.0/20"
#     availability_zone = "ap-south-1a"
#     tags = {
#         Name: "subnet-default"
#     }
# }










