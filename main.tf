#checkov:skip=CKV_AWS_337: Using AWS managed key is acceptable for this project
resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "SecureString"
  value = "bar"
}