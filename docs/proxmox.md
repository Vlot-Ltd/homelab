# [![Proxmox VE][Proxmox-img]][Proxmox-Url]

## **Proxmox Hypervisor Provisioning & Config**

Proxmox configuration requires installation of [Proxmox VE](https://www.proxmox.com/en/downloads) on the server. The configuration steps need to be confirmed.

https://forum.proxmox.com/threads/installation-gui-fails-to-start.124854/#post-545030

## Proxmox VM Templates

VM deployments based on a [template](https://pve.proxmox.com/wiki/VM_Templates_and_Clones) are much faster than running through a new install. The packer code in this repo builds Proxmox template images (and handles OS / package updates) for most frequently used VM operating systems. These templates are used for later infrastructure provisioning.


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Proxmox-Img]: https://img.shields.io/badge/Proxmox-20232A?style=for-the-badge&logo=proxmox
[Proxmox-Url]: https://proxmox.com/en/proxmox-ve