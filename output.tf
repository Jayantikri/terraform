

output "vpc_ipd" {
    description = "This is vpc id"
    value = [aws_vpc.myvpc.id]
}
output "link" {
    value = aws_lb.mylb.dns_name
}    
