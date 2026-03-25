
terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
    local = {
      source = "hashicorp/local"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "tls_private_key" "test-key-2" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content = tls_private_key.test-key-2.private_key_pem
  filename = "my-private-pem.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "my-test-key" {
  key_name = "my-test-key"
  public_key = tls_private_key.test-key-2.public_key_openssh

}
