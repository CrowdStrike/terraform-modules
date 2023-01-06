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
  default     = 1
  description = "number of gke nodes"
}

# Allowed Values: UBUNTU_CONTAINERD or COS_CONTAINERD
variable "node_os" {
  type = string
  default = "UBUNTU_CONTAINERD"
}

variable "autopilot" {
  type = bool
  default = false
}

variable "resource_labels" {
  type = map
  default = {
    cstag-environment = "pov"
  }
}
