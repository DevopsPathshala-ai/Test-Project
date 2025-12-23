output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.test.id
}
output "public_subnet_ids" {
  description = "Map of public subnet IDs"
  value = {
    for k, s in aws_subnet.public :
    k => s.id
  }
}
output "private_subnet_ids" {
  description = "Map of private subnet IDs"
  value = {
    for k, s in aws_subnet.private :
    k => s.id
  }
}
