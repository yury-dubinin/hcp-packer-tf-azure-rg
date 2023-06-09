variable "az_region" {
  description = "The Azure region where the Resource Group exists."
  type        = string
  default = "northeurope"
}

variable "az_resource_group" {
  description = "An existing Azure Resource Group where the build will take place and images will be stored."
  type        = string
  default = "rg-shared-images"
}

variable "az_image_gallery" {
  description = "An existing Azure Compute Gallery (FKA Shared Image Gallery). The image definition must also exist."
  type        = string
  default = "az_sig_01"
}

variable "az_subscription_id" {
  description = "Your Azure Subscription ID (required for the shared_image_gallery_destination block)."
  type        = string
  sensitive   = true
  default = ""
}

variable "department" {
  description = "A value for the \"dept\" tag."
  type        = string
  default     = "PlatformEng"
}

variable "owner" {
  description = "A value for the \"owner\" tag."
  type        = string
  default     = "image.owner"
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  type        = string
  default     = "hashipacker"
}
