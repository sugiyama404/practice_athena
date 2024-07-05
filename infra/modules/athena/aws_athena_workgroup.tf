resource "aws_athena_workgroup" "main" {
  name = "main"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${var.s3_bucket_id}/${var.result_dir_name}/"
    }
  }

  force_destroy = true
}
