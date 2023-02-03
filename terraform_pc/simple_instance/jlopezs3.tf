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


resource "aws_s3_bucket_server_side_encryption_configuration" "jlopezs3" {
  bucket = aws_s3_bucket.jlopezs3.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "jlopezs3" {
  bucket = aws_s3_bucket.jlopezs3.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
