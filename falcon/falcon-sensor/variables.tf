# Falcon sensor type
# Allowed Values: FalconNodeSensoror FalconContainer
variable "sensor-type" {
    type = string
}

# Falcon credentials
variable "client-id" {
    type = string
}
variable "client-secret" {
    type = string
}

# Environment or 'Alias' tag
variable "environment" {
    type = string
}