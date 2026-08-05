# Lab 14 - Commands Cheat Sheet

## Run User Creation Script

```powershell
.\CreateUsers.ps1
```

---

## Add Users to Security Groups

```powershell
.\AddUsersToGroups.ps1
```

---

## Import Active Directory Module

```powershell
Import-Module ActiveDirectory
```

---

## View All Users

```powershell
Get-ADUser -Filter *
```

---

## View User Information

```powershell
Get-ADUser APX1001 -Properties *
```

---

## View Department and Job Title

```powershell
Get-ADUser APX1001 -Properties Department,Title
```

---

## View Home Directory

```powershell
Get-ADUser APX1001 -Properties HomeDirectory,HomeDrive
```

---

## View Group Membership

```powershell
Get-ADPrincipalGroupMembership APX1001
```

---

## View Members of a Security Group

```powershell
Get-ADGroupMember "IT_Users"
```

---

## Force Group Policy Update

```cmd
gpupdate /force
```

---

## Verify Domain Connectivity

```cmd
ping dc01
```

---

## Verify SMB Connections

```cmd
net use
```

---

## Open Home Folder

```cmd
\\DC01\Users$\APX1001
```

---

## Open Department Share

```cmd
\\DC01\IT
```

---

## Verify Shared Resources

```cmd
net view \\DC01
```

---

## Verify Current Logged-in User

```cmd
whoami
```

---

## Verify Current Domain

```cmd
echo %USERDOMAIN%
```

---

## Password Verification

First login should require:

- Change Password at Logon

---

## Validation Checklist

- [x] Users created
- [x] Users added to OUs
- [x] Security Groups assigned
- [x] Home folders created
- [x] H: Drive mapped
- [x] Password changed at first logon
- [x] Own Home Folder accessible
- [x] Other Home Folders denied
- [x] Department Share accessible
- [x] Other Department Shares denied
