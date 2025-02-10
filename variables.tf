variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "account_tier" {
  type        = string
  description = <<-EOT
                (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created.
                
                **NOTE:** Blobs with a tier of Premium are of account kind StorageV2.
                EOT
  default     = "Standard"
}

variable "account_kind" {
  type        = string
  description = <<-EOT
                (Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2. 
                
                **NOTE:** Changing the account_kind value from Storage to StorageV2 will not trigger a force new on the storage account, it will only upgrade the existing storage account from Storage to StorageV2 keeping the existing storage account in place.
                EOT
  default     = "StorageV2"
}

variable "access_tier" {
  type        = string
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  default     = "Hot"
}

variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "ZRS"
}

variable "shared_access_key_enabled" {
  type        = bool
  description = <<-EOT
                (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true. 
                
                **NOTE:** Terraform uses Shared Key Authorisation to provision Storage Containers, Blobs and other items - when Shared Key Access is disabled, you will need to enable the storage_use_azuread flag in the Provider block to use Azure AD for authentication, however not all Azure Storage services support Active Directory authentication.
                EOT
  default     = true
}

variable "large_file_share_enabled" {
  type        = bool
  description = "(Optional) Is Large File Share Enabled?"
  default     = false
}

variable "network_default_action" {
  type        = string
  description = "(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow."
}

variable "network_bypass" {
  type        = list(string)
  description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  default     = null
}

variable "key_vault_key_id" {
  type        = string
  description = "(Required) The ID of the Key Vault Key, supplying a version-less key ID will enable auto-rotation of this key."
}

variable "user_assigned_identity_id" {
  type        = string
  description = "(Required) The ID of a user assigned identity."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = null
}

variable "delete_retention_policy_enabled" {
  type        = bool
  description = "(Optional) Is the delete retention policy enabled?"
  default     = false
}

variable "delete_retention_policy_days" {
  type        = number
  description = "(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days."
  default     = 7
}

variable "container_delete_retention_policy_enabled" {
  type        = bool
  description = "(Optional) Is the container delete retention policy enabled?"
  default     = false
}

variable "container_delete_retention_policy_days" {
  type        = number
  description = "(Optional) Specifies the number of days that the container should be retained, between 1 and 365 days."
  default     = 7
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether the public network access is enabled?"
  default     = true
}

variable "versioning_enabled" {
  type        = bool
  description = "(Optional) Is versioning enabled?"
  default     = false
}

variable "change_feed_enabled" {
  type        = bool
  description = "(Optional) Is the blob service properties for change feed events enabled?"
  default     = false
}

variable "directory_type" {
  type        = string
  description = "(Required) Specifies the directory service used. Possible values are AADDS, AD and AADKERB."
}

variable "domain_name" {
  type        = string
  description = "(Required) Specifies the primary domain that the AD DNS server is authoritative for."
}

variable "domain_guid" {
  type        = string
  description = "(Required) Specifies the domain GUID."
}

variable "hns_enabled" {
  type        = bool
  description = <<-EOT
                (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created.

                **NOTE:** This can only be true when account_tier is Standard or when account_tier is Premium and account_kind is BlockBlobStorage.
                EOT
  default     = false
}

variable "sftp_enabled" {
  type        = bool
  description = <<-EOT
                (Optional) Boolean, enable SFTP for the storage account.

                **NOTE:** SFTP support requires is_hns_enabled set to true.
                EOT
  default     = false
}

variable "ip_rules" {
  type        = list(string)
  description = "(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. /31 CIDRs, /32 CIDRs, and Private IP address ranges (as defined in RFC 1918), are not allowed."
  default     = null
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "(Optional) Allow or disallow nested items within this Account to opt into being public. Defaults to true."
  default     = false
}

variable "allowed_copy_scope" {
  type        = string
  description = "(Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink."
  default     = null
}