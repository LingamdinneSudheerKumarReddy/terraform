resource "aws_security_group" "base" {
  vpc_id     = aws_vpc.base.id
  name       = var.aws_securitygroup.name
  depends_on = [aws_vpc.base]
}

resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.aws_securitygroup.rules)
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = var.aws_securitygroup.rules[count.index].cidr_ipv4
  from_port         = var.aws_securitygroup.rules[count.index].from_port
  to_port           = var.aws_securitygroup.rules[count.index].to_port
  ip_protocol       = var.aws_securitygroup.rules[count.index].ip_protocol

}

resource "aws_vpc_security_group_egress_rule" "base" {
  count             = length(var.aws_egressrules)
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = var.aws_egressrules[count.index].cidr_ipv4
  from_port         = var.aws_egressrules[count.index].from_port
  to_port           = var.aws_egressrules[count.index].to_port
  ip_protocol       = var.aws_egressrules[count.index].ip_protocol

}

resource "aws_key_pair" "base" {
  key_name   = var.aws_keypair.name
  public_key = file(var.aws_keypair.public_path)

}