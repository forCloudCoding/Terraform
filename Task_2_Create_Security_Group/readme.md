

# Task Description :
In the default VPC, create a Security Group with the below Protocol Rules :

1. The name of the Security Group must be datacenter-sg.
2. The description must be "Secuirty Group for App Server."
3. Inbound Rule of type HTTP, with a Port Range of 80, and source CIDR Range 0.0.0.0/0
4. Inbound Rule of type SSH, with a Port Range of 80, and source CIDR Range 0.0.0.0/0
5. AWS Region : Asia Pacific (Mumbai) Region


# Provider :
  Specify the Infra Provider AWS.
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
```
  
# Specify Region :
  Specify the Default Infra Region to use.
```
provider "aws" {
  # Configuration Options
  region = "ap-south-1"
}
```
# Create Security Group :
  Create the Security Group with the required Ingress and Egress Rules.
```
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

```


