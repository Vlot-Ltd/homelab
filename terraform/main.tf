# -------------------------------------------------------------------------------------------
# Master Terraform module for provisioning listed child module infrastructure components.
# While possible to provision all at once, strongly suggest targeting specific modules
# individually, and just using this module to allow for a single 'terraform init' run.
# Add -compact-warnings parameter to minimize output warnings related to resource targeting.
#
# terraform [plan|apply|destroy] -target=module.vault
# terraform [plan|apply|destroy] -target=module.docker
# terraform [plan|apply|destroy] -target=module.db
# -------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.4.6"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_token        = var.proxmox_token
  pm_tls_insecure = var.proxmox_ignore_tls
  pm_parallel     = 2
  // pm_parallel hardcoded to 2 as workaround to "transport is closing" issue
  // Ref: github.com/Telmate/terraform-provider-proxmox/issues/257
}

#------------------------------------------#
#---------- Hashicorp Vault -------------- #
#------------------------------------------#
module "vault" {
  source = "./modules/vault"
  providers = {
    proxmox = proxmox
  }
}

#------------------------------------------#
#---------------- Docker ----------------- #
#------------------------------------------#
module "docker" {
  source = "./modules/docker"
  providers = {
    proxmox = proxmox
  }
}

#------------------------------------------#
#---------------- Database --------------- #
#------------------------------------------#
module "db" {
  source = "./modules/db"
  providers = {
    proxmox = proxmox
  }
}
