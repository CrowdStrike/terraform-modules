# Falcon Operator
https://github.com/CrowdStrike/falcon-operator

## Usage
```
module "logical-name" {
    source = "github.com/ryanjpayne/cs-tf-modules/falcon/falcon-operator"

    endpoint = kubernetes cluster endpoint
    client-cert = kubernetes cluster master_auth.0.client_certificate
    client-key = kubernetes cluster master_auth.0.client_key
    ca-cert = kubernetes cluster master_auth.0.cluster_ca_certificate
}
```