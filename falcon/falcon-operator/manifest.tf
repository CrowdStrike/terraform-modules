data "http" "operator-yaml" {
  url = "https://raw.githubusercontent.com/CrowdStrike/falcon-operator/main/deploy/falcon-operator.yaml"
}

resource "kubernetes_manifest" "falcon-operator" {
  manifest = {
    data.http.operator-yaml.response_body
  }
}