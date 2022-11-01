data "http" "operator-yaml" {
  url = "https://raw.githubusercontent.com/CrowdStrike/falcon-operator/main/deploy/falcon-operator.yaml"
}

locals {
  manifests = split("---", data.http.operator-yaml.response_body)
  manifestsLessOne = "${slice(local.manifests, 1, length(local.manifests))}"
}

resource "kubernetes_manifest" "falcon-operator" {
  provider = kubernetes
  for_each = toset(local.manifestsLessOne)
  manifest = yamldecode(each.key)
}