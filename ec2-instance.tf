provider "aws" {
        region = "eu-north-1"
}

resource "aws_instance" "vm102" {
  ami = "ami-00f34bf9aeacdf007"
  instance_type = "t3.micro"
  tags = {
    Name = "test-spot"
  }
}
