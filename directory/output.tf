output "public_ip" {
    value = aws_instance.example_new.public_ip
    description = "the public ip of the web server"
}
output "instance_id"{
    value = aws_instance.example_new.id
    description = "the instance id of the web server"
}

