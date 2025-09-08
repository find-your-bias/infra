
resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "doddegowdanv"

  user_data = templatefile("${path.module}/setup.sh", {
    runner_token = var.runner_token
  })

  tags = {
    Name = "find-your-bias-machine"
  }
}
