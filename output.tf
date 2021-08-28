output "public_ip" {
    value = aws_instance.example.public_ip
    description = "the public ip of the web server"
}
output "instance_id"{
    value = aws_instance.example.id
    description = "the instance id of the web server"
}
output "security_group" {
  value = aws_security_group.sg_8080.id
}
