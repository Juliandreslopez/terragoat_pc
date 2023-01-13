provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "jlopezs3" {
  bucket_prefix = "jlopez-s3-storage-"

  tags = {
    Name                 = "JLopez S3"
    Environment          = "Dev"
  }
}
