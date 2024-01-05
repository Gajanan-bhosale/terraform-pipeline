output "id" {
  value = aws_instance.mynewinstance.id
}

output "public_ip" {
  value = aws_instance.mynewinstance.public_ip
}

output "key_name" {
  value = aws_instance.mynewinstance.key_name
}