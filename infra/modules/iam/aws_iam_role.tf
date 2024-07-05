# Create IAM role for Glue
resource "aws_iam_role" "glue_execution_role" {
  name = "glue_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.app_name}-glue-iam-role"
  }
}

# Create IAM role for Athena
resource "aws_iam_role" "athena_execution_role" {
  name = "athena_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "athena.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.app_name}-athena-iam-role"
  }
}
