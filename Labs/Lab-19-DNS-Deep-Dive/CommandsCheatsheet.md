# Lab 19 — DNS Command Cheat Sheet

## Client DNS / Network

```cmd
ipconfig /all
```
Show IP, subnet mask, gateway, DNS servers, DHCP information, and adapter details.

```cmd
ipconfig /flushdns
```
Clear the local DNS resolver cache.

```cmd
ipconfig /registerdns
```
Request DNS registration for the local machine.

## NSLookup

### Forward lookup
```cmd
nslookup dc01.sufyanlab.local
```

### Reverse lookup
```cmd
nslookup 192.168.10.10
```

### LDAP SRV lookup
```cmd
nslookup -type=SRV _ldap._tcp.sufyanlab.local
```

### Specific record types
```cmd
nslookup -type=A dc01.sufyanlab.local
nslookup -type=PTR 192.168.10.10
nslookup -type=CNAME files.sufyanlab.local
nslookup -type=MX sufyanlab.local
nslookup -type=NS sufyanlab.local
```

## PowerShell — DNS Server

### List zones
```powershell
Get-DnsServerZone
```

### List A records
```powershell
Get-DnsServerResourceRecord -ZoneName "sufyanlab.local" -RRType A
```

### List PTR records
```powershell
Get-DnsServerResourceRecord -ZoneName "10.168.192.in-addr.arpa" -RRType PTR
```

### List CNAME records
```powershell
Get-DnsServerResourceRecord -ZoneName "sufyanlab.local" -RRType CNAME
```

### List SRV records
```powershell
Get-DnsServerResourceRecord -ZoneName "sufyanlab.local" -RRType SRV
```

### List all records
```powershell
Get-DnsServerResourceRecord -ZoneName "sufyanlab.local"
```

## DNS Service

```powershell
Get-Service DNS
```

Check the DNS Server service.

```powershell
Restart-Service DNS
```

Restart the DNS service when appropriate during troubleshooting.

## Practical Troubleshooting Order

```text
1. ipconfig /all
2. Check DNS server
3. Test connectivity to DNS/DC
4. nslookup dc01.sufyanlab.local
5. Reverse lookup with nslookup <IP>
6. nslookup -type=SRV _ldap._tcp.sufyanlab.local
7. ipconfig /flushdns
8. ipconfig /registerdns
```

## Quick Reference

- **A:** Name → IPv4
- **PTR:** IPv4 → Name
- **CNAME:** Alias → Canonical name
- **NS:** Authoritative DNS server
- **MX:** Mail server
- **SRV:** Service location and port
- **Forward zone:** Names to addresses
- **Reverse zone:** Addresses to names
- **SRV records:** Especially important for Active Directory service discovery.

## Lab Reference

```text
Domain:       SufyanLab.local
DC01:         192.168.10.10
Reverse zone: 10.168.192.in-addr.arpa
