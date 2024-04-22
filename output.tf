output "public_ip" {
    value = [aws_instance.ec1[*].public_ip]
  
}
output "security" {
    value = [aws_instance.ec1[*].security_groups]
}
output "private_ip" {
    value = [aws_instance.ec1[*].private_ip]
}
