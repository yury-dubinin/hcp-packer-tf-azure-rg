packer {
  required_version = ">= 1.7.7"
  required_plugins {
    azure = {
      version = ">= 1.4.2"
      source  = "github.com/hashicorp/azure"
    }
  }
}

locals {
  timestamp  = regex_replace(timestamp(), "[- TZ:]", "")
  image_name = "${local.prefix}-ubuntu20-${local.timestamp}"
  department = "Test"
  owner = "image.owner"
  prefix = "prefix"
  az_region = "northeurope"
  az_resource_group = "rg-shared-resources"
  az_image_gallery = "sigabph"
  az_subscription_id = "22359f5e-af77-4c86-a1ae-f82408ae3bf0"

}

source "azure-arm" "base" {
  os_type                   = "Linux"
  build_resource_group_name = local.az_resource_group
  vm_size                   = "Standard_B2s"

  # Source image
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-focal"
  image_sku       = "20_04-lts-gen2"
  image_version   = "latest"

  # Destination image
  managed_image_name                = local.image_name
  managed_image_resource_group_name = local.az_resource_group
  shared_image_gallery_destination {
    subscription         = local.az_subscription_id
    resource_group       = local.az_resource_group
    gallery_name         = local.az_image_gallery
    image_name           = "ubuntu20-base"
    image_version        = formatdate("YYYY.MMDD.hhmm", timestamp())
    replication_regions  = [local.az_region]
    storage_account_type = "Standard_LRS"
  }

  azure_tags = {
    owner      = local.owner
    department = local.department
    build-time = local.timestamp
  }
  use_azure_cli_auth = true
}

build {
  # HCP Packer metadata
  hcp_packer_registry {
    bucket_name = "ubuntu20-base"
    description = "Ubuntu 20.04 (focal) base image."
    bucket_labels = {
      "owner"          = local.owner
      "department"     = local.department
      "os"             = "Ubuntu",
      "ubuntu-version" = "20.04",
    }
    build_labels = {
      "build-time" = local.timestamp
    }
  }

  sources = [
    "source.azure-arm.base"
  ]

  # Make sure cloud-init has finished
  provisioner "shell" {
    inline = ["echo 'Wait for cloud-init...' && /usr/bin/cloud-init status --wait"]
  }

  provisioner "shell" {
    script          = "${path.root}/update.sh"
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    inline = [
      "sudo ufw enable >/dev/null",
      "sudo ufw allow 22 >/dev/null"
    ]
  }
}
