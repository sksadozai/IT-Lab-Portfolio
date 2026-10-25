# Apex Solutions — Internal Security Assessment
## Lab 02 — Nmap Masterclass

**Target:** DC01 (Windows Server 2022), `192.168.10.10`  
**Assessment host:** Kali Linux, CorpNet `192.168.10.50`  
**Scope:** Owned VirtualBox internal network only  
**Status:** Practical scanning complete; retain original scan outputs and screenshots as evidence.

## Objectives
Compare discovery probes, TCP SYN and connect scanning, UDP scanning, service/version detection, OS fingerprinting, and selected NSE enumeration. Distinguish confirmed findings from guesses and uncertain port states.

## Procedure and observations

### 1. Host discovery
Used ICMP discovery with and without ARP probing, plus TCP SYN/ACK discovery and subnet discovery. DC01 was reported up; MAC address was observed and latency varied. `-sn` deliberately performs **no port scan**, so absence of displayed ports is expected. On a directly attached Ethernet network Nmap may prefer ARP; `--disable-arp-ping` allows comparison without ARP host discovery.

### 2. TCP scans
Compared `-sS` (SYN) and `-sT` (connect) and observed substantially matching port states. The SYN output included a MAC address while the connect output did not; MAC display is affected by privileges/link-layer discovery and is not a defining difference between the scan types. Targeted scanning identified several expected Windows infrastructure services. `ms-wbt-server` (commonly TCP/3389, RDP) was reported **filtered**; this does not prove that RDP is enabled or disabled. A full TCP scan also prompted follow-up of ports 6049, 6050, 6052, 6053.

### 3. UDP scans
DNS/domain and NTP-related responses were observed, with some uncertain or filtered results. A string beginning `SF-` in Nmap service-detection output is generally a service fingerprint for a response it could not confidently identify, not evidence of encrypted credentials. Preserve exact original UDP output for authoritative port/state reporting.

### 4. OS fingerprinting
Nmap returned probabilistic/aggressive Windows Server guesses (user observed approximately Windows Server 2022 97%, Server 2016 91%). These are tool estimates, not proof. The known VM configuration independently identifies DC01 as Windows Server 2022.

### 5. SMB enumeration
TCP/445 was reported open (`microsoft-ds`). NSE returned SMB dialect information including SMB 2.x/3.x. Preserve exact dialect strings and the exact `smb2-security-mode` output: `3.1.1` is an SMB dialect and should not be confused with whether message signing is *enabled* or *required*. An open SMB port is expected on a domain controller and is not by itself a vulnerability.

### 6. Focused follow-up: unexpected high ports
Command:

```bash
sudo nmap -sS -sV -Pn -p 6049,6050,6052,6053 --reason 192.168.10.10
```

Actual supplied output:

```text
Starting Nmap 7.98 ( https://nmap.org ) at 2026-10-25 04:43 -0400
Nmap scan report for 192.168.10.10 (192.168.10.10)
Host is up, received arp-response (0.00053s latency).

PORT     STATE    SERVICE  REASON      VERSION
6049/tcp filtered x11      no-response
6050/tcp filtered arcserve no-response
6052/tcp filtered x11      no-response
6053/tcp filtered x11      no-response
MAC Address: 08:00:27:5B:AD:F4 (Oracle VirtualBox virtual NIC)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 2.32 seconds
```

**Interpretation:** All four ports were **filtered** and yielded `no-response`. No listening application was confirmed. `x11` and `arcserve` are Nmap's port-name associations, not identified running software. ARP confirmed the target host was reachable; the precise reason for missing TCP responses requires additional host-side evidence. Do not report these as open ports or confirmed vulnerabilities.

## Findings register

| ID | Observation | Evidence status | Security interpretation / next action |
|---|---|---|---|
| L02-01 | DC01 responds to host discovery | Reported by operator | Discovery alone does not establish exposed ports |
| L02-02 | TCP/445 SMB open | Reported by operator | Expected on DC; review exact signing and dialect output in Lab 04/05 |
| L02-03 | RDP-associated port filtered | Reported by operator | Firewall filtering likely; verify Windows configuration before concluding |
| L02-04 | UDP DNS/NTP-related responses | Reported by operator | Preserve exact ports and states from scan files |
| L02-05 | OS guesses not definitive | Reported by operator | Cross-check against known inventory |
| L02-06 | 6049, 6050, 6052, 6053 filtered | Exact scan output supplied | No confirmed services on these four ports |

## Lessons learned
- `-sn` discovers hosts but does not enumerate ports.
- A live host can have filtered ports; `filtered` is not `open`.
- Nmap's SERVICE column can be a conventional port label rather than a verified service.
- Fingerprinting and OS guesses have uncertainty.
- Save raw outputs and separate observed facts from interpretations.

## Evidence to retain
Save original `.nmap`, `.xml`, `.gnmap` files where available, screenshots of host discovery, TCP/UDP comparisons, OS fingerprinting, SMB scripts, and the high-port follow-up. Do not fabricate absent output. Keep the completed notes and cheat sheet alongside them.

## Conclusion
Lab 02 completed practical host discovery, TCP/UDP enumeration, version/OS fingerprinting, and focused SMB/DNS checks. The follow-up established that ports 6049, 6050, 6052, and 6053 were filtered at scan time, not confirmed open. Next: **Lab 03 — Service Enumeration & Attack Surface Mapping**.
