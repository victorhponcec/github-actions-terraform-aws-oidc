#Security Group
resource "aws_security_group" "web_asg" {
  name        = "web"
  description = "allow web traffic"
  vpc_id      = aws_vpc.asg.id
}
#ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_443_asg" {
  security_group_id = aws_security_group.web_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
#ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_80_asg" {
  security_group_id = aws_security_group.web_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
#ingress rule for Security Group
resource "aws_vpc_security_group_ingress_rule" "allow_icmp_asg" {
  security_group_id = aws_security_group.web_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
}
#egress rule for Security Group
resource "aws_vpc_security_group_egress_rule" "egress_all_asg" {
  security_group_id = aws_security_group.web_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}