variable "alias" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "gke_num_nodes" {
  type = number
  default     = 2
  description = "number of gke nodes"
}