#-------------------------------------------------------------------------------------------#
# Proxmox Variables
# Reference: https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/index.md
#-------------------------------------------------------------------------------------------#

variable "proxmox_api_url" {
  description = "This is the target Proxmox API endpoint"
  type        = string
  default     = "https://192.168.2.20:8006/api2/json"
}
variable "proxmox_user" {
  description = "This is the Proxmox API user. Use root@pam or custom. Will need PVEDatastoreUser, PVEVMAdmin, PVETemplateUser permissions"
  type        = string
  sensitive   = true
  default     = "terraform@pve!proxmoxterraform"
}
variable "proxmox_token" {
  description = "API user token. Required, sensitive, or use environment variable TF_VAR_proxmox_token"
  default     = "18164336-2fa8-4e26-9324-fd645c270c25"
  sensitive   = true
}
variable "proxmox_ignore_tls" {
  description = "Disable TLS verification while connecting"
  type        = string
  default     = "true"
}