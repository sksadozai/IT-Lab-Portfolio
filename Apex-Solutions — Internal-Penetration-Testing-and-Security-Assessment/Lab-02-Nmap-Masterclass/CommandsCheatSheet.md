# Lab 02 — Nmap Commands Cheat Sheet

**Authorized lab target:** `192.168.10.10` (DC01). Run only against your owned CorpNet.

## Workspace and connectivity
```bash
mkdir -p ~/Apex-Security/Lab-02/{Scans,Notes}
cd ~/Apex-Security/Lab-02
ip -br addr
ip route
ping -c 4 192.168.10.10
```

## Discovery (no port scan)
```bash
sudo nmap -sn -PE 192.168.10.10 -oN Scans/01-ICMP-Discovery.txt
sudo nmap -sn -PE --disable-arp-ping 192.168.10.10 -oN Scans/02-ICMP-Only.txt
sudo nmap -sn -PS445,3389 --disable-arp-ping 192.168.10.10 -oN Scans/03-TCP-SYN-Discovery.txt
sudo nmap -sn -PA445,3389 --disable-arp-ping 192.168.10.10 -oN Scans/04-TCP-ACK-Discovery.txt
sudo nmap -sn 192.168.10.0/24 -oA Scans/05-CorpNet-Discovery
```

## TCP scans
```bash
sudo nmap -sS -Pn 192.168.10.10 -oA Scans/06-DC01-SYN
nmap -sT -Pn 192.168.10.10 -oA Scans/07-DC01-Connect
sudo nmap -sS -Pn -p 53,88,135,139,389,445,464,636,3268,3269,3389 192.168.10.10 -oA Scans/08-DC01-Targeted
sudo nmap -sS -Pn -p- 192.168.10.10 -oA Scans/09-DC01-All-TCP
```

## UDP and fingerprinting
```bash
sudo nmap -sU -Pn -p 53,123,137,138,161 192.168.10.10 -oA Scans/10-DC01-UDP
sudo nmap -sU -sV -Pn -p 53,123 192.168.10.10 -oA Scans/11-DC01-UDP-Version
sudo nmap -sV -Pn -p 53,88,135,139,389,445,464,636,3268,3269,3389 192.168.10.10 -oA Scans/12-DC01-Services
sudo nmap -O -Pn 192.168.10.10 -oA Scans/13-DC01-OS
sudo nmap -sS -sV -O -Pn 192.168.10.10 -oA Scans/14-DC01-Combined
```

## Selected NSE scripts
```bash
nmap --script-help smb-os-discovery
sudo nmap -Pn -p445 --script smb-protocols,smb2-security-mode,smb-os-discovery 192.168.10.10 -oA Scans/15-DC01-SMB
sudo nmap -sU -Pn -p53 --script dns-recursion 192.168.10.10 -oA Scans/16-DC01-DNS
```

## Focused follow-up (actual result: all four filtered)
```bash
sudo nmap -sS -sV -Pn -p 6049,6050,6052,6053 --reason 192.168.10.10 -oA Scans/17-DC01-Unexpected-Ports
```

| Port | Actual state | Reason | SERVICE label only |
|---|---|---|---|
| 6049/tcp | filtered | no-response | x11 |
| 6050/tcp | filtered | no-response | arcserve |
| 6052/tcp | filtered | no-response | x11 |
| 6053/tcp | filtered | no-response | x11 |

**Important:** These labels do not confirm running applications. No open service was established on these ports.

## Quick flag reference
| Flag | Meaning |
|---|---|
| `-sn` | Host discovery, no port scan |
| `-PE` | ICMP echo probe |
| `--disable-arp-ping` | Disable ARP host discovery |
| `-PS` / `-PA` | TCP SYN / ACK discovery |
| `-sS` / `-sT` | SYN / connect scan |
| `-sU` | UDP scan |
| `-sV` | Service/version probes |
| `-O` | OS fingerprinting |
| `-Pn` | Skip host discovery |
| `-p-` | All TCP ports with TCP scan |
| `--reason` | Show reason for port state |
| `-oN` / `-oA` | Normal output / all three main output formats |

**Interpretation rule:** `open` is not automatically vulnerable; `filtered` does not confirm a listening service; OS and version guesses require verification.
