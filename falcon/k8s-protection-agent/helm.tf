
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
