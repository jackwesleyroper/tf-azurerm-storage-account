resource "azurerm_storage_account" "storage_account" {
  resource_group_name               = var.resource_group_name
  location                          = var.location
  name                              = var.name
  account_tier                      = var.account_tier
  account_kind                      = var.account_kind
  access_tier                       = var.access_tier
  account_replication_type          = var.account_replication_type
  min_tls_version                   = "TLS1_2"
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  shared_access_key_enabled         = var.shared_access_key_enabled
  https_traffic_only_enabled        = true
  large_file_share_enabled          = var.large_file_share_enabled
  cross_tenant_replication_enabled  = false
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = var.public_network_access_enabled
  is_hns_enabled                    = var.hns_enabled
  sftp_enabled                      = var.sftp_enabled
  allowed_copy_scope                = var.allowed_copy_scope
  tags                              = var.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  network_rules {
    default_action = var.network_default_action
    bypass         = var.network_bypass
    ip_rules       = var.ip_rules
  }

  customer_managed_key {
    key_vault_key_id          = var.key_vault_key_id
    user_assigned_identity_id = var.user_assigned_identity_id
  }

  dynamic "azure_files_authentication" {
    for_each = var.directory_type != null ? [""] : []
    content {
      directory_type = var.directory_type

      dynamic "active_directory" {
        for_each = var.domain_name != null ? [""] : []

        content {
          domain_name = var.domain_name
          domain_guid = var.domain_guid
        }

      }

    }
  }

  dynamic "blob_properties" {
    for_each = var.account_kind != "FileStorage" ? [{}] : []
    content {
      dynamic "delete_retention_policy" {
        for_each = var.delete_retention_policy_enabled ? [""] : []

        content {
          days = var.delete_retention_policy_days
        }
      }

      dynamic "container_delete_retention_policy" {
        for_each = var.container_delete_retention_policy_enabled ? [""] : []

        content {
          days = var.container_delete_retention_policy_days
        }
      }

      change_feed_enabled = var.change_feed_enabled
      versioning_enabled  = var.versioning_enabled
    }

  }

  lifecycle {
    ignore_changes = [
      network_rules
    ]
  }

}
