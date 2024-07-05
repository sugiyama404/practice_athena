terraform {
  required_version = "=1.8.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3" {
  source          = "./modules/s3"
  app_name        = var.app_name
  region          = var.region
  source_dir_name = var.source_dir_name
}

module "iam" {
  source           = "./modules/iam"
  app_name         = var.app_name
  s3_bucket_bucket = module.s3.s3_bucket_bucket
}

module "glue" {
  source           = "./modules/glue"
  s3_bucket_bucket = module.s3.s3_bucket_bucket
  source_dir_name  = var.source_dir_name
}

module "athena" {
  source             = "./modules/athena"
  source_dir_name    = var.source_dir_name
  result_dir_name    = var.result_dir_name
  s3_bucket_id       = module.s3.s3_bucket_id
  glue_database_name = module.glue.glue_database_name
  glue_table_name    = module.glue.glue_table_name
}

