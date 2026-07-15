output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.app.id
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.app.public_ip
}

output "application_url" {
  description = "Application URL"
  value       = "http://${aws_instance.app.public_ip}"
}

output "jenkins_url" {
  description = "Jenkins URL"
  value       = "http://${aws_instance.app.public_ip}:8080"
}
