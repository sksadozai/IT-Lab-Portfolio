# Lab 13 - Commands Cheat Sheet

## Import Active Directory Module

```powershell
Import-Module ActiveDirectory
```

---

## Import CSV File

```powershell
Import-Csv C:\Scripts\Employees.csv
```

---

## Run User Creation Script

```powershell
.\CreateUsers.ps1
```

---

## Run Group Assignment Script

```powershell
.\AddUsersToGroups.ps1
```

---

## Display All Active Directory Users

```powershell
Get-ADUser -Filter *
```

---

## Display Selected User Information

```powershell
Get-ADUser APX1001 -Properties Department,Title | Select Name,SamAccountName,Department,Title
```

---

## Display All Security Groups

```powershell
Get-ADGroup -Filter * | Select Name
```

---

## Display Members of a Security Group

```powershell
Get-ADGroupMember "IT_Users"
```

```powershell
Get-ADGroupMember "Finance_Users"
```

```powershell
Get-ADGroupMember "HR_Users"
```

```powershell
Get-ADGroupMember "Sales_Users"
```

---

## Search for a Specific User

```powershell
Get-ADUser APX1001
```

---

## Delete a User

```powershell
Remove-ADUser APX1001
```

---

## Convert Plain Text Password

```powershell
ConvertTo-SecureString "Welcome@12345" -AsPlainText -Force
```

---

## PowerShell Concepts Used

- Import-Csv
- Foreach
- Switch
- Variables
- New-ADUser
- Add-ADGroupMember
- Get-ADUser
- Get-ADGroup
- Get-ADGroupMember
- Try
- Catch
- ErrorAction Stop
- ConvertTo-SecureString
