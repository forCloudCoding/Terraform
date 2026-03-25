

# Provider :
  Specify the Infra Providers, TLS, Local & AWS.
```
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
```
  
# Specify Region :
  Specify the Default Infra Region to use.
```
provider "aws" {
  # Configuration Options
  region = "ap-south-1"
}
```
# Create TLS Private Key :
  Mention the Name of the TLS Private Key to be created, also mention the Algorithm to use.
```
resource "tls_private_key" "test-key-2" {
  algorithm = "RSA"
}
```
  
# Create Local File :
  Mention the Name of the Local File to be created, also mention the File Permissions.
```
resource "local_file" "private_key_pem" {
  content = tls_private_key.test-key-2.private_key_pem
  filename = "my-private-pem.pem"
  file_permission = "0600"
}
```
Terraform cannot natively create a key pair in the proprietary .ppk format because it expects standard OpenSSH formats (i.e., PEM File).
The .ppk (PuTTY Private Key) format is specific to the PuTTY utility on Windows and is not a standard, portable key format for most Infrastructure Automation Tools.

# Register Key Pair in AWS Account :
  Register the Key Pair in the AWS Account, also mention the name of the Key Pair.
```
resource "aws_key_pair" "my-test-key" {
  key_name = "my-test-key"
  public_key = tls_private_key.test-key-2.public_key_openssh
}
```

