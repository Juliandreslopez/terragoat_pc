provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dockingbay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
  }
}


resource "aws_s3_bucket" "dockingbay_log_bucket" {
  bucket = "dockingbay-log-bucket"
}

resource "aws_s3_bucket_logging" "dockingbay" {
  bucket = aws_s3_bucket.dockingbay.id

  target_bucket = aws_s3_bucket.dockingbay_log_bucket.id
  target_prefix = "log/"
}
