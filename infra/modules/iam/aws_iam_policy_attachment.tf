resource "aws_iam_policy_attachment" "glue_attach" {
  name       = "${var.app_name}-ecr-attach"
  roles      = ["${aws_iam_role.glue_execution_role.name}"]
  policy_arn = aws_iam_policy.glue_execution_policy.arn
}

resource "aws_iam_policy_attachment" "athena_attach" {
  name       = "${var.app_name}-ecr-attach"
  roles      = ["${aws_iam_role.athena_execution_role.name}"]
  policy_arn = aws_iam_policy.athena_execution_policy.arn
}
