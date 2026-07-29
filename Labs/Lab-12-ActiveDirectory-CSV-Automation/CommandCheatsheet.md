# Lab 12 - Commands Cheat Sheet

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

## View Specific User

```powershell
Get-ADUser ali.test
```

---

## Import CSV

```powershell
Import-Csv C:\Scripts\Users.csv
```

---

## Run Script

```powershell
.\CreateUsers.ps1
```

---

## Create Secure Password

```powershell
ConvertTo-SecureString "Welcome@1234" -AsPlainText -Force
```

---

## Create Active Directory User

```powershell
New-ADUser
```

---

## Enable User

```powershell
-Enabled $true
```

---

## Specify OU

```powershell
-Path "OU=IT,OU=Users,OU=Apex Solutions,DC=sufyanlab,DC=local"
```

---

## Specify Username

```powershell
-SamAccountName ali.test
```

---

## Specify User Principal Name

```powershell
-UserPrincipalName ali.test@sufyanlab.local
```

---

## Verify User

```powershell
Get-ADUser ali.test
```

---

## Common Error

Duplicate Common Name (CN)

Example:

Ali Khan already exists inside the same OU.

PowerShell Error:

An attempt was made to add an object to the directory with a name that is already in use.

Solution:

Use a unique Name (CN) or create the user in a different OU.
