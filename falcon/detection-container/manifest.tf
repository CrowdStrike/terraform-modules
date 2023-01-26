# Deploy CrowdStrike Detection-Container
resource "kubectl_manifest" "namespace" {
  yaml_body = <<-YAML
  ---
  apiVersion: v1
  kind: Namespace
  metadata:
    name: detection-container
    labels:
      name: detection-container
  YAML
}
resource "kubectl_manifest" "detection_container" {
  yaml_body = <<-YAML
  ---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: detection-container
    namespace: detection-container
    labels:
      app: detection-container
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: detection-container
    template:
      metadata:
        labels:
          app: detection-container
      spec:
        containers:
        - name: detection-container
          image: quay.io/crowdstrike/detection-container
          imagePullPolicy: Always
  YAML
  depends_on = [
    kubectl_manifest.namespace
  ]
}
