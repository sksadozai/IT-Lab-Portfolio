# Lab 01 — Commands Cheat Sheet

**Apex Solutions — Internal Security Assessment**  
Replace example IPs and interface names with verified values. Run scans only against owned, isolated lab VMs.

## Kali: inspect interfaces, routes and profiles

```bash
ip -br addr
ip route
nmcli device status
nmcli connection show
ip route get 192.168.10.10
```

CorpNet traffic should use the internal interface directly. When NAT is enabled, the default route should use NAT, not CorpNet.

## Kali: internal connectivity and domain DNS

```bash
ping -c 4 192.168.10.10
nslookup SufyanLab.local 192.168.10.10
dig @192.168.10.10 SufyanLab.local
```

`dig` is optional if installed. A blocked ping may reflect firewall rules.

## Kali: Internet versus DNS

```bash
ip route
ping -c 3 1.1.1.1
getent hosts example.com
curl -I --connect-timeout 8 https://example.com
```

## DC01 PowerShell: network inspection

```powershell
Get-NetAdapter
Get-NetIPConfiguration
Get-NetRoute -DestinationPrefix '0.0.0.0/0'
ipconfig /all
```

## DC01: internal and domain checks

```powershell
ping 192.168.10.50
Resolve-DnsName SufyanLab.local
Get-Service DNS,NTDS
```

## DC01: Internet and DNS checks

```powershell
Test-NetConnection 1.1.1.1 -Port 443
Resolve-DnsName example.com
```

Keep the DC01 DNS client configured for the domain DNS server; investigate DNS forwarders separately.

## VirtualBox configuration

| Adapter | Mode | IP | Gateway |
|---|---|---|---|
| 1 | NAT | Automatic/DHCP | NAT-provided |
| 2 | Internal Network `CorpNet` | Static, unique `/24` | None |

Both machines must use the exact same CorpNet name and have Cable Connected checked. Disconnect NAT when running intentionally vulnerable services.

## Authorized Nmap baseline (pending)

```bash
nmap --version
sudo nmap -sn 192.168.10.0/24
sudo nmap -sS 192.168.10.10
sudo nmap -sV 192.168.10.10
mkdir -p ~/Apex-Security/Lab-01/Scans
sudo nmap -sS -sV 192.168.10.10 -oA ~/Apex-Security/Lab-01/Scans/DC01-Baseline
```

- `-sn`: host discovery, no port scan
- `-sS`: TCP SYN scan
- `-sV`: service/version detection
- `-oA`: `.nmap`, `.xml` and `.gnmap` outputs

## Troubleshooting sequence

1. Confirm VirtualBox adapter modes, cable connection and exact CorpNet name.
2. Map each guest interface to the right virtual adapter.
3. Check unique addresses and subnet masks.
4. Check route to the peer's internal IP.
5. Investigate host firewall only after checking addressing/routing.
6. Check NAT default route independently.
7. Separate public-IP/TCP reachability from DNS resolution.
8. Record the observed cause, fix and retest evidence.

**Current record:** Internal Kali/DC01 connectivity works. Internet/NAT issue remains open. Ubuntu Server is not configured yet.
