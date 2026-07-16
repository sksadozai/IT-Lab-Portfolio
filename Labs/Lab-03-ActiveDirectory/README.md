
---

# 📁 Lab03-ActiveDirectory/README.md

````markdown
# Lab 03 - Active Directory Domain Services

## Overview

This lab focuses on deploying the first Domain Controller of the enterprise network using Windows Server 2022.

---

## Objectives

- Configure a static IP address
- Install Active Directory Domain Services
- Install DNS Server
- Create a new Active Directory Forest
- Promote the server to a Domain Controller

---

## Server Information

Server Name

```
DC01
```

Domain

```
sufyanlab.local
```

NetBIOS Name

```
SUFYANLAB
```

---

## Static Network Configuration

| Setting | Value |
|----------|-------|
| IP Address | 192.168.10.10 |
| Subnet Mask | 255.255.255.0 |
| Preferred DNS | 192.168.10.10 |

---

## Why Static IP?

A Domain Controller must always use a fixed IP address because all clients depend on it for:

- Authentication
- DNS Resolution
- Active Directory Services
- Group Policy

---

## Installed Roles

- Active Directory Domain Services (AD DS)
- DNS Server
- Group Policy Management

---

## Deployment Summary

- Installed AD DS
- Created a New Forest
- Created the domain `sufyanlab.local`
- Assigned NetBIOS name `SUFYANLAB`
- Passed all prerequisite checks
- Successfully promoted the server to a Domain Controller

---

## Verification

Successful promotion was verified after reboot when the login screen displayed:

```
SUFYANLAB\Administrator
```

instead of the local Administrator account.

---

## Skills Learned

- Windows Server Administration
- Active Directory Deployment
- DNS Configuration
- Static IP Configuration
- Domain Controller Promotion
- Enterprise Identity Management

---

## Technologies Used

- Oracle VirtualBox
- Windows Server 2022 Standard
- Active Directory
- DNS
- PowerShell
- Server Manager

---

## Screenshots

Available in the `screenshots/` folder.

Recommended screenshots:

- Virtual Machine
- Static IP Configuration
- AD DS Installation Wizard
- New Forest
- Prerequisite Check
- Successful Promotion
- Domain Login Screen

---

## Next Lab

- Organizational Units (OU)
- Users
- Groups
- Windows 11 Domain Join
- DNS Testing

---

## Lab Status

Completed ✅
