resource "azurerm_storage_account" "st_cont" {
  for_each = var.storaged

  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.rgforst[each.value.key].name
  location                 = azurerm_resource_group.rgforst[each.value.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "cont_1" {
  for_each = var.container_name

  name                 = each.value.name
  storage_account_id   = azurerm_storage_account.st_cont[each.value.key].id
  container_access_type = "private"
}