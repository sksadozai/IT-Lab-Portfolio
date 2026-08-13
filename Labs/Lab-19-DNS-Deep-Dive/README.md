# Lab 19 — DNS Deep Dive

## Overview
Practical DNS administration in a Windows Active Directory environment: forward/reverse lookup, DNS records, AD service discovery, and troubleshooting.

## Lab Environment
- Domain: `SufyanLab.local`
- Domain Controller / DNS Server: `DC01`
- Client: `CL01`
- Internal/Host-only network: `192.168.10.0/24`
- DC01 host-only IP: `192.168.10.10`

## Objectives
- Forward and Reverse Lookup Zones
- A, PTR, CNAME, NS, MX, and SRV records
- Active Directory DNS service discovery
- `nslookup` testing
- DNS cache flushing and registration
- Basic DNS troubleshooting

## Practical Work

### Forward Lookup Zone
Inspected the existing `SufyanLab.local` zone and its Active Directory DNS structures, including `_tcp` and `_sites`.

### A Record
Inspected DC01's A record:
`DC01.sufyanlab.local → 192.168.10.10`

DC01 also has other interface/address entries because of the VirtualBox lab networking.

### Reverse Lookup Zone
Created an IPv4 reverse zone for `192.168.10.0/24`:

`10.168.192.in-addr.arpa`

Configured it as an Active Directory-integrated primary zone with secure dynamic updates.

### PTR Record
Created and tested:

`192.168.10.10 → DC01.sufyanlab.local`

### CNAME
Created and tested:

`files.sufyanlab.local → DC01.sufyanlab.local`

### NS and MX
Reviewed:
- **NS:** identifies authoritative DNS servers for a zone.
- **MX:** identifies mail servers responsible for email delivery.

No unnecessary mail server infrastructure was created.

### SRV Records — Active Directory
Inspected AD SRV records such as:

`_ldap._tcp → DC01.sufyanlab.local : TCP 389`

Also reviewed Kerberos-related SRV records. SRV records allow AD clients to discover services such as LDAP and Kerberos.

### Troubleshooting
Used `nslookup` from CL01 for hostname and SRV lookups. Compared client results with the actual SRV records on DC01 to demonstrate evidence-based DNS troubleshooting.

## Key Concepts

| Item | Purpose |
|---|---|
| A | Hostname → IPv4 |
| PTR | IPv4 → hostname |
| CNAME | Alias → canonical hostname |
| NS | Authoritative name server |
| MX | Mail server |
| SRV | Service, port, and target host |
| Forward Lookup | Name → address |
| Reverse Lookup | Address → name |
| Flush DNS | Clear local DNS cache |
| Register DNS | Request DNS registration |

## Real-World Relevance
DNS is critical to Windows/Active Directory environments. A PC can have network connectivity and Internet access yet still fail to locate a Domain Controller or join the domain if its DNS configuration is wrong.

A practical troubleshooting sequence is:
1. Check network configuration.
2. Verify the DNS server.
3. Test connectivity to the DNS/DC.
4. Test hostname resolution.
5. Test AD SRV service discovery.
6. Flush stale DNS cache if appropriate.
7. Re-register DNS if appropriate.

## Outcome
Successfully configured and tested forward/reverse DNS functionality, A/PTR/CNAME records, and Active Directory SRV service discovery.

**Lab 19 — COMPLETED**
