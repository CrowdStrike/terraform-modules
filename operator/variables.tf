# Falcon sensor type
# Allowed Values: FalconNodeSensoror FalconContainer
variable "sensor_type" {
    type = string
    default = "FalconNodeSensor"
    description = "Falcon sensor type: FalconNodeSensor or FalconContainer"

    validation {
        condition = contains(["FalconNodeSensor", "FalconContainer"], var.sensor_type)
        error_message = "Sensor type must be FalconNodeSensor or FalconContainer"
    }

}

# Falcon credentials
variable "client_id" {
    type = string
    description = "Falcon API Client ID"
    sensitive = true
}
variable "client_secret" {
    type = string
    description = "Falcon API Client Secret"
    sensitive = true
}
# Environment or 'Alias' tag
variable "environment" {
    description = "Environment or 'Alias' tag"
    type = string
}