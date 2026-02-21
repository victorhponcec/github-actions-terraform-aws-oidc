resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "SecureString"
  value = "bar"
}
