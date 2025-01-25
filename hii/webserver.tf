resource "aws_instance" "web" {

  ami                         = data.aws_ami.webimage.id
  instance_type               = var.aws_webserver_info.instancetype
  associate_public_ip_address = var.aws_webserver_info.associate_public_ip
  key_name                    = var.aws_keypair.name
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.base.id]
  user_data                   = file("install.sh")

  depends_on = [
    aws_key_pair.base,
    aws_subnet.public,
    aws_security_group.base

  ]
  tags = {
    Name = var.aws_webserver_info.name
  }

}







