# ![vlot](./images/vlot.png)Home Lab

# Overview

This (WIP) page describes a home lab environment for evaluation and testing of various technologies. Basic provisioning & configuration of both supporting infrastructure and additional products is documented here - mostly so I remember how I did stuff.

[![GitHub Repo][GitHub-Img]][GitHub-Url]

## Goals

- Reduce complexity of current, thrown together, Homelab made of a differse stack of Raspberry Pi's (for Home Assistant, K3s, and experimentations), an ancient PC running plex and docker (which constantly struggles for space) with a single server running Proxmox.
- Simplicity (as much as possible)
- Raspberry Pis for single purpose like Octoprint and experiments that are very short lived.
- Codified & documented config leading to trivial re/deployments.
- Learning
- Potential to replicate (parts) at work for process imrovements

## Software

- [![Proxmox VE][Proxmox-img]][Proxmox-Url] server for KVM based virtual machines and LXC containers.
- [![Hashicorp Packer][Packer-img]][Packer-Url] to build standard images for VMs and LXC containers.
- [![Hashicorp Terraform][Terraform-Img]][Terraform-Url] to create VMs using IaaC practises.
- [![Puppet Enterprise][PuppetEnterprise-Img]][PuppetEnterprise-Url] to manage server configurations.
- [![Puppet Bolt][Bolt-Img]][Bolt-Url] to run tasks and plan to aid in server management.
- [![Grafana Cloud][Grafana-Img]][Grafana-Url] for monitoring (traces, logs, metrics) and dashboarding.


## Hardware

- Server
  - Hardware (from [CCL Online](https://www.cclonline.com))
    - [Antec P101 Silent Mid Tower Case - Black](https://www.antec.com/product/case/p101-silent)
    - [Antec High Current Gamer 1000W Modular 80+ Gold PSU](https://www.antec.com/product/power/hcg1000-gold)
    - [ASRock Z790 Pro RS Intel Socket 1700 Motherboard](https://www.asrock.com/mb/Intel/Z790%20Pro%20RS/index.asp)
    - [Intel Core i5 13600K Raptor Lake-S CPU](https://www.intel.com/content/www/us/en/products/sku/230493/intel-core-i513600k-processor-24m-cache-up-to-5-10-ghz/specifications.html)
      - [Be Quiet! Pure Rock 2 Black Air Tower CPU Cooler](https://www.bequiet.com/en/cpucooler/1842)
    - [Kingston FURY Beast 64GB (2x 32GB) 5600MHz DDR5 RAM](https://www.kingston.com/unitedkingdom/en/memory/gaming/kingston-fury-beast-ddr5-memory) (can be doubled later)
    - [Samsung 970 EVO Plus 250GB M.2-2280 PCIe 3.0 x4 NVMe SSD](https://www.samsung.com/uk/memory-storage/nvme-ssd/980-pro-pcle-4-0-nvme-m-2-ssd-250gb-mz-v8p250bw/) for Proxmox boot disk
    - 2x [Western Digital BLACK SN770 2TB M.2-2280 PCIe 4.0 x4 NVMe SSD](https://www.westerndigital.com/products/internal-drives/wd-black-sn770-nvme-ssd#WDS200T3X0E) for VM OS
    - 2x [Seagate IronWolf 12TB NAS Hard Drive, 3.5 inch, 7200RPM, 256MB Cache, CMR](https://www.seagate.com/gb/en/products/nas-drives/ironwolf-hard-drive/) for data storage (Plex, TrueNas, backups)
  - Old "recovered" hardware
    - 2x 8Tb drives recovered from current Plex server eventually for data storage
- [![Raspberry Pi][RaspberryPi-Img]][RaspberryPi-Url]
  - 1x Raspberri Pi 4 8Gb running K3s (will migrate to Proxmox)
  - 1x Raspberri Pi 4 4Gb running Home Assistant (will migrate to Proxmox)
  - 1x Raspberri Pi 4 4Gb - unused
  - 1x Raspberri Pi 4 2Gb - unused
  - 1x Raspberry Pi Zero 2 - unused
  - 2x Raspberry Pi Zero - unused
- Arduino
  - TBC
- ESP32/8266
  - TBC
- Switches, Routers, APs
  - 1x [BT Smart Hub 2](https://shop.bt.com/products/bt-smart-hub-2-097683-DYNK.html)
  - 2x [BT Whole Home Wi-Fi](https://shop.bt.com/brands/bt/whole-home-wi-fi) discs
  - 1x Netgear 8-port unmanaged switch


## Config

- Network
  - LAN: `192.168.1.0/24`
  - Gateway: `192.168.1.254`
  - DHCP: Range `192.168.2.150-.199` TBC
  - DNS Server: `192.168.1.254` 
- Wireless
  - BT Smart Hub 2.4Ghz/5Ghz Wi-Fi
  - Raspberry Pi XYZ as 2.4Ghz Wi-Fi for Smart Home devices

### **Raspberry Pi Provisioning & Config**

TBC

### **Proxmox Hypervisor Provisioning & Config**

Proxmox configuration requires installation of [Proxmox VE](https://www.proxmox.com/en/downloads) on the server. The configuration steps need to be confirmed.

## Metrics, Monitoring & Logging

- Prometheus / Grafana Cloud --- DOCUMENT SETUP
- Zabbix

## Proxmox VM Templates

VM deployments based on a [template](https://pve.proxmox.com/wiki/VM_Templates_and_Clones) are much faster than running through a new install. The packer code in this repo builds Proxmox template images (and handles OS / package updates) for most frequently used VM operating systems. These templates are used for later infrastructure provisioning.

## Lab Environment & Deployed Apps

### [![TrueNAS][TrueNAS-Img]][TrueNas-Url]

- 1x  Virtual Server
  - Document virtual hardware

### [![Plex Server][Plex-Img]][Plex-Url]

- 1x Virtual Server
  - Ubuntu 22.04
  - X vCPU
  - X Gb RAM
  - X Gb OS Disk
  - X Tb Data Disk

### [![Puppet Enterprise][PuppetEnterprise-Img]][PuppetEnterprise-Url]

- 1x Virtual Server
  - Ubuntu 20.04
  - 2 vCPU
  - 4 Gb RAM
  - 75 Gb OS Disk

### [![K3S Cluster][K3s-Img]][K3s-Url]

- 1x k3s master server (Proxmox VM)
- 2x k3s worker nodes (Proxmox VMs)
- Specs
  - 2 vCPU
  - 4Gb RAM
  - 250 Gb OS Disk
- Auto shutdown nodes on low util

## General To-Dos

- [x] Order Hardware (Done - 2023-03-08)
- [ ] Build Hardware
- [ ] Document Proxmox processes
- [ ] Create Packer scripts for Ubuntu 20.04 and Ubuntu 22.10
- [ ] Define, and write, required Puppet code

## Diagram & Photos

TBD

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[GitHub-Url]: https://github.com/Vlot-Ltd/homelab
[GitHub-Img]: https://img.shields.io/badge/GitHub-20232A?style=for-the-badge&logo=github
[Bolt-Img]: https://img.shields.io/badge/Puppet_Bolt-20232A?style=for-the-badge&logo=puppet&logoColor=lightgreen
[Bolt-Url]: https://www.puppet.com/docs/bolt/latest/bolt.html
[K3s-Img]: https://img.shields.io/badge/K3s-20232A?style=for-the-badge&logo=k3s
[K3s-Url]: https://k3s.io
[Packer-Img]: https://img.shields.io/badge/Packer-20232A?style=for-the-badge&logo=packer
[Packer-Url]: https://proxmox.com/en/proxmox-ve
[Plex-Img]: https://img.shields.io/badge/Plex_Media_Server-20232A?style=for-the-badge&logo=plex
[Plex-Url]: https://plex.tv
[Proxmox-Img]: https://img.shields.io/badge/Proxmox-20232A?style=for-the-badge&logo=proxmox
[Proxmox-Url]: https://proxmox.com/en/proxmox-ve
[PuppetEnterprise-Img]: https://img.shields.io/badge/Puppet_Enterprise-20232A?style=for-the-badge&logo=puppet
[PuppetEnterprise-Url]: https://www.puppet.com/products/puppet-enterprise
[RaspberryPi-Img]: https://img.shields.io/badge/RaspberryPi-20232A?style=for-the-badge&logo=raspberrypi&logoColor=red
[RaspberryPi-Url]: https://www.raspberrypi.com
[Terraform-Img]: https://img.shields.io/badge/terraform-20232A?style=for-the-badge&logo=terraform&logoColor=blueviolet
[Terraform-Url]: https://proxmox.com/en/proxmox-ve
[TrueNas-Img]: https://img.shields.io/badge/TrueNAS-20232A?style=for-the-badge&logo=truenas
[TrueNas-Url]: https://www.truenas.com