
variable "alias" {
  type = string
}
variable "resource_group" {
  type = string
}
variable "location" {
  type = string
}

variable "cluster_name" {
  type = string
}
variable "kubernetes_version" {
  type = string
  default = "1.23.12"
}
variable "aks_num_nodes" {
  type = number
  default = 1
}
variable "aks_min_nodes" {
  type = number
  default = 1
}
variable "aks_max_nodes" {
  type = number
  default = 1
}
variable "node_vm_size" {
  type = string
  default = "Standard_B4ms"
}
variable "os_sku" {
  type = string
  default = "Ubuntu"
}