# Deploy node sensor if var.sensor-type = FalconNodeSensor
resource "kubernetes_manifest" "node-sensor" {
  count = var.sensor-type == "FalconNodeSensor" ? 1 : 0
  manifest = {
    apiVersion = "falcon.crowdstrike.com/v1alpha1"
    kind = "${var.sensor-type}"
    metadata = {
      name = "falcon-node-sensor"
      namespace = "falcon-operator"
    }
    spec = {
      falcon_api = {
        client_id = "${var.client-id}"
        client_secret = "${var.client-secret}"
        cloud_region = "autodiscover"
      }
      node = {}
      falcon = {
        tags = ["falcon-${var.environment}"]
      }
    }
  }
}

# Deploy container sensor if var.sensor-type = ContainerSensor
resource "kubernetes_manifest" "container-sensor" {
  count = var.sensor-type == "FalconContainer" ? 1 : 0
  manifest = {
    apiVersion = "falcon.crowdstrike.com/v1alpha1"
    kind = "${var.sensor-type}"
    metadata = {
      name = "falcon-container"
    }
    spec = {
      falcon_api = {
        client_id = "${var.client-id}"
        client_secret = "${var.client-secret}"
        cloud_region = "autodiscover"
      }
      registry = {
        type = "crowdstrike"
      }
      installer_args = ["-falconctl-opts", "--tags=Falcon-${var.environment}"]
    }
  }
}