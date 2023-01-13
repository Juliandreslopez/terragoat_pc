provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "jlopezbay" {
  bucket_prefix = "jlopez-bay-storage-"

  tags = {
    Name                 = "JLopez Bay"
    Environment          = "Dev"
  }
}
