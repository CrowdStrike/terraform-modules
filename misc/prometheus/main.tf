
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
  count = var.cloud == "gcp" && var.autopilot == false ? 1 : 0
  name  = "prometheus"
  chart = "prometheus-community/kube-prometheus-stack"
  namespace = "prometheus"
  create_namespace = true
}

resource "helm_release" "prometheus_gcp_autopilot" {
  count = var.cloud == "gcp" && var.autopilot == true ? 1 : 0
  name  = "prometheus"
  chart = "prometheus-community/kube-prometheus-stack"
  namespace = "prometheus"
  create_namespace = true
  set {
    name  = "coreDns.enabled"
    value = "false"
  }
  set {
    name  = "kubeControllerManager.enabled"
    value = "false"
  }
  set {
    name  = "kubeDns.enabled"
    value = "false"
  }
  set {
    name  = "kubeEtcd.enabled"
    value = "false"
  }
  set {
    name  = "kubeProxy.enabled"
    value = "false"
  }
  set {
    name  = "kubeScheduler.enabled"
    value = "false"
  }
  set {
    name  = "nodeExporter.enabled"
    value = "false"
  }
}