# Create a Glue Data Catalog Table for the CSV files
resource "aws_glue_catalog_table" "main" {
  name          = "main_table"
  database_name = aws_glue_catalog_database.main.name

  storage_descriptor {
    columns {
      name = "name"
      type = "string"
    }

    columns {
      name = "path"
      type = "string"
    }

    columns {
      name = "action"
      type = "string"
    }

    columns {
      name = "timestamp"
      type = "string"
    }

    location      = "s3://${var.s3_bucket_bucket}/${var.source_dir_name}"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
    compressed    = false

    ser_de_info {
      name                  = "main"
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"
      parameters = {
        "field.delim" = ","
        "quoteChar"   = "\""
        "escapeChar"  = "\\"
      }
    }
  }
  table_type = "EXTERNAL_TABLE"
  parameters = {
    "classification"         = "csv"
    "skip.header.line.count" = "1"
  }
}
