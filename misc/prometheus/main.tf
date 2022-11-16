
resource "helm_release" "prometheus_aws" {
  count = var.cloud == "aws" ? 1 : 0
  name  = "prometheus"
  chart = "prometheus-community/kube-prometheus-stack"
  namespace = "prometheus"
  create_namespace = true
  values = [
    var.prometheus_config
  ]
}

resource "helm_release" "prometheus_gcp" {
  count = var.cloud == "gcp" ? 1 : 0
  name  = "prometheus"
  chart = "prometheus-community/kube-prometheus-stack"
  namespace = "prometheus"
  create_namespace = true
}