output "IAM_role_arn" {
  value = aws_iam_role.first_role.arn
}

output "IAM_role_name" {
  value = aws_iam_role.first_role.name
}

output "IAM_policy_arn" {
  value = aws_iam_policy.my_policy.arn
}

output "IAM_policy_name" {
  value = aws_iam_policy.my_policy.name
}













