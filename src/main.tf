terraform {
  backend "remote" {}
}

module "rg" {
  source = "./modules/resource_group"

  resource_group_create   = var.resource_group_create
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  tags                    = var.tags
}

module "kv" {
  source = "./modules/key_vault"

  key_vault_create          = var.key_vault_create
  key_vault_name            = var.key_vault_name
  resource_group_name       = module.rg.name
  resource_group_location   = module.rg.location
  terraform_client_id       = var.terraform_client_id
  terraform_client_secret   = var.terraform_client_secret
  terraform_subscription_id = var.terraform_subscription_id
  terraform_tenant_id       = var.terraform_tenant_id
  terraform_organization    = var.terraform_organization
  terraform_token           = var.terraform_token
  tags                      = var.tags
}
