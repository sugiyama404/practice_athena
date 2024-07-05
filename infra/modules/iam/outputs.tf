output "iam_role_glue_arn" {
  value = aws_iam_role.glue_execution_role.arn
}

output "iam_role_athena_arn" {
  value = aws_iam_role.athena_execution_role.arn
}
