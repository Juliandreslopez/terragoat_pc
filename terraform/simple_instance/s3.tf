provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "jlopezs3" {
  bucket_prefix = "jlopez-s3-storage-"

  tags = {
    Name                 = "JLopez S3"
    Environment          = "Dev"
  }
}


resource "aws_s3_bucket_versioning" "jlopezs3" {
  bucket = aws_s3_bucket.jlopezs3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "destination" {
  bucket = aws_s3_bucket.jlopezs3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_iam_role" "replication" {
  name = "aws-iam-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_replication_configuration" "jlopezs3" {
  depends_on = [aws_s3_bucket_versioning.jlopezs3]
  role   = aws_iam_role.jlopezs3.arn
  bucket = aws_s3_bucket.jlopezs3.id
  rule {
    id = "foobar"
    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}