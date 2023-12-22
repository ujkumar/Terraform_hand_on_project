terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" { 
  region = "us-east-1" 
  }


# Creating an EC2 instance for hosting an website.
  # Step1 : provide and AMI.
  # Step2 : provide an instance type.
  # Step3 : create an security group in seperate file and use that security group in ec2 instance.
  # Step4 : create an key-pair in seperate file and tag to this ec2 instance.
  # Step5 : provide an tag for ec2 instance.
  # Step6 : 

resource "aws_ec2_instance" "website" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  security_group_name = [aws_security_group.website_security_group.name]
  tags = {
    Name = "Website_page_instance"
  }
  
}

