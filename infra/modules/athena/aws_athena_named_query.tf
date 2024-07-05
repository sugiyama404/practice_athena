resource "aws_athena_named_query" "main" {
  name        = "my_athena_query"
  database    = var.glue_database_name
  workgroup   = aws_athena_workgroup.main.id
  description = "This query selects all columns from the ${var.glue_table_name} table."

  query = <<EOF
SELECT name, COUNT(*) AS visit_count
FROM ${var.glue_table_name}
GROUP BY name
ORDER BY visit_count DESC;
EOF
}
