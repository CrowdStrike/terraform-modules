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
    host                   = "https://${my-cluster-endpoint}"
    cluster_ca_certificate = base64decode(my-cluster-ca-certificate)
    token                  = data.aws_eks_cluster_auth.cluster-auth.token
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
| falcon_client_id | Your Falcon API Client Id | String | Yes |
| falcon_client_secret | Your Falcon Client Secret | String | Yes |
| cluster_name | Your Cluster Name | String | Yes |
| falcon_docker_api_token | Falcon Docker API Token | String | Yes |
| falcon_cid | Your Falcon CID, all lower with no checksum | String | Yes |
| falcon_env | us-1, us-2 or eu-1 | String | Yes |



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

module "protection-agent" {
    source = "github.com/crowdstrike/terraform-modules/falcon/k8s-protection-agent"
    
    falcon_client_id = ""
    falcon_client_secret = ""
    cluster_name = "my-cluster"
    falcon_docker_api_token = ""
    falcon_cid = ""
    falcon_env = "us-1"
}
```
