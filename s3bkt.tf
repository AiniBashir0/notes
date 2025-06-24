tags = {
    Name = "webserver"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "aini-unique-2025-bucket"

  tags = {
    Name        = "My bucket"
  }
}
