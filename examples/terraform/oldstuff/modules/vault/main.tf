// "Live" Terraform infra config for a Hashicorp Vault instance
// running on a Proxmox VM. Post-provisioning config handed off to Ansible.

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "~> 2.6.7"
    }
  }
}


// Create Vault VM
module "vault_vm" {
  source = "../../modules/pve-vm"

  target_node = local.target_node
  clone = local.clone
  vm_name = local.vm_name
  desc = local.desc
  sockets = local.vm_sockets
  cores = local.vm_cores
  memory = local.vm_memory
  onboot = local.onboot
  full_clone = local.full_clone
  clone_wait = local.clone_wait
  nameserver = local.nameserver
  searchdomain = local.searchdomain
  vm_network = local.vm_network
  vm_disk = local.vm_disk
  boot = local.boot
  agent = local.agent
  ipconfig0 = "ip=${local.vm_ip_address}${local.vm_ip_cidr},gw=${local.vm_ip_gw}"
  ip_address = local.vm_ip_address
  ssh_public_keys = local.ssh_public_keys
  default_image_username = local.default_image_username
  default_image_password = local.default_image_password
  private_key = tls_private_key.bootstrap_private_key.private_key_pem
}

// Create a temporary key pair for post-provisioning config
resource "tls_private_key" "bootstrap_private_key" {
  algorithm = "RSA"
}

// Create temp private key file from key pair above for initial Ansible use
resource "local_file" "temp-private-key" {
  sensitive_content = tls_private_key.bootstrap_private_key.private_key_pem
  filename = "${path.module}/private_key.pem"
  file_permission = "0600"
}
