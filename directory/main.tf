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

resource "aws_instance" "example_new" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    
    user_data = <<-EOF
       #!/bin/bash
       echo "Hello, World" > index.html
       nohup busybox httpd -f -p 8080 &
       EOF
    tags = {
        Name = "terraform-learn-state-ec2-1"
    }  

}
