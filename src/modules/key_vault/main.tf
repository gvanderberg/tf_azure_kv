locals {
  secrets = [
    { 
      name = "terraform-client-id",
      value = var.terraform_client_id 
    },
    { 
      name = "terraform-client-secret",
      value = var.terraform_client_secret 
    },
    { 
      name = "terraform-organization",
      value = var.terraform_organization 
    },
    { 
      name = "terraform-subscription-id",
      value = var.terraform_subscription_id 
    },
    { 
      name = "terraform-tenant-id",
      value = var.terraform_tenant_id 
    },
    { 
      name = "terraform-token",
      value = var.terraform_token 
    }
  ]
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "this" {
  count = var.key_vault_create ? 0 : 1

  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault" "this" {
  lifecycle {
    ignore_changes = [
      access_policy
    ]
  }
  
  count = var.key_vault_create ? 1 : 0

  name                            = var.key_vault_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled             = true
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  sku_name                        = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
      "set",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "this" {
  count = var.key_vault_create ? length(local.secrets) : 0

  name          = local.secrets[count.index].name
  value         = local.secrets[count.index].value
  key_vault_id  = azurerm_key_vault.this[0].id
  tags          = var.tags

  depends_on = [azurerm_key_vault.this]
}