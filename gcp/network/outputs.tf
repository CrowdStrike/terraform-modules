output "network-name" {
  description = "The Name of the Network"
  value       = google_compute_network.vpc-network.name
}

output "private-subnet-1-name" {
  description = "The Name of Private Subnet 1"
  value       = google_compute_subnetwork.vpc-private-subnet-1.name
}
output "private-subnet-2-name" {
  description = "The Name of Private Subnet 2"
  value       = google_compute_subnetwork.vpc-private-subnet-2.name
}
output "private-subnet-3-name" {
  description = "The Name of Private Subnet 3"
  value       = google_compute_subnetwork.vpc-private-subnet-3.name
}
output "public-subnet-1-name" {
  description = "The Name of Public Subnet 1"
  value       = google_compute_subnetwork.vpc-public-subnet-1.name
}
output "public-subnet-2-name" {
  description = "The Name of Public Subnet 2"
  value       = google_compute_subnetwork.vpc-public-subnet-2.name
}
output "puyblic-subnet-3-name" {
  description = "The Name of Public Subnet 3"
  value       = google_compute_subnetwork.vpc-public-subnet-3.name
}

output "private-subnet-1-cidr" {
  description = "The CIDR of Private Subnet 1"
  value       = google_compute_subnetwork.vpc-private-subnet-1.ip_cidr_range
}
output "private-subnet-2-cidr" {
  description = "The CIDR of Private Subnet 2"
  value       = google_compute_subnetwork.vpc-private-subnet-2.ip_cidr_range
}
output "private-subnet-3-cidr" {
  description = "The CIDR of Private Subnet 3"
  value       = google_compute_subnetwork.vpc-private-subnet-3.ip_cidr_range
}
output "public-subnet-1-cidr" {
  description = "The CIDR of Public Subnet 1"
  value       = google_compute_subnetwork.vpc-public-subnet-1.ip_cidr_range
}
output "public-subnet-2-cidr" {
  description = "The CIDR of Public Subnet 2"
  value       = google_compute_subnetwork.vpc-public-subnet-2.ip_cidr_range
}
output "puyblic-subnet-3-cidr" {
  description = "The CIDR of Public Subnet 3"
  value       = google_compute_subnetwork.vpc-public-subnet-3.ip_cidr_range
}