# Lab 11 Commands Cheat Sheet

## List All Domain Users

```powershell
Get-ADUser -Filter *
```

---

## Display One User

```powershell
Get-ADUser power.user
```

---

## Display Specific Properties

```powershell
Get-ADUser power.user -Properties *
```

---

## Create New User

```powershell
New-ADUser `
-Name "Power User" `
-GivenName "Power" `
-Surname "User" `
-SamAccountName power.user `
-UserPrincipalName power.user@sufyanlab.local `
-Path "OU=IT,OU=Users,OU=Apex Solutions,DC=sufyanlab,DC=local" `
-AccountPassword (ConvertTo-SecureString "Welcome@1234" -AsPlainText -Force) `
-Enabled $true
```

---

## Search User

```powershell
Get-ADUser power.user
```

---

## Delete User

```powershell
Remove-ADUser power.user
```

---

## Disable User

```powershell
Disable-ADAccount power.user
```

---

## Enable User

```powershell
Enable-ADAccount power.user
```

---

## Unlock User

```powershell
Unlock-ADAccount power.user
```

---

## View All Properties

```powershell
Get-ADUser power.user -Properties *
```
