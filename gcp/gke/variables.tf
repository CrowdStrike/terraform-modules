variable "alias" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc-name" {
  type = string
}

variable "subnet-name" {
  type = string
}

variable "gke-num-nodes" {
  type = number
  default     = 2
  description = "number of gke nodes"
}