// Set local variables for provisioning
locals {
  # -- Common Variables -- #
  desc = "Hashicorp Vault VM, created with Terraform on ${timestamp()}"
  full_clone = true
  default_image_username = "proxmox"
  default_image_password = "proxmox" #pragma: allowlist secret
  clone_wait = 5
  onboot = true
  nameserver = "192.168.1.254"
  searchdomain = "local"
  // Dynamic block for network adapters to add to VM
  vm_network = [
    {
      model = "virtio"
      bridge = "vmbr0"
      tag = null
    },
  ]

  // Dynamic block for disk devices to add to VM. 1st is OS, size should match or exceed template.
  vm_disk = [
    {
      type = "scsi"
      storage = "vm-store"
      size = "50G"
      format = "qcow2"
      ssd = 0
    },
  ]
  boot = "order=scsi0;ide2;net0"
  agent = 1
  ssh_public_keys = tls_private_key.bootstrap_private_key.public_key_openssh
  terraform_provisioner_type = "ssh"
  target_node = "proxmox"
  clone = "tpl-ubuntu-22-04"
  vm_name = "vault"
  vm_sockets = 2
  vm_cores = 2
  vm_memory = "4096"
  vm_ip_address = "192.168.1.6"
  vm_ip_cidr = "/24"
  vm_ip_gw = "192.168.1.254"
}
