# Lab 15 - Commands Cheat Sheet

## Verify Client Information

```cmd
hostname
```

```cmd
echo %COMPUTERNAME%
```

```cmd
whoami
```

```cmd
echo %LOGONSERVER%
```

---

## List All Computers

```powershell
Get-ADComputer -Filter *
```

---

## View Computer Information

```powershell
Get-ADComputer CL01 -Properties *
```

---

## Display Operating System Information

```powershell
Get-ADComputer CL01 -Properties OperatingSystem,OperatingSystemVersion,LastLogonDate,Enabled |
Select Name,Enabled,OperatingSystem,OperatingSystemVersion,LastLogonDate
```

---

## Search Computer Inside an OU

```powershell
Get-ADComputer -Filter * `
-SearchBase "OU=IT-PCs,OU=Computers,OU=Apex Solutions,DC=sufyanlab,DC=local"
```

---

## Disable Computer Account

```powershell
Disable-ADAccount -Identity "CL01$"
```

---

## Enable Computer Account

```powershell
Enable-ADAccount -Identity "CL01$"
```

---

## Verify Computer Status

```powershell
Get-ADComputer CL01 -Properties Enabled |
Select Name,Enabled
```

---

## Verify Last Logon

```powershell
Get-ADComputer CL01 -Properties Enabled,LastLogonDate |
Select Name,Enabled,LastLogonDate
```

---

## Verify Secure Channel (Client)

```powershell
Test-ComputerSecureChannel
```

Expected Output

```
True
```

---

## Verify Trust Relationship

```cmd
nltest /sc_verify:sufyanlab.local
```

Expected Output

```
NERR_Success
```

---

## Verify Domain Controller

```cmd
echo %LOGONSERVER%
```

Expected Output

```
\\DC01
```

---

## Notes

- Test-ComputerSecureChannel should be executed on a domain member computer.
- Domain Controllers return an expected error for this cmdlet.
- Computer accounts use a trailing '$' when referenced in PowerShell (e.g., CL01$).
- Disabling a computer account prevents domain authentication until re-enabled.
