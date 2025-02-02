variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region (e.g. us-west2)"
  type        = string
  default     = "eu-west1"
}

variable "location" {
  description = "Location for GCS and BigQuery resources"
  type        = string
  default     = "EU"
}

variable "random_string" {
  description = "Random string ID for generating unique names"
  type        = string
  default     = "1234567890"
}
