## Usage
```
module "logical-name" {
  source = "github.com/ryanjpayne/cs-tf-modules/falcon/k8s-protection-agent"
  
  falcon-cid = ""
  falcon-cloud = ""
  client-id = ""
  client-secret = ""
  docker-token = ""
  cluster-arn = ""
  environment = ""
}
```

## Provider Config
```
provider "helm" {
  kubernetes {
    host                   = var.cluster-endpoint
    cluster_ca_certificate = base64decode(var.cluster-ca-cert)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster-name]
      command     = "aws"
    }
  }
}
```
