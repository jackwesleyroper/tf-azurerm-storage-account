output "sa_id" {
  value       = azurerm_storage_account.storage_account.id
  description = "The ID of the Storage Account."
}

output "primary_location" {
  value       = azurerm_storage_account.storage_account.primary_location
  description = "The primary location of the storage account."
}

output "secondary_location" {
  value       = azurerm_storage_account.storage_account.secondary_location
  description = "The secondary location of the storage account."
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "The endpoint url for Blob Storage in the primary location."
}

output "primary_blob_host" {
  value       = azurerm_storage_account.storage_account.primary_blob_host
  description = "The hostname with port if applicable for blob storage in the primary location."
}

output "secondary_blob_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_blob_endpoint
  description = "The endpoint url for Blob Storage in the secondary location."
}

output "secondary_blob_host" {
  value       = azurerm_storage_account.storage_account.secondary_blob_host
  description = "The hostname with port if applicable for blob storage in the secondary location."
}

output "primary_queue_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_queue_endpoint
  description = "The endpoint URL for queue storage in the primary location"
}

output "primary_queue_host" {
  value       = azurerm_storage_account.storage_account.primary_queue_host
  description = "The hostname with port if applicable for queue storage in the primary location."
}

output "secondary_queue_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_queue_endpoint
  description = "The endpoint URL for queue storage in the secondary location"
}

output "secondary_queue_host" {
  value       = azurerm_storage_account.storage_account.secondary_queue_host
  description = "The hostname with port if applicable for queue storage in the secondary location."
}

output "primary_table_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_table_endpoint
  description = "The endpoint URL for table storage in the primary location."
}

output "primary_table_host" {
  value       = azurerm_storage_account.storage_account.primary_table_host
  description = "The hostname with port if applicable for table storage in the primary location."
}

output "secondary_table_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_table_endpoint
  description = "The endpoint URL for table storage in the secondary location."
}

output "secondary_table_host" {
  value       = azurerm_storage_account.storage_account.secondary_table_host
  description = "The hostname with port if applicable for table storage in the secondary location."
}

output "primary_file_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_file_endpoint
  description = "The endpoint URL for file storage in the primary location."
}

output "primary_file_host" {
  value       = azurerm_storage_account.storage_account.primary_file_host
  description = "he hostname with port if applicable for file storage in the primary location."
}

output "secondary_file_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_file_endpoint
  description = "The endpoint URL for file storage in the secondary location."
}

output "secondary_file_host" {
  value       = azurerm_storage_account.storage_account.secondary_file_host
  description = "he hostname with port if applicable for file storage in the secondary location."
}

output "primary_dfs_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_dfs_endpoint
  description = "The endpoint URL for DFS storage in the primary location."
}

output "primary_dfs_host" {
  value       = azurerm_storage_account.storage_account.primary_dfs_host
  description = "The hostname with port if applicable for DFS storage in the primary location."
}

output "secondary_dfs_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_dfs_endpoint
  description = "The endpoint URL for DFS storage in the secondary location."
}

output "secondary_dfs_host" {
  value       = azurerm_storage_account.storage_account.secondary_dfs_host
  description = "The hostname with port if applicable for DFS storage in the secondary location."
}

output "primary_web_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
  description = "The endpoint URL for web storage in the primary location."
}

output "primary_web_host" {
  value       = azurerm_storage_account.storage_account.primary_web_host
  description = "The hostname with port if applicable for web storage in the primary location."
}

output "secondary_web_endpoint" {
  value       = azurerm_storage_account.storage_account.secondary_web_endpoint
  description = "The endpoint URL for web storage in the secondary location."
}

output "secondary_web_host" {
  value       = azurerm_storage_account.storage_account.secondary_web_host
  description = "The hostname with port if applicable for web storage in the secondary location."
}

output "primary_access_key" {
  value       = azurerm_storage_account.storage_account.primary_access_key
  description = "The primary access key for the Storage Account."
  sensitive   = true
}

output "secondary_access_key" {
  value       = azurerm_storage_account.storage_account.secondary_access_key
  description = "The secondary access key for the Storage Account."
  sensitive   = true
}

output "primary_connection_string" {
  value       = azurerm_storage_account.storage_account.primary_connection_string
  description = "The connection string associated with the primary location."
  sensitive   = true
}

output "secondary_connection_string" {
  value       = azurerm_storage_account.storage_account.secondary_connection_string
  description = "The connection string associated with the secondary location."
  sensitive   = true
}

output "primary_blob_connection_string" {
  value       = azurerm_storage_account.storage_account.primary_blob_connection_string
  description = "The connection string associated with the primary blob location."
  sensitive   = true
}

output "secondary_blob_connection_string" {
  value       = azurerm_storage_account.storage_account.secondary_blob_connection_string
  description = "The connection string associated with the secondary blob location."
  sensitive   = true
}

output "identity" {
  value       = azurerm_storage_account.storage_account.identity
  description = <<-EOT
                An identity block exports the following:

                ```
                {
                principal_id - The Principal ID for the Service Principal associated with the Identity of this Storage Account.
                tenant_id - The Tenant ID for the Service Principal associated with the Identity of this Storage Account.
                }
                ```
                EOT
}
