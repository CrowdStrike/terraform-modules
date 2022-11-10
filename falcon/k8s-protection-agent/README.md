# CrowdStrike Kubernetes Protection Agent

## Introduction

‌Kubernetes Protection provides end-to-end visibility into your EKS, AKS, and self-managed clusters. You can see high-level trends and hierarchical views for a comprehensive picture of your Kubernetes system. ‌

This module allows you to easily deploy the Kubernetes Protection Agent on your Kubernetes Clusters via Helm.

## Prerequisites


1. Helm must be installed in your terminal and the following must be run on the host where Terraform is executed.
```
helm repo add kpagent-helm https://registry.crowdstrike.com/kpagent-helm && helm repo update
```

2. You need a CrowdStrike API Client ID and Client Secret with:  
- Kubernetes Protection Agent scope and write permission.
- Kubernetes Protection scope and read and write permission.

3. You need a CrowdStrike Docker API Token.

## Version Requirements
| Name | Version |
|------|---------|
| Terraform | >= 1.0.0 |
| Helm | >= 2.4.1 |

## Provider Config

The Helm provider is used to deploy the Protection Agent in Kubernetes. The provider needs to be configured with the proper credentials before this module can be used.  Below are a few examples per Cloud Provider:

### GCP
```
provider "helm" {
  kubernetes {
    host                   = "https://${my-cluster-endpoint}"
    cluster_ca_certificate = "${base64decode(my-cluster-ca-certificate)}"
    token                  = data.google_client_config.default.access_token
  }
}
```
### AWS
```
provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
```
### Other
```
provider "helm" {
  kubernetes {
    host     = "https://cluster_endpoint:port"

    client_certificate     = file("~/.kube/client-cert.pem")
    client_key             = file("~/.kube/client-key.pem")
    cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
  }
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| protection-agent-config | Values for Helm Chart | String | Yes |

Example:
```
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


## Example Usage

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

module "protection-agent" {
    source = "github.com/crowdstrike/terraform-modules/falcon/k8s-protection-agent"
    protection-agent-config = var.protection-agent-config
}
```
