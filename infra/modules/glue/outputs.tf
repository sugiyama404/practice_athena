output "glue_database_name" {
  value = aws_glue_catalog_database.main.name
}

output "glue_table_name" {
  value = aws_glue_catalog_table.main.name
}
