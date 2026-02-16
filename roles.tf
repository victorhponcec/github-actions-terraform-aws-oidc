#Enable SSM on EC2 (pass IAM ROLE AmazonSSMManagedInstanceCore to EC2)
#Create IAM role/Trust Policy
resource "aws_iam_role" "ssm_role_asg" {
  name = "ssm_role_asg"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#attach Permission Policy to Trust Policy (role)
resource "aws_iam_role_policy_attachment" "ssm_attach_asg" {
  role       = aws_iam_role.ssm_role_asg.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#create instance profile
resource "aws_iam_instance_profile" "ssm_profile_asg" {
  name = "SSMInstanceProfile_asg"
  role = aws_iam_role.ssm_role_asg.name
}