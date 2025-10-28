variable "env" {
  type        = string
  description = "The environment to deploy to"
  validation {
    condition     = contains(["staging", "production"], var.env)
    error_message = "Invalid environment. Must be staging or production."
  }
}

variable "zone_id" {
  type        = string
  description = "The zone id for the route53 record"
}

variable "root_domain" {
  type        = string
  description = "The root domain for the route53 record"
  default     = "foam-app.com"
}

variable "private_key" {
  type        = string
  description = "The private key for the certificate"
}

variable "certificate_body" {
  type        = string
  description = "The certificate body for the certificate"
}

variable "certificate_chain" {
  type        = string
  description = "The certificate chain for the certificate"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the resources"
  default = {
    "Service"   = "cake"
    "ManagedBy" = "Terraform"
  }
}

variable "git_sha" {
  type        = string
  description = "the git sha that triggered the deployment"
  default     = "change-me"
}

variable "deployed_by" {
  type        = string
  description = "Who initiated the deployment?"
  default     = "luke-h1"
}

variable "project_name" {
  type        = string
  description = "name of the project"
  default     = "cake"
}

variable "api_key" {
  type        = string
  description = "the API key to set on the authorizer"
  sensitive   = true
}
