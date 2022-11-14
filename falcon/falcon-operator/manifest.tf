data "http" "falcon_operator" {
    url = "https://raw.githubusercontent.com/isimluk/falcon-operator/terraform/deploy/falcon-operator.yaml"
}

data "kubectl_file_documents" "docs" {
    content = data.http.falcon_operator.response_body
}

resource "kubectl_manifest" "falcon_operator" {
    for_each  = data.kubectl_file_documents.docs.manifests
    yaml_body = each.value
}