resource "aws_security_group" "website_security_group" {
  name = "website_SG"
  description = "this is the security group of website."
  vpc_id = aws_vpc.main.id

  ingress = [
    {
      description         = "HTTPS from VPS"
      from_port           = 443
      to_port             = 443
      protocol            = "tcp"
      cidr_blocks         = ["0.0.0.0/0"]
      ipv6_cidr_blocks    = ["::/0"]
    },
    {
      description         = "HTTP from VPS"
      from_port           = 80
      to_port             = 80
      protocol            = "tcp"
      cidr_blocks         = ["0.0.0.0/0"]
      ipv6_cidr_blocks    = ["::/0"]
    },
    {
      description         = "SSH from VPC "
      from_port           = 22
      to_port             = 22
      protocol            = "tcp"
      cidr_blocks         = ["0.0.0.0/0"]
      ipv6_cidr_blocks    = ["::/0"]
    }
  ]

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  tags = {
    Name = "WebsiteSecurityGroup"
  }
}