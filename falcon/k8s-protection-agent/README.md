# Usage

## Prerequisites
```
helm repo add kpagent-helm https://registry.crowdstrike.com/kpagent-helm && helm repo update
```

## Provider Config
```
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 4.41.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.4.1"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)

  project = var.project
  region  = var.region
}

data "google_client_config" "default" {
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.cluster-endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = "${base64decode(module.gke.cluster-ca-certificate)}"
  }
}
```

## Module Block
```
module "protection-agent" {
    source = "github.com/ryanjpayne/cs-tf-modules/falcon/k8s-protection-agent"
    protection-agent-config = var.protection-agent-config
}

variable "protection-agent-config" {
    default = <<EOF
crowdstrikeConfig:
  clientID: [falcon-client-id]
  clientSecret: [falcon-client-secret]
  clusterName: [gke-cluster-name]
  dockerAPIToken: [falcon-docker-token]
  cid: [falcon-cid] # all lower with no checksum
  env: [falcon-cloud] # us-1, us-2 or eu-1
EOF
}
```