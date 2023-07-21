
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "terraform-compute"
}

variable "location" {
  description = "The location/region where the virtual network is created."
  default= "Australia East"
}

variable "azure-client-id" {
  description = "Insert your application client-id"
  sensitive = true
}

variable "azure-client-secret"{
  description = "Insert your application client-secret"
  sensitive = true
}
variable "azure-subscription" {
  description = "Insert your subscription-id"
  sensitive = true
}

variable "azure-tenant" {
  description = "Insert your active-directory"
  sensitive = true
}



variable "settings" {
  type= list(object({
    receivername=string,
    email_address=string
  }))
}

/*variable "receivername"{
    description = "The name of the receiver"
    sensitive=true
   
}
variable "email_address"{
    description = "The name of the email-address"
       sensitive=true
}*/
