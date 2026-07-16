# Lab 02 - Virtual Network Design

## Overview

This lab focuses on designing an isolated enterprise network inside Oracle VirtualBox. All virtual machines communicate through an Internal Network named CorpNet.

---

## Objectives

- Create an isolated enterprise network
- Configure networking for all virtual machines
- Understand VirtualBox networking modes

---

## Network Topology

```

Internet
│
(Not Connected)
│

=====================
CorpNet (Internal Network)
=====================

│
├── DC01
├── ClientWin11
├── UbuntuServer
└── KaliLinux01


Network Configuration

Network Name

CorpNet

Network Type

Internal Network
Why Internal Network?

The Internal Network was selected because:

Communication is allowed only between lab machines.
The host operating system cannot access the lab.
The lab is isolated from the Internet.
Malware testing remains inside the virtual environment.
The environment closely resembles a private corporate LAN.
Virtual Machines Connected
Windows Server 2022
Windows 11 Client
Ubuntu Server
Kali Linux
Skills Learned
Internal Network Configuration
Enterprise Network Isolation
Virtual Network Design
VirtualBox Networking
Screenshots

Available in the screenshots/ folder.
