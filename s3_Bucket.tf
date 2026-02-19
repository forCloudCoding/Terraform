
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

#Create a S3 Bucket
resource "aws_s3_bucket" "tf-test-tech-dev-bucket" {
  bucket = "my-tf-test-tech-dev-bucket-1029"

  tags = {
    Name        = "My Bucket 2.0"
    Environment = "Dev"
  } 
}

# Optional: Output the S3 Name
output "s3_bucket_name" {
  value = aws_s3_bucket.tf-test-tech-dev-bucket.id
  description = "The name of the S3 Bucket."
}
