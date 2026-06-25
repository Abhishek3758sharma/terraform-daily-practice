resource "azurerm_storage_account" "storage" {
  for_each = var.storaged
  name = each.value.name
  resource_group_name      = azurerm_resource_group.rgforst[each.value.key].name
  location                 = azurerm_resource_group.rgforst[each.value.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}