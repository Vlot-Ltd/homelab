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
