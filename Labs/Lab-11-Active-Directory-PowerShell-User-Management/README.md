# Lab 11 - Active Directory PowerShell User Management

## Objective

Learn how to manage Active Directory users using Windows PowerShell instead of the graphical interface (ADUC). This lab introduces automation for user administration and lays the foundation for scripting and bulk user management.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows PowerShell
- Active Directory Module
- Active Directory Users and Computers

---

## Tasks Completed

### Verified Active Directory Module

Confirmed that the Active Directory PowerShell module was installed and working.

---

### Listed Domain Users

Displayed all users stored in Active Directory.

Command:

```powershell
Get-ADUser -Filter *
```

---

### Created a User Using PowerShell

Created a new domain user entirely from PowerShell.

Example:

- Name
- Given Name
- Surname
- SamAccountName
- User Principal Name
- Organizational Unit
- Password
- Enabled Account

---

### Verified User Creation

Verified that the new user existed using:

```powershell
Get-ADUser power.user
```

Also confirmed the user inside Active Directory Users and Computers.

---

### Learned Important PowerShell Syntax

- Cmdlets
- Parameters
- SecureString passwords
- Distinguished Names (DN)
- OU paths
- User attributes

---

## Skills Learned

- Windows PowerShell
- Active Directory PowerShell Module
- AD User Automation
- PowerShell Syntax
- User Verification
- Active Directory Administration

---

## Blue Team Perspective

PowerShell allows administrators to:

- Create users consistently
- Reduce manual configuration errors
- Automate repetitive administrative tasks
- Standardize account creation
- Produce repeatable administration scripts

Automation also reduces configuration mistakes that attackers can exploit.

---

## Red Team Perspective

Attackers frequently abuse PowerShell because it is installed by default on Windows systems.

A defender should:

- Monitor PowerShell activity
- Enable PowerShell logging
- Restrict unnecessary PowerShell access
- Review executed scripts
- Detect suspicious commands

Understanding PowerShell helps both administrators and defenders recognize malicious activity.

---

## Result

Successfully managed Active Directory users using Windows PowerShell and verified user creation within the domain.
