resource "aws_ssm_parameter" "foo" {
  #COMMENTEDcheckov:skip=CKV_AWS_337: Using AWS managed key is acceptable for this project
  name  = "foo"
  type  = "SecureString"
  value = "bar"
}