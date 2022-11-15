resource "helm_release" "detection_container" {
  name       = "detection-container"
  chart      = "./charts/chart.yaml"
}