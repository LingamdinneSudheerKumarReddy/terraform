variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"

}
variable "private_subnets" {
  type = list(object({
    Name              = string
    cidr_block        = string
    availability_zone = string
  }))

}



variable "public_subnets" {
  type = list(object({
    Name              = string
    cidr_block        = string
    availability_zone = string
  }))


}

variable "aws_securitygroup" {
  type = object({
    name = string
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")

    }))
  })

}

variable "aws_egressrules" {
  type = list(object({
    cidr_ipv4   = optional(string, "0.0.0.0/0")
    from_port   = number
    to_port     = number
    ip_protocol = optional(string, "-1")
  }))

}

variable "aws_keypair" {
  type = object({
    name        = string
    public_path = optional(string, "~/.ssh/id_rsa.pub")
  })

}

variable "aws_webserver_info" {
  type = object({
    name = string
    ami_filter = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
      owner = optional(string, "099720109477")
    })
    instancetype        = optional(string, "t2.micro")
    associate_public_ip = optional(bool, true)
  })

}