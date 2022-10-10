
# Rename this to credentials.tf and fill in these vars

variable "project_id" {
  description = "Project ID"
  type        = string
  default     = "your_project_id"
}

variable "region" {
  description = "Project region"
  type        = string
  default     = "europe-north1"
}
