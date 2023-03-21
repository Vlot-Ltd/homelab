<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# ![vlot](./docs/images/vlot.png)Home Lab

# Overview

This (WIP) page describes a home lab environment for evaluation and testing of various technologies. Basic provisioning & configuration of both supporting infrastructure and additional products is documented here.

[![GitHub Repo][GitHub-Img]][GitHub-Url]

## Goals

- Reduce complexity of current, thrown together, Homelab made of a differse stack of Raspberry Pi's (for Home Assistant, K3s, and experimentations), an ancient PC running plex and docker (which constantly struggles for space) with a single server running Proxmox.
- Simplicity (as much as possible)
- Raspberry Pis for single purpose like Octoprint and experiments that are very short lived.
- Codified & documented config leading to trivial re/deployments.
- Learning
- Potential to replicate (parts) at work for process imrovements

### Built With

* [![Proxmox][Proxmox-Img]][Proxmox-Url]
* [![Packer][Packer-Img]][Packer-Url]
* [![Terraform][Terraform-Img]][Terraform-Url]
* [![Puppet Bolt][Bolt-Img]][Bolt-url]

## Ideas (and more) from

- [Matthew Kalnins Proxmox Homelab](https://matthewkalnins.com/posts/home-lab-setup-part-1-proxmox-cloud-init/)
- [Packer Proxmox Homelab](https://cloudalbania.com/posts/2022-01-homelab-with-proxmox-and-packer/)
  - [Packer Proxmox Homelab GIT repo](https://gitlab.com/cloudalbania/packer-proxmox-lab.git)
- [Homelab Monorepo GIT](https://github.com/clayshek/homelab-monorepo)


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
[Terraform-Img]: https://img.shields.io/badge/terraform-20232A?style=for-the-badge&logo=terraform&logoColor=blueviolet
[Terraform-Url]: https://proxmox.com/en/proxmox-ve
[TrueNas-Img]: https://img.shields.io/badge/TrueNAS-20232A?style=for-the-badge&logo=truenas
[TrueNas-Url]: https://www.truenas.com