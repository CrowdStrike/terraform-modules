variable "falcon_client_id" {
  type = string
  description = "Your Falcon API Client Id"
}
variable "falcon_client_secret" {
  type = string
  description = "Your Falcon API Client Secret"
}
variable "cluster_name" {
  type = string
  description = "Your Cluster Name"
}
variable "falcon_docker_api_token" {
  type = string
  description = "Falcon Docker API Token"
}
variable "falcon_cid" {
  type = string
  description = "Your Falcon CID, all lower with no checksum"
}
variable "falcon_env" {
  type = string
  description = "us-1, us-2 or eu-1"
}
