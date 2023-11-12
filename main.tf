variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "jenkins_server" {
  # ... (unchanged)

  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "terraformkeypair"
  security_groups = ["Mysecuritygroup"]

  tags = {
    Name = "jenkins server"
  }
}

resource "aws_instance" "ansible_server" {
  # ... (unchanged)

  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "terraformkeypair"
  security_groups = ["Mysecuritygroup"]

  tags = {
    Name = "ansible server"
  }
}

resource "aws_instance" "app_server" {
  # ... (unchanged)

  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.medium"
  key_name      = "terraformkeypair"
  security_groups = ["Mysecuritygroup"]

  tags = {
    Name = "app server"
  }
}

output "jenkins_server_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "jenkins_server_dns" {
  value = aws_instance.jenkins_server.public_dns
}

output "ansible_server_ip" {
  value = aws_instance.ansible_server.public_ip
}

output "ansible_server_dns" {
  value = aws_instance.ansible_server.public_dns
}

output "app_server_ip" {
  value = aws_instance.app_server.public_ip
}

output "app_server_dns" {
  value = aws_instance.app_server.public_dns
}
