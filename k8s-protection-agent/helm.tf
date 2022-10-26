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

# run this first: `helm repo add kpagent-helm https://registry.crowdstrike.com/kpagent-helm && helm repo update`
resource "helm_release" "kpagent" {
  name  = "kpagent"
  chart = "kpagent-helm/cs-k8s-protection-agent"
  namespace = "falcon-kubernetes-protection"
  values = [
    "crowdstrikeConfig:",
    "  clientID: ${var.client-id}",
    "  clientSecret: ${var.client-secret}",
    "  clusterName: ${var.cluster-arn}",
    "  dockerAPIToken: ${var.docker-token}",
    "  cid: ${var.falcon-cid}",
    "  env: ${var.falcon-cloud}"
  ]
}
