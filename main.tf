
resource "azurerm_resource_group" "vm" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
 }

 resource "azurerm_monitor_action_group" "email_alert" {
  name                = "CriticalAlertsAction"
  resource_group_name = azurerm_resource_group.vm.name
  short_name          = "p0action"

 # Creating Multiple email Notification in Action group 
 dynamic "email_receiver" {
  for_each= var.settings
  content {
    name = email_receiver.value["receivername"]
    email_address = email_receiver.value["email_address"]
  }
}
 depends_on = [ azurerm_resource_group.vm ]
 }

#Creating Log alerts (This alert will monitor if any VM Restarted)

resource "azurerm_monitor_activity_log_alert" "main" {
  name                = "TrackVM Restart"
  resource_group_name = azurerm_resource_group.vm.name
  scopes              = [azurerm_resource_group.vm.id]
  description         = "This alert will monitor if any VM Restarted."

  criteria {
      operation_name = "Microsoft.Compute/virtualMachines/restart/action"
       category       = "Administrative"
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_alert.id

    }
}