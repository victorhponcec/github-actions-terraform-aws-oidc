terraform {
  backend "s3" {
    bucket         = "victor-terraform-states"
    key            = "aws-asg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}