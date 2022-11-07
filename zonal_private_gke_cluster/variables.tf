variable "google_project" {}
variable "google_zone" {}

variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "max_node_count" {
  type = number
  default = 1
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}