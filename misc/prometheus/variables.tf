variable "cloud" {
  type = string
}

variable "autopilot" {
  type = bool
  default = false
}

variable "prometheus_config" {
  default = <<-YAML
  prometheus-node-exporter:
    affinity:
      nodeAffinity:
        requiredDuringSchedulingIgnoredDuringExecution:
          nodeSelectorTerms:
            - matchExpressions:
              - key: eks.amazonaws.com/compute-type
                operator: NotIn
                values:
                  - fargate
  YAML
}