
terraform {
  required_providers {
    aws = {}
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Data Source to get the Default VPC
data "aws_vpc" "default" {
  default = true
}

# Create Security Group
resource "aws_security_group" "datacenter_sg" {
  name        = "datacenter-sg"
  description = "Security Group for App"
  vpc_id      = data.aws_vpc.default.id

  # HTTP Inbound Rule
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH Inbound Rule
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Default Egress Rule ( Outbound Traffic - all allowed )
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags
  tags = {
    Name = "datacenter-sg"
  }
}
