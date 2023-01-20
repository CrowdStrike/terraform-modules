resource "helm_release" "kpagent" {
  name  = "kpagent"
  chart = "kpagent-helm/cs-k8s-protection-agent"
  namespace = "falcon-kubernetes-protection"
  create_namespace = true
  values = [
    <<EOF
crowdstrikeConfig:
  clientID: ${var.falcon_client_id}
  clientSecret: ${var.falcon_client_secret}
  clusterName: ${var.cluster_name}
  dockerAPIToken: ${var.falcon_docker_api_token}
  cid: ${var.falcon_cid}
  env: ${var.falcon_cloud}
EOF
  ]
}