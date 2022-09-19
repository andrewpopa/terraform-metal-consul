variable "project_id" {
  description = "project id"
  type        = string
  default     = ""
}

variable "consul_cluster" {
  type = map(object({
    hostname = string
    plan = string
    facilities = string
    operating_system = string
    billing_cycle = string
  }))
}

variable "consul_version" {
  description = "Version for the Consul"
  type        = string
  default     = ""
}

variable "metal_token" {
  description = "metal token used for consul retry-join"
  type        = string
  default     = ""
}