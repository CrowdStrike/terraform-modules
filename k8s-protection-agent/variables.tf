# Falcon CID must be all lower -3
variable "falcon-cid" {
    type = string
}
variable "falcon-cloud" {
    type = string
}

# Falcon credentials
variable "client-id" {
    type = string
}
variable "client-secret" {
    type = string
}

# Docker API Token for K8S Cluster Registration
variable "docker-token" {
    type = string
}

# EKS Cluster information to configure Helm provider
variable "cluster-endpoint" {
    type = string
}
variable "cluster-ca-cert" {
    type = string
}
variable "cluster-name" {
    type = string
}
variable "cluster-arn" {
    type = string
}

# Environment or 'Alias' tag
variable "environment" {
    type = string
}