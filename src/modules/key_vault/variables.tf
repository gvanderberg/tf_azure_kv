variable "key_vault_create" {
  description = "Should the Key Vault be created."
  type        = bool
}

variable "key_vault_name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "resource_group_location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "terraform_client_id" {
  description = ""
  type        = string
}

variable "terraform_client_secret" {
  description = ""
  type        = string
}

variable "terraform_subscription_id" {
  description = ""
  type        = string
}

variable "terraform_tenant_id" {
  description = ""
  type        = string
}

variable "terraform_organization" {
  description = ""
  type        = string
}

variable "terraform_token" {
  description = ""
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map
}
