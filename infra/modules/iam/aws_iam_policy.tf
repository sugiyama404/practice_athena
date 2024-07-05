# Attach IAM policy to the Glue role
resource "aws_iam_policy" "glue_execution_policy" {
  name = "glue_execution_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_bucket}/*",
          "arn:aws:s3:::${var.s3_bucket_bucket}"
        ]
      },
      {
        Action = [
          "glue:GetTable",
          "glue:GetTableVersion",
          "glue:GetTableVersions",
          "glue:GetDatabase"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach IAM policy to the Athena role
resource "aws_iam_policy" "athena_execution_policy" {
  name = "athena_execution_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_bucket}/*",
          "arn:aws:s3:::${var.s3_bucket_bucket}"
        ]
      },
      {
        Action = [
          "glue:GetTable",
          "glue:GetTableVersion",
          "glue:GetTableVersions",
          "glue:GetDatabase"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "logs:CreateLogGroup"
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:logs:*:*:log-group:/aws/athena/*",
          "arn:aws:logs:*:*:log-group:/aws/athena/*:log-stream:*"
        ]
      }
    ]
  })
}
