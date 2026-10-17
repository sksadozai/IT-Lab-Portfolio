# Apex Solutions — Commands Cheat Sheet

> Companion to `README.md` for the **single integrated multi-site Packet Tracer lab**. Commands are organized by function, not by separate labs. Check actual interface names and existing configuration before pasting. `!` in IOS examples is a comment/separator, not an error.

## 1. Final addressing reference

| Device/interface | Address | Function |
|---|---|---|
| Router0 `Gi0/0.10` | `192.168.10.1/24` | Servers |
| Router0 `Gi0/0.20` | `192.168.20.1/24` | HQ employees |
| Router0 `Gi0/0.30` | `192.168.30.1/24` | IT |
| Router0 `Gi0/0.50` | `192.168.50.1/24` | Guests |
| Router0 `Gi0/1` | `10.0.0.1/24` (observed) | Branch |
| Router1 HQ-facing interface | `10.0.0.2` | HQ transit |
| Router1 `Gi0/0.40` | `192.168.40.1/24` | Branch users |
| Router0 `Gi0/2` | `203.0.13.5/30` | ISP |
| ISP `Gi0/0` | `203.0.13.6/30` | HQ |
| ISP `Gi0/1` | `203.0.13.2/30` | Internet server |
| Internet Server `GigabitEthernet0` | `203.0.13.1/30` | HTTP, gateway `.2` |
| Internal Server | `192.168.10.10/24` | DHCP/DNS/internal HTTP |

## 2. Cisco CLI basics and inspection

```cisco
 enable
 configure terminal
 hostname Router0
 end
 copy running-config startup-config

 show running-config
 show startup-config
 show ip interface brief
 show interfaces
 show interfaces gigabitEthernet 0/2
 show ip route
 show arp
 show cdp neighbors
 ping 203.0.13.6
```

`up/up` means an interface and its line protocol are operational, but it does not prove the remote host or correct VLAN is reachable. `administratively down` usually needs `no shutdown`. At `--More--`, press Space for the next page or Enter for the next line.

## 3. VLANs and switch ports

Example on HQ Switch0; use the **actual** switch ports from the final `.pkt` file.

```cisco
 enable
 configure terminal
 vlan 10
  name SERVERS
 vlan 20
  name HQ_USERS
 vlan 30
  name IT_ADMIN
 vlan 50
  name GUEST_WIFI
 exit

 interface FastEthernet0/11
  description HQ-GUEST-AP
  switchport mode access
  switchport access vlan 50
  spanning-tree portfast
  no shutdown
 exit

 ! Router-facing trunk; verify physical port first
 interface GigabitEthernet0/1
  switchport mode trunk
  switchport trunk allowed vlan add 50
 exit
 end

 show vlan brief
 show interfaces trunk
 show mac address-table
```

For an employee AP use an access port in VLAN 20; for the branch employee AP use VLAN 40 on Switch1. `switchport trunk allowed vlan add 50` preserves existing allowed VLANs. Do not accidentally replace the entire trunk allowed list. Some Packet Tracer switches do not require/support `switchport trunk encapsulation dot1q`.

## 4. Router-on-a-stick (HQ Router0)

```cisco
 enable
 configure terminal
 interface GigabitEthernet0/0
  no ip address
  no shutdown
 exit
 interface GigabitEthernet0/0.10
  encapsulation dot1Q 10
  ip address 192.168.10.1 255.255.255.0
  ip nat inside
 exit
 interface GigabitEthernet0/0.20
  encapsulation dot1Q 20
  ip address 192.168.20.1 255.255.255.0
  ip helper-address 192.168.10.10
  ip nat inside
 exit
 interface GigabitEthernet0/0.30
  encapsulation dot1Q 30
  ip address 192.168.30.1 255.255.255.0
  ip helper-address 192.168.10.10
  ip nat inside
 exit
 interface GigabitEthernet0/0.50
  encapsulation dot1Q 50
  ip address 192.168.50.1 255.255.255.0
  ip nat inside
 exit
 end
 show ip interface brief
 show ip route
```

`Gi0/0.50` intentionally has **no** `ip helper-address`: Router0 serves guest DHCP locally. Retain the ACL attachments shown in Section 8. These examples describe the final intended configuration; avoid resetting already-working interfaces unnecessarily.

## 5. Branch VLAN 40 and DHCP relay

```cisco
 ! Branch Router1 (verify its actual switch-facing physical port)
 enable
 configure terminal
 interface GigabitEthernet0/0
  no ip address
  no shutdown
 exit
 interface GigabitEthernet0/0.40
  encapsulation dot1Q 40
  ip address 192.168.40.1 255.255.255.0
  ip helper-address 192.168.10.10
 exit
 end

 ! Branch Switch1 (use actual router-facing trunk port)
 configure terminal
 vlan 40
  name BRANCH_USERS
 exit
 interface GigabitEthernet0/1
  switchport mode trunk
 exit
 show vlan brief
 show interfaces trunk
```

The centralized Packet Tracer server at `192.168.10.10` requires separate DHCP pools for the HQ and branch VLAN subnets, with each pool's correct default gateway, mask and DNS address. The relay forwards DHCP broadcasts across routed boundaries.

## 6. Static routes and simulated Internet

```cisco
 ! HQ Router0
 configure terminal
 ip route 192.168.40.0 255.255.255.0 10.0.0.2
 ip route 0.0.0.0 0.0.0.0 203.0.13.6
 exit

 ! Branch Router1 — route unknown destinations toward HQ
 configure terminal
 ip route 192.168.10.0 255.255.255.0 10.0.0.1
 ip route 192.168.20.0 255.255.255.0 10.0.0.1
 ip route 192.168.30.0 255.255.255.0 10.0.0.1
 ip route 0.0.0.0 0.0.0.0 10.0.0.1
 exit

 show ip route
 ping 10.0.0.2
 ping 203.0.13.6
 ping 203.0.13.1
```

HQ `Gi0/1` is `10.0.0.1` and ISP-facing `Gi0/2` is `203.0.13.5/30`. ISP `Gi0/0` is `203.0.13.6/30`; ISP `Gi0/1` is `203.0.13.2/30`. The Internet Server is `203.0.13.1/30`, gateway `203.0.13.2`. Do not configure the ISP to know all private LAN routes just to make client tests pass: PAT is the exercise.

## 7. NAT overload / PAT on Router0

```cisco
 enable
 configure terminal
 ip access-list standard APEX-NAT
  permit 192.168.10.0 0.0.0.255
  permit 192.168.20.0 0.0.0.255
  permit 192.168.30.0 0.0.0.255
  permit 192.168.40.0 0.0.0.255
  permit 192.168.50.0 0.0.0.255
 exit
 interface GigabitEthernet0/0.10
  ip nat inside
 exit
 interface GigabitEthernet0/0.20
  ip nat inside
 exit
 interface GigabitEthernet0/0.30
  ip nat inside
 exit
 interface GigabitEthernet0/0.50
  ip nat inside
 exit
 interface GigabitEthernet0/1
  ip nat inside
 exit
 interface GigabitEthernet0/2
  ip nat outside
 exit
 ip nat inside source list APEX-NAT interface GigabitEthernet0/2 overload
 end

 show ip nat translations
 show ip nat statistics
 show access-lists APEX-NAT
```

Add the PAT statement only once. Test using an **endpoint** (PC/laptop) reaching `203.0.13.1`, ideally HTTP; router-originated pings are not the same as a client flow through NAT.

## 8. Department ACLs — preserve rule order

**HQ Router0:** `USERS-IN`, applied inbound on `Gi0/0.20`:

```cisco
 ip access-list extended USERS-IN
  10 permit icmp 192.168.20.0 0.0.0.255 192.168.30.0 0.0.0.255 echo-reply
  20 deny ip 192.168.20.0 0.0.0.255 192.168.30.0 0.0.0.255
  30 permit ip any any
 exit
 interface GigabitEthernet0/0.20
  ip access-group USERS-IN in
 exit
```

**Branch Router1:** `BRANCH-IN`, applied inbound on `Gi0/0.40`:

```cisco
 ip access-list extended BRANCH-IN
  10 permit icmp 192.168.40.0 0.0.0.255 192.168.30.0 0.0.0.255 echo-reply
  20 deny ip 192.168.40.0 0.0.0.255 192.168.30.0 0.0.0.255
  30 permit ip any any
 exit
 interface GigabitEthernet0/0.40
  ip access-group BRANCH-IN in
 exit
```

Inspect existing entries before pasting sequence-numbered rules; a preceding broad permit may defeat a later deny. These ACLs are stateless; `echo-reply` permits allow responses to IT-initiated ICMP pings, not all types of return traffic. For broader production policies use stateful inspection/firewalling.

## 9. Guest VLAN 50 DHCP and isolation

**Router0 local guest DHCP:**

```cisco
 configure terminal
 service dhcp
 ip dhcp excluded-address 192.168.50.1 192.168.50.20
 ip dhcp pool APEX-GUEST
  network 192.168.50.0 255.255.255.0
  default-router 192.168.50.1
  dns-server 203.0.13.1
 exit
 end
 show ip dhcp pool
 show ip dhcp binding
```

The DNS address is meaningful only if the simulated external server has DNS service configured. IP-based HTTP testing works without DNS. Guest AP is on Switch0 **Fa0/11**, an access port in VLAN 50. Guest laptop receives `192.168.50.x` from Router0. Do not duplicate the gateway `.1` on an endpoint.

**Router0 `GUEST-IN`:**

```cisco
 configure terminal
 ip access-list extended GUEST-IN
  permit udp any eq bootpc any eq bootps
  deny ip 192.168.50.0 0.0.0.255 192.168.10.0 0.0.0.255
  deny ip 192.168.50.0 0.0.0.255 192.168.20.0 0.0.0.255
  deny ip 192.168.50.0 0.0.0.255 192.168.30.0 0.0.0.255
  deny ip 192.168.50.0 0.0.0.255 192.168.40.0 0.0.0.255
  deny ip 192.168.50.0 0.0.0.255 10.0.0.0 0.0.0.255
  deny ip 192.168.50.0 0.0.0.255 203.0.13.4 0.0.0.3
  permit ip 192.168.50.0 0.0.0.255 host 203.0.13.1
  deny ip 192.168.50.0 0.0.0.255 any
 exit
 interface GigabitEthernet0/0.50
  ip access-group GUEST-IN in
 exit
 end

 show access-lists GUEST-IN
 show ip interface GigabitEthernet0/0.50
```

This restricts **routed guest traffic**. It does not by itself isolate guest wireless clients from each other or provide a full stateful firewall. The guest ACL can be temporarily detached for controlled diagnosis, but reattach and retest before closing the lab:

```cisco
 interface GigabitEthernet0/0.50
  no ip access-group GUEST-IN in
 ! ...diagnose...
 interface GigabitEthernet0/0.50
  ip access-group GUEST-IN in
```

## 10. DHCP, DNS and client commands

Packet Tracer Server-PT configuration is primarily through **Services** (DHCP, DNS, HTTP), not Windows Server PowerShell. Internal DNS A record used in the lab:

```text
dc01.apex.local  A  192.168.10.10
```

Client tests:

```text
ipconfig
ipconfig /all
ipconfig /release
ipconfig /renew
ping 192.168.50.1
ping 192.168.10.10
ping 203.0.13.1
nslookup dc01.apex.local
```

Browser tests: `http://192.168.10.10` (internal server, if HTTP enabled) and `http://203.0.13.1` (simulated Internet). The external name `internet.apex.test` works only if a DNS record and reachable DNS service are configured.

## 11. Fast fault isolation

| Symptom | First checks |
|---|---|
| AP associates but no DHCP or gateway ping | Physical switch port, `show vlan brief`, trunk, dot1Q subinterface; test static IP and a wired VLAN 50 PC |
| Guest AP failure encountered in this lab | Cable was on `Fa0/8`; VLAN 50 access configuration was on `Fa0/11` |
| VLAN 20 can reach IT | Check `show ip interface GigabitEthernet0/0.20` for inbound `USERS-IN`, then `show access-lists USERS-IN` |
| IT ping cannot get replies | Verify narrow ICMP `echo-reply` permit precedes employee/branch deny |
| Branch has no Internet | Check branch default route, HQ branch route, Router0 `Gi0/1 ip nat inside`, NAT ACL VLAN 40 entry |
| HQ can ping ISP but clients cannot reach external server | Check client gateway, ACL, NAT inside/outside, `show ip nat translations` and HTTP service |
| Ping fails for assumed `.101` | Inspect the target PC's actual DHCP lease before changing network configuration |
| Switch MAC table appears sparse | Generate traffic, then `show mac address-table`; verify the switch and uplink being inspected |

## 12. Final validation and save

```cisco
show ip interface brief
show ip route
show vlan brief
show interfaces trunk
show access-lists
show ip nat translations
show ip nat statistics
show ip dhcp binding
copy running-config startup-config
```

Test HQ users → DC01/Internet allowed, HQ users → IT denied; branch → DC01/Internet allowed, branch → IT denied; IT-initiated pings allowed; guest → Internet allowed, guest → internal VLANs denied. Save all routers and switches, then save the final `.pkt` project. Never assume a successful ping to a gateway proves every security rule is correct.
