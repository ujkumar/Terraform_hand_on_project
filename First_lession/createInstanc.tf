provider "aws" {
  access_key = "Enter your access key"
  secret_key = "Enter your secret key"
  region = "us-east-1"
}

resource "aws_instance" "Terraform_created_instance" {
  ami           = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"
}