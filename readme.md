
# Provider :
  Specify the Infra Provider, AWS in this case.
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
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
# Create S3 Bucket :
  Mention the Name of the S3 Bucket to be created, also mention the Tags to bind with the Infra Resource.
```
resource "aws_s3_bucket" "tf-test-tech-dev-bucket" {
  bucket = "my-tf-test-tech-dev-bucket-1029"

  tags = {
    Name        = "My Bucket 2.0"
    Environment = "Dev"
  } 
}
```
  
# Display Output :
  Display the created S3 Bucket.
```
output "s3_bucket_name" {
  value = aws_s3_bucket.tf-test-tech-dev-bucket.id
  description = "The name of the S3 Bucket."
}
```
