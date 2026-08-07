# Lab 16 - DHCP Server Deployment and Configuration

## Objective

Install and configure a DHCP Server in the Active Directory domain to automatically assign IP addresses to client computers.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows 11 Client (CL01)
- Domain: sufyanlab.local

Server IP:
192.168.10.10

Gateway:
192.168.10.1

DNS:
192.168.10.10

DHCP Scope:
192.168.10.50 - 192.168.10.200

---

## Tasks Performed

- Installed DHCP Server Role
- Authorized DHCP Server in Active Directory
- Created IPv4 Scope
- Configured IP Address Pool
- Configured Default Gateway
- Configured DNS Server
- Configured Parent Domain
- Activated DHCP Scope
- Configured Client to Obtain IP Automatically
- Renewed DHCP Lease
- Verified Lease Assignment
- Verified DNS Resolution
- Verified Address Lease inside DHCP Console

---

## Verification

Client received:

IP Address:
192.168.10.50

Gateway:
192.168.10.1

DNS:
192.168.10.10

DHCP Server:
192.168.10.10

Successfully tested:

- ipconfig /renew
- ping DC01
- ping 192.168.10.10
- nslookup DC01

Lease successfully appeared inside DHCP Address Leases.

---

## Skills Learned

- DHCP Installation
- DHCP Authorization
- Scope Configuration
- DHCP Address Leasing
- Automatic IP Assignment
- DNS Integration with DHCP
- DHCP Troubleshooting
## Concepts Learned

### Active Directory
Provides centralized authentication, authorization, and management for users, computers, and policies.

### DNS
Resolves human-readable names into IP addresses and vice versa.

### DHCP
Automatically leases IP addresses and network configuration to devices, eliminating manual IP assignment.

### Why DHCP Matters
Without DHCP, administrators would have to manually configure every computer. DHCP ensures consistent, automated, and scalable network configuration.
