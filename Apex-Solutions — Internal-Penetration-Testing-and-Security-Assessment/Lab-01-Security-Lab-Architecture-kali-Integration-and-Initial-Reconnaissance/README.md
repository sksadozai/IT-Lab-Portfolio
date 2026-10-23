# Lab 01 — Security Lab Architecture, Kali Integration & Initial Reconnaissance

**Project:** Apex Solutions — Internal Security Assessment  
**Status:** CorpNet connectivity confirmed; NAT Internet issue outstanding; Nmap baseline pending.

## Objective
Reuse existing Kali Linux and DC01 (Windows Server 2022) virtual machines for an authorized, isolated internal security assessment. The Packet Tracer enterprise project is an architectural reference and is not directly connected to VirtualBox.

## Authorized scope and addressing

| VM | Role | Example CorpNet IP | Status |
|---|---|---|---|
| DC01 | Active Directory/DNS | `192.168.10.10/24` | Running; internal connectivity confirmed |
| Kali Linux | Assessment workstation | `192.168.10.50/24` | Running; internal connectivity confirmed |
| Windows 11 | Domain workstation | `192.168.10.20/24` | Optional for later exercise |
| Ubuntu Server | Future Linux/web target | TBD | Not yet configured |

**Verify actual IPs from your screenshots before treating the examples above as the final inventory.** Existing domain: `SufyanLab.local`. Only personally controlled lab VMs are in scope; do not scan physical or public networks.

## Network architecture

- VirtualBox **Adapter 1: NAT** — optional Internet access for updates; IPv4/DNS/default route generally assigned automatically.
- VirtualBox **Adapter 2: Internal Network `CorpNet`** — private VM-to-VM communication; manually assigned, nonconflicting lab IPs; **no default gateway**.
- All VMs on CorpNet must use exactly the same Internal Network name and have Cable Connected enabled.
- NAT is not the shared company LAN. Disconnect NAT while intentionally vulnerable lab services are running.
- With an 8 GB host, run only necessary VMs at once (initially DC01 and Kali).

## Work completed and troubleshooting

1. Started Kali and DC01.
2. Initial ping attempts failed with destination unreachable/timeout symptoms.
3. Corrected a mistaken network/connection configuration.
4. Confirmed Kali ↔ DC01 communication over CorpNet.
5. Captured screenshots of the working configuration.

**Open issue:** Internet access on both VMs stopped working or remained unavailable after IP changes. Root cause has not yet been verified. Do not claim it is fixed until NAT routing and DNS have been tested separately.

## Baseline verification commands

Kali:

```bash
ip -br addr
ip route
nmcli device status
ip route get 192.168.10.10
ping -c 4 192.168.10.10
nslookup SufyanLab.local 192.168.10.10
```

DC01 (PowerShell):

```powershell
Get-NetAdapter
Get-NetIPConfiguration
Get-NetRoute -DestinationPrefix '0.0.0.0/0'
ping 192.168.10.50
Resolve-DnsName SufyanLab.local
```

Use actual IPs if different. Preserve DC01's internal/domain DNS configuration.

## Internet troubleshooting — next action

Kali:

```bash
ip route
ping -c 3 1.1.1.1
getent hosts example.com
curl -I --connect-timeout 8 https://example.com
```

DC01:

```powershell
Get-NetIPConfiguration
Get-NetRoute -DestinationPrefix '0.0.0.0/0'
Test-NetConnection 1.1.1.1 -Port 443
Resolve-DnsName example.com
```

Check Adapter 1 is NAT, enabled and cable-connected; it should obtain automatic addressing and the default route. CorpNet must not have a default gateway. An ICMP failure alone does not prove Internet failure. Do not replace DC01's internal DNS with public DNS merely to fix browsing; investigate its DNS forwarders separately.

## Initial reconnaissance — pending

After verifying scope and snapshots, run only against the owned isolated subnet:

```bash
sudo nmap -sn 192.168.10.0/24
sudo nmap -sS -sV 192.168.10.10
mkdir -p ~/Apex-Security/Lab-01/Scans
sudo nmap -sS -sV 192.168.10.10 -oA ~/Apex-Security/Lab-01/Scans/DC01-Baseline
```

Open ports are not automatically vulnerabilities. Compare findings to expected DC01 roles. Mark scanning complete only after actually running and saving outputs.

## Evidence checklist

Store screenshots under `Resources/Screenshots/` and scan outputs under `Resources/Scans/`:

- [x] Working internal Kali/DC01 connectivity — screenshots captured; insert actual filenames
- [ ] Both VirtualBox adapters and network names
- [ ] Kali interface and routing table
- [ ] DC01 interface and routing table
- [ ] Domain DNS resolution
- [ ] NAT troubleshooting and resolution
- [ ] Baseline snapshots
- [ ] Nmap host discovery
- [ ] DC01 service scan and saved outputs

## Next milestone

Resolve or explicitly defer NAT Internet access; confirm snapshots and complete the authorized Nmap baseline. Then proceed to Lab 02 — Network Discovery & Nmap Masterclass.
