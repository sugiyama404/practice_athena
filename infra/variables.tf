variable "app_name" {
  description = "application name"
  type        = string
  default     = "chatbot"
}

variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-northeast-1"
}

variable "source_dir_name" {
  description = "Name of the directory to create resources in"
  type        = string
  default     = "sources"
}

variable "result_dir_name" {
  description = "Name of the directory to create results in"
  type        = string
  default     = "results"
}
