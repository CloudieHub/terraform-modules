output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC id"
}

output "public_subnet_ids" {
  value       = values(aws_subnet.public).*id
  description = "List of public subnet ids"
}

output "private_subnet_ids" {
  value       = values(aws_subnet.private).*id
  description = "List of private subnet ids"
}

output "nat_gateway_ids" {
  value       = var.enable_nat_gateway ? aws_nat_gateway.nat.*.id : []
  description = "NAT Gateway ids (if enabled)"
}

