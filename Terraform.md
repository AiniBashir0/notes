# Installation:

### AWS account:
- Create a ec2-instance- allow http and lunch
- Create a IAM user- create access key- go to mobaxterm yum -y install awscli, cd .aws, run "aws configure"- add access key- "aws iam list-users"
- Go to terraform.io- install-amazon linux- run the given commands
- Check terraform --version and aws --version
- create first-server.tf file
- Terraform init
- Terraform apply
- [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance.html)


# Webserver playbook
provider "aws" {
        region = "eu-north-1"
}

# creating a security group, allow ssh and httpd
resource "aws_security_group" "security-1" {
        name = "security-1"
        description = "allowing ssh and httpd"

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
               from_port = 0
               to_port = 0
               protocol = "-1"
               cidr_blocks = ["0.0.0.0/0"]
        }
}
# creating instance

resource "aws_instance" "webserver" {
  ami = "ami-00f34bf9aeacdf007"
  instance_type = "t3.micro"
  availability_zone = "eu-north-1a"
  security_groups = ["${aws_security_group.security-1.name}"]
  key_name = "key1"
  user_data = <<-EOF
          #!/bin/bash
          sudo yum update -y
          sudo yum install -y httpd
          sudo systemctl start httpd
          sudo systemctl enable httpd
          echo "<html><h1>Welcome Home!</h1></html>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "webserver"
  }
}
