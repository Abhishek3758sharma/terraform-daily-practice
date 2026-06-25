resource "azurerm_resource_group" "rgforst" {
  for_each = var.rgst
  name     = each.value.name
  location = each.value.location

}