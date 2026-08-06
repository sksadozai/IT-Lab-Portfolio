# Lab 15 – Active Directory Computer Objects Management

## Objective
Learn how to manage computer objects in Active Directory, organize them into Organizational Units (OUs), verify domain membership, and test the secure channel between a domain-joined client and the Domain Controller.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows 11 Client (CL01)
- Active Directory Domain Services
- Domain: sufyanlab.local
- PowerShell
- Active Directory Users and Computers (ADUC)

---

## Tasks Completed

### 1. Created Computer OU Structure

Verified and completed the Computer OU hierarchy under Apex Solutions.

```
Apex Solutions
└── Computers
    ├── Finance-PCs
    ├── HR-PCs
    ├── IT-PCs
    ├── Management-PCs
    ├── Sales-PCs
    ├── Servers
    └── Testing
```

---

### 2. Verified Client Computer

Confirmed the Windows 11 client information.

- Computer Name: CL01
- Domain: sufyanlab.local
- Logged-in User: APX1002
- Client joined successfully to the domain.

---

### 3. Moved Computer Object

Moved CL01 into:

```
OU=IT-PCs
OU=Computers
OU=Apex Solutions
```

Verified using:

- Active Directory Users and Computers
- PowerShell

---

### 4. Retrieved Computer Information

Verified:

- Computer Name
- Operating System
- Operating System Version
- Enabled Status
- Distinguished Name
- Last Logon Date

using PowerShell.

---

### 5. Disabled Computer Account

Disabled CL01 using PowerShell.

Verified:

- Computer Account Status
- Login Failure
- Trust Relationship Error

Observed that domain logon failed while the computer account was disabled.

---

### 6. Re-enabled Computer Account

Enabled CL01 again.

Verified successful domain logon.

---

### 7. Tested Secure Channel

Verified the trust relationship between CL01 and DC01 using:

- nltest
- Test-ComputerSecureChannel

Result:

✔ Secure Channel Healthy

---

### 8. Important Observation

Test-ComputerSecureChannel returns an error on the Domain Controller.

This behavior is expected because the cmdlet is intended for domain member computers rather than Domain Controllers.

---

## Skills Learned

- Active Directory Computer Objects
- Computer OU Organization
- Domain Joined Computers
- Computer Account Management
- Enable / Disable Computer Objects
- Secure Channel Verification
- Trust Relationship Testing
- Active Directory PowerShell
- ADUC Administration

---

## Result

Successfully managed computer objects inside Active Directory.

Verified domain membership, computer account management, trust relationship, and secure channel between the client computer and Domain Controller.
