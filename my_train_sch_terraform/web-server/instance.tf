resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  vpc_security_group_ids      = [aws_security_group.allow_ssh_http.id]
  associate_public_ip_address = true 

  user_data = <<-EOF
      #!/bin/bash
      set -ex
      sudo yum update -y
      sudo amazon-linux-extras install docker -y
      sudo service docker start
      sudo usermod -a -G docker ec2-user
      sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      sudo docker run -d -p 8096:8080 dzhovid/train-schedule:v3
    EOF
  tags = {
    Name = "${var.prefix}-web_server"
  }
}