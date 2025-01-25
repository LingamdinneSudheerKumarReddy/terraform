data "aws_ami" "webimage" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.aws_webserver_info.ami_filter.name]
  }


  owners = [var.aws_webserver_info.ami_filter.owner] # Canonical
}





