resource "helm_release" "kpagent" {
  name  = "kpagent"
  chart = "kpagent-helm/cs-k8s-protection-agent"
  namespace = "falcon-kubernetes-protection"
  create_namespace = true
  values = [
    var.protection_agent_config
  ]
}