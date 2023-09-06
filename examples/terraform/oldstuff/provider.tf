provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_token        = var.proxmox_token
  pm_tls_insecure = var.proxmox_ignore_tls
  pm_parallel     = 2
}