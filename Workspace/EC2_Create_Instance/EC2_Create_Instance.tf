
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration Options
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami = "ami-051a31ab2f4d498f5" # Specify the AMI ID
  instance_type = "t2.nano"
}

# Optional: Output the EC2 ID
output "example" {
  value = aws_instance.example.id
  description = "The ID of EC2 Instance."
}
