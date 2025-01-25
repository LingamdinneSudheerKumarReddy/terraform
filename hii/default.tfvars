vpc_cidr = "192.168.0.0/16"
private_subnets = [{
  Name              = "app-1"
  cidr_block        = "198.168.1.0/24"
  availability_zone = "us-east-1a"
  },
  {
    Name              = "app-1"
    cidr_block        = "198.168.2.0/24"
    availability_zone = "us-east-2a"

  },
  {
    Name              = "app-1"
    cidr_block        = "198.168.3.0/24"
    availability_zone = "us-east-3a"
}]


public_subnets = [{
  Name              = "web-1"
  cidr_block        = "198.168.1.0/24"
  availability_zone = "us-east-1a"
  },
  {
    Name              = "web-2"
    cidr_block        = "198.168.2.0/24"
    availability_zone = "us-east-2a"

  },
  {
    Name              = "web-4"
    cidr_block        = "198.168.3.0/24"
    availability_zone = "us-east-3a"
}]

aws_securitygroup = {
  name = "websg"
  rules = [{

    from_port = 80
    to_port   = 80

  }]

}

aws_egressrules = [{
  from_port = 0
  to_port   = 65535
}]

aws_keypair = {
  name = "devolper"

}

aws_webserver_info = {
  name = "nginx"
  ami_filter = {

  }
}