variable "subscription_id" {
  description = "The Subscription ID for Azure"
  type        = string
}

variable "location" {
  description = "The Azure Region to deploy the resources in."
  default     = "East US 2"
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  default     = "example-resources"
}

variable "container_image" {
  description = "The Docker image to deploy"
  default     = "nginx:latest"
}

variable "cpu" {
  description = "The number of CPU cores to allocate to the container"
  default     = "0.5"
}

variable "memory" {
  description = "The amount of memory to allocate to the container (in GB)"
  default     = "1.5"
}
