resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/src/ s3://${aws_s3_bucket.main.id}/${source_dir_name}"
  }
  depends_on = [aws_s3_bucket.main]
}
