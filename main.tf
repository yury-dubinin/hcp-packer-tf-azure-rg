resource "azurerm_resource_group" "sigrg" {
  location = var.deploy_location
  name     = var.rg_shared_name
}

# Creates Shared Image Gallery
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image_gallery
resource "azurerm_shared_image_gallery" "sig" {
  # name can only contain alphanumeric, full stops and underscores.
  name                = "az_sig_01"
  resource_group_name = azurerm_resource_group.sigrg.name
  location            = azurerm_resource_group.sigrg.location
  description         = "Shared images"

  tags = {
    Environment = "Demo"
    Tech        = "Terraform"
  }
}

#Creates image definition
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image
resource "azurerm_shared_image" "windows" {
  name                = "avd-image"
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = azurerm_resource_group.sigrg.name
  location            = azurerm_resource_group.sigrg.location
  os_type             = "Windows"

  identifier {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "office-365"
    sku       = "20h2-evd-o365pp"
  }
}

resource "azurerm_shared_image" "linux" {
  name                = "ubuntu20-image"
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = azurerm_resource_group.sigrg.name
  location            = azurerm_resource_group.sigrg.location
  os_type             = "Linux"
  hyper_v_generation = "V2"

  identifier {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
  }
}
