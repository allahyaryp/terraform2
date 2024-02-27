
provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"
  
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2     = "http://localhost:4566"
  }
}
variable "sub_cidr_block" {
  description = "subnet  cidr block"
  
}

resource "aws_vpc" "localstack_vpc" {
  cidr_block                       = var.sub_cidr_block
  tags = {
    Name = "localstack_vpc"
  }
}

resource "aws_subnet" "localstack_vpc_subnet" {
  vpc_id     = aws_vpc.localstack_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags ={
    Name = "localstack_vpc_subnet2"
  }
 
}
data "aws_vpc"  "existing_vpc"{
  default = true
}

resource "aws_subnet" "sub2" {
   vpc_id     = data.aws_vpc.existing_vpc.id
   cidr_block = "172.31.96.0/20"
   availability_zone = "us-east-1a"

  
}

output "sub2" {
  value = aws_subnet.sub2.availability_zone 
  
}