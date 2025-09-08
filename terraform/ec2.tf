resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  # No security group specified = uses default
  user_data = file("${path.module}/setup.sh")
  tags = {
    Name = "find-your-bias-machine"
  }
}