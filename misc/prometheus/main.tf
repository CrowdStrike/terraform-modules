resource "helm_release" "prometheus" {
  name  = "prometheus"
  chart = "prometheus-community/kube-prometheus-stack"
  namespace = "prometheus"
  create_namespace = true
  values = [
    var.prometheus_config
  ]
}