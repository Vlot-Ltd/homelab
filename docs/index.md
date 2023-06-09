# ![vlot](./images/vlot.png)Home Lab

## Overview

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
    - [StarTech.com 1 Port PCIe Network Card](https://www.amazon.co.uk/dp/B00E4KZDJ0?psc=1&ref=ppx_yo2ov_dt_b_product_details)
    - [VisionTek Radeon 5450 2GB DDR3 (DVI-I, HDMI, VGA) Graphics Card](https://www.amazon.co.uk/dp/B01CN1F1ZM?psc=1&ref=ppx_yo2ov_dt_b_product_details)
  - Old "recovered" hardware
    - 2x 6Tb drives recovered from current Plex server eventually for data storage
- [![Raspberry Pi][RaspberryPi-Img]][RaspberryPi-Url]
  - 1x ![Raspberry Pi 4][RaspberryPi4-Img] 8Gb running K3s (will migrate to Proxmox)
  - 1x ![Raspberry Pi 4][RaspberryPi4-Img] 4Gb running Home Assistant (will migrate to Proxmox)
  - 1x ![Raspberry Pi 4][RaspberryPi4-Img] 4Gb - Deployed @SQA as Thousand Eyes end point temporarily
  - 1x ![Raspberry Pi 4][RaspberryPi4-Img] 2Gb - unused
  - 1x ![Raspberry Pi Zero 2][RaspberryPiZero2-Img] - unused
  - 2x ![Raspberry Pi Zero][RaspberryPiZero-Img] - unused
- [![Arduino][Arduino-Img]][Arduino-Url]
  - TBC
- ESP32/8266
  - TBC
- Switches, Routers, APs
  - 1x [![BT Smarthub 2][BT-Img]][BT-Url]
  - 2x [![BT Whole Home Wi-Fi Disc][BTDisc-Img]][BTDisc-Url]
  - 1x Netgear 8-port unmanaged switch

## Config

- Network
  - LAN: `192.168.1.0/24`
  - Gateway: `192.168.1.254`
  - DHCP: Range `192.168.1.150-.199` TBC
  - DNS Server: `192.168.1.254` 
- Wireless
  - BT Smart Hub 2.4Ghz/5Ghz Wi-Fi
  - Raspberry Pi XYZ as 2.4Ghz Wi-Fi for Smart Home devices
- [![Raspberry Pi][RaspberryPi-Img]][RaspberryPi-Doc-Url] configuration
- [![Proxmox VE][Proxmox-img]][Proxmox-Doc-Url] configuration


## Lab Environment & Deployed Apps

- [![TrueNAS][TrueNAS-Img]][TrueNas-Doc-Url]
- [![Plex Server][Plex-Img]][Plex-Doc-Url]
- [![Puppet Enterprise][PuppetEnterprise-Img]][Puppet-Doc-Url]
- [![K3S Cluster][K3s-Img]][Kubernetes-Doc-Url]

## General To-Dos

- [x] Order Hardware (Done - 2023-03-08)
- [x] Build Hardware
- [ ] Document Proxmox processes
- [ ] Create Packer scripts for Ubuntu 20.04 and Ubuntu 22.10
- [ ] Define, and write, required Puppet code

## Diagram & Photos

TBD

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[GitHub-Url]: https://github.com/Vlot-Ltd/homelab
[GitHub-Img]: https://img.shields.io/badge/GitHub-20232A?style=for-the-badge&logo=github
[Arduino-Img]: https://img.shields.io/badge/Arduino-20232A?style=for-the-badge&logo=arduino&logoColor=00979D
[Arduino-URL]: https://www.arduino.cc
[Bolt-Img]: https://img.shields.io/badge/Puppet_Bolt-20232A?style=for-the-badge&logo=puppet&logoColor=lightgreen
[Bolt-Url]: https://www.puppet.com/docs/bolt/latest/bolt.html
[BT-Img]: https://img.shields.io/badge/BT_Smarthub_2-20232A?style=for-the-badge&logo=bt&logoColor=6400AA
[BT-Url]: https://shop.bt.com/products/bt-smart-hub-2-097683-DYNK.html
[BTDisc-Img]: https://img.shields.io/badge/BT_Whole_Home_WiFi_Disc-20232A?style=for-the-badge&logo=bt&logoColor=6400AA
[BTDisc-Url]: https://shop.bt.com/brands/bt/whole-home-wi-fi
[K3s-Img]: https://img.shields.io/badge/K3s-20232A?style=for-the-badge&logo=k3s
[K3s-Url]: https://k3s.io
[Kubernetes-Doc-Url]: ./kubernetes.md
[Packer-Img]: https://img.shields.io/badge/Packer-20232A?style=for-the-badge&logo=packer
[Packer-Url]: https://proxmox.com/en/proxmox-ve
[Packer-Doc-Url]: ./packer.md
[Plex-Img]: https://img.shields.io/badge/Plex_Media_Server-20232A?style=for-the-badge&logo=plex
[Plex-Url]: https://plex.tv
[Plex-Doc-Url]: ./plex.md
[Proxmox-Img]: https://img.shields.io/badge/Proxmox-20232A?style=for-the-badge&logo=proxmox
[Proxmox-Url]: https://proxmox.com/en/proxmox-ve
[Proxmox-Doc-Url]: ./proxmox.md
[PuppetEnterprise-Img]: https://img.shields.io/badge/Puppet_Enterprise-20232A?style=for-the-badge&logo=puppet
[PuppetEnterprise-Url]: https://www.puppet.com/products/puppet-enterprise
[Puppet-Doc-Url]: ./puppet.md
[RaspberryPi-Img]: https://img.shields.io/badge/Raspberry_Pi-20232A?style=for-the-badge&logo=raspberrypi&logoColor=red
[RaspberryPi4-Img]: https://img.shields.io/badge/Raspberry_Pi_4-20232A?style=for-the-badge&logo=raspberrypi&logoColor=red
[RaspberryPiZero-Img]: https://img.shields.io/badge/Raspberry_Pi_Zero-20232A?style=for-the-badge&logo=raspberrypi&logoColor=red
[RaspberryPiZero2-Img]: https://img.shields.io/badge/Raspberry_Pi_Zero_2-20232A?style=for-the-badge&logo=raspberrypi&logoColor=red
[RaspberryPi-Url]: https://www.raspberrypi.com
[RaspberryPi-Doc-Url]: ./raspberrypi.md
[Terraform-Img]: https://img.shields.io/badge/terraform-20232A?style=for-the-badge&logo=terraform&logoColor=blueviolet
[Terraform-Url]: https://proxmox.com/en/proxmox-ve
[Terraform-Doc-Url]: ./terraform.md
[TrueNas-Img]: https://img.shields.io/badge/TrueNAS-20232A?style=for-the-badge&logo=truenas
[TrueNas-Url]: https://www.truenas.com
[TrueNas-Doc-Url]: ./truenas.md