resource "helm_release" "kpagent" {
  name             = "kpagent"
  chart            = "cs-k8s-protection-agent"
  repository       = "https://registry.crowdstrike.com/kpagent-helm"
  namespace        = "falcon-kubernetes-protection"
  create_namespace = true
  reset_values     = true

  set {
    name  = "crowdstrikeConfig.clientID"
    value = var.falcon_client_id
  }

  set {
    name  = "crowdstrikeConfig.clientSecret"
    value = var.falcon_client_secret
  }

  set {
    name  = "crowdstrikeConfig.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "crowdstrikeConfig.env"
    value = var.falcon_cloud
  }

  set {
    name  = "crowdstrikeConfig.cid"
    value = var.falcon_cid
  }

  set {
    name  = "crowdstrikeConfig.dockerAPIToken"
    value = var.falcon_docker_api_token
  }
}
