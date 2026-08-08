# Lab 17 – DHCP Server Administration
## Commands Cheat Sheet

### 1. View DHCP Scopes

```powershell
Get-DhcpServerv4Scope

View a specific scope:

Get-DhcpServerv4Scope -ScopeId 192.168.10.0

View scope statistics:

Get-DhcpServerv4ScopeStatistics -ScopeId 192.168.10.0
2. DHCP Reservations

View reservations:

Get-DhcpServerv4Reservation -ScopeId 192.168.10.0

Example reservation created for CL01:

CL01
IP Address: 192.168.10.50
3. DHCP Exclusion Range

View exclusions:

Get-DhcpServerv4ExclusionRange -ScopeId 192.168.10.0

Lab exclusion:

192.168.10.180 – 192.168.10.190
4. DHCP Leases

View active leases:

Get-DhcpServerv4Lease -ScopeId 192.168.10.0

Change lease duration:

Set-DhcpServerv4Scope `
-ScopeId 192.168.10.0 `
-LeaseDuration 01:00:00
5. DHCP DNS Settings

View DNS update configuration:

Get-DhcpServerv4DnsSetting

Configure DHCP to always perform DNS dynamic updates:

Set-DhcpServerv4DnsSetting `
-ComputerName DC01 `
-DynamicUpdates Always

Verify:

Get-DhcpServerv4DnsSetting
6. DHCP Policies

View policies inside the DHCP scope:

Get-DhcpServerv4Policy -ScopeId 192.168.10.0

View server-level policies:

Get-DhcpServerv4Policy -ComputerName DC01

Our policy:

Name:            CL01-Special-Policy
Scope:           192.168.10.0
Enabled:         True
Condition:       MAC Address
MAC:             08-00-27-CD-8B-7A
Processing Order: 1

Remove a policy if required:

Remove-DhcpServerv4Policy `
-ComputerName DC01 `
-Name "CL01-Special-Policy"
7. Client DHCP Commands

Run on CL01:

View complete network configuration:

ipconfig /all

Release DHCP lease:

ipconfig /release

Request a new DHCP lease:

ipconfig /renew

Register the client with DNS:

ipconfig /registerdns

Test DNS resolution:

nslookup CL01
Important Concepts
DHCP Scope

Defines the network and range of addresses DHCP can manage.

Reservation

Assigns a specific IP address to a specific device.

Exclusion

Prevents DHCP from dynamically assigning a specific range of addresses.

Lease

Defines how long a DHCP client can use an assigned IP address.

DHCP Policy

Allows different DHCP configurations to be applied to clients matching specific conditions.

DHCP + DNS

DHCP provides network configuration while DNS provides name resolution.
