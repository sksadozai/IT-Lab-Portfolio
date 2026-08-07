# Lab 16 - Commands Cheat Sheet

## Check IP Configuration

```powershell
ipconfig /all
```

---

## Release Current IP

```powershell
ipconfig /release
```

---

## Request New DHCP Address

```powershell
ipconfig /renew
```

---

## Test Connectivity

```powershell
ping DC01
```

```powershell
ping 192.168.10.10
```

---

## Test DNS Resolution

```powershell
nslookup DC01
```

---

## Display Current Network Configuration

```powershell
Get-NetIPAddress
```

---

## Display DHCP Lease Information

```powershell
Get-NetIPConfiguration
```

---

## DHCP Management Console

Server Manager

Tools

DHCP

IPv4

Scope

Address Leases

---

## Verification Checklist

✔ DHCP Role Installed

✔ DHCP Authorized

✔ Scope Activated

✔ Client Received IP Automatically

✔ DNS Resolution Working

✔ Address Lease Visible
