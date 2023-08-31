packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

variable "iso_checksum" {
  type    = string
  default = "a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd" #pragma: allowlist secret
}

variable "iso_filename" {
  type    = string
  default = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
}

variable "proxmox_api_url" {
  type    = string
  default = "${env("PROXMOX_API_URL")}"
}

variable "proxmox_node" {
  type    = string
  default = "${env("PROXMOX_NODE")}"
}

variable "proxmox_user" {
  type    = string
  default = "${env("PROXMOX_API_TOKEN_ID")}"
}

variable "proxmox_token" {
  type    = string
  default = "${env("PROXMOX_API_TOKEN_SECRET")}"
}

variable "proxmox_vmid" {
  type    = string
  default = null
}

variable "ssh_password" {
  type    = string
  default = "proxmox"
}

variable "ssh_username" {
  type    = string
  default = "proxmox"
}

variable "template_name" {
  type    = string
  default = "tpl-ubuntu-22-04"
}

variable "vm_cores" {
  type    = string
  default = "1"
}

variable "vm_cpu_type" {
  type    = string
  default = "host"
}

variable "vm_disk_format" {
  type    = string
  default = "raw"
}

variable "vm_disk_size" {
  type    = string
  default = "50G"
}

variable "vm_disk_type" {
  type    = string
  default = "scsi"
}

variable "vm_enable_qemu_agent" {
  type    = string
  default = "true"
}

variable "vm_memory" {
  type    = string
  default = "2048"
}

variable "vm_network_adapter_bridge" {
  type    = string
  default = "vmbr0"
}

variable "vm_network_adapter_model" {
  type    = string
  default = "virtio"
}

variable "vm_scsi_controller" {
  type    = string
  default = "virtio-scsi-pci"
}

variable "vm_sockets" {
  type    = string
  default = "2"
}

variable "vm_storage_pool" {
  type    = string
  default = "vmosstorage"
}

variable "vm_storage_pool_type" {
  type    = string
  default = "directory"
}
# The "legacy_isotime" function has been provided for backwards compatability, but we recommend switching to the timestamp and formatdate functions.

locals {
  template_description = "Ubuntu 22.04.3 x86_64 template generated by Packer on ${legacy_isotime("2006-01-02T15:04:05Z")}. Username: proxmox"
}

source "proxmox" "autogenerated_1" {
  boot_command            = ["c", "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/' ", "<enter><wait>", "initrd /casper/initrd<enter><wait>", "boot<enter>"]
  boot_wait               = "5s"
  cloud_init              = true
  cloud_init_storage_pool = "${var.vm_storage_pool}"
  cores                   = "${var.vm_cores}"
  cpu_type                = "${var.vm_cpu_type}"
  disks {
    disk_size         = "${var.vm_disk_size}"
    format            = "${var.vm_disk_format}"
    storage_pool      = "${var.vm_storage_pool}"
    storage_pool_type = "${var.vm_storage_pool_type}"
    type              = "${var.vm_disk_type}"
  }
  http_directory           = "ubuntu/22.04/config"
  insecure_skip_tls_verify = true
  iso_checksum             = "${var.iso_checksum}"
  iso_file                 = "${var.iso_filename}"
  memory                   = "${var.vm_memory}"
  network_adapters {
    bridge = "${var.vm_network_adapter_bridge}"
    model  = "${var.vm_network_adapter_model}"
  }
  node                 = "${var.proxmox_node}"
  proxmox_url          = "${var.proxmox_api_url}"
  qemu_agent           = "${var.vm_enable_qemu_agent}"
  scsi_controller      = "${var.vm_scsi_controller}"
  sockets              = "${var.vm_sockets}"
  ssh_password         = "${var.ssh_password}"
  ssh_timeout          = "20m"
  ssh_username         = "${var.ssh_username}"
  template_description = "${local.template_description}"
  template_name        = "${var.template_name}"
  token                = "${var.proxmox_token}"
  unmount_iso          = true
  username             = "${var.proxmox_user}"
  vm_id                = "${var.proxmox_vmid}"
}

build {
  description = "Ubuntu 22.04 Proxmox template (packer generated)"
  sources     = ["source.proxmox.autogenerated_1"]

  provisioner "shell" {
    inline = ["while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done"]
  }

  provisioner "shell" {
    execute_command = "echo 'proxmox' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    inline          = ["apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove --purge && apt-get -y clean"]
}
