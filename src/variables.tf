variable "key_vault_create" {
  default = "__key_vault_create__"
}

variable "key_vault_name" {
  default = "__key_vault_name__"
}

variable "location" {
  default = "__location__"
}

variable "resource_group_create" {
  default = "__resource_group_create__"
}

variable "resource_group_name" {
  default = "__resource_group_name__"
}

variable "terraform_client_id" {
  default = "__terraform_client_id__"
}

variable "terraform_client_secret" {
  default = "__terraform_client_secret__"
}

variable "terraform_subscription_id" {
  default = "__terraform_subscription_id__"
}

variable "terraform_tenant_id" {
  default = "__terraform_tenant_id__"
}

variable "terraform_organization" {
  default = "__terraform_organization__"
}

variable "terraform_token" {
  default = "__terraform_token__"
}

variable "tags" {
  default = {
    createdBy   = "Terraform"
    environment = "__tags_environment__"
    location    = "__tags_location__"
    managedBy   = "__tags_managed_by__"
  }
}
