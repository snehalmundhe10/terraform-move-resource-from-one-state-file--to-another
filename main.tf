terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 3.24.1"
        }
    }
    required_version = "~>  1.0.5"
}

provider "aws" {
 region = var.instance_region
}

resource "aws_instance" "example" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg_8080.id]
    user_data = <<-EOF
       #!/bin/bash
       echo "Hello, World" > index.html
       nohup busybox httpd -f -p 8080 &
       EOF
    tags = {
        Name = "terraform-learn-state-ec2-1"
    }  
}

resource "aws_security_group" "sg_8080" {
   name = "terraform-learn-state-sg"
   ingress {
       from_port = "8080"
       to_port = "8080"
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
}
