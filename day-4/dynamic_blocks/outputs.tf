output "instance_details" {
  value = {
    instance_name = aws_instance.minha-ec2.tags["Name"]
    public_ip     = aws_instance.minha-ec2.public_ip
  }
}
