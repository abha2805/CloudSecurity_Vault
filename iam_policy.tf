resource "aws_iam_policy" "my_policy" {
  name        = "my_policy"
  description = "A test policy"
  
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:CreateVpc"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

