# Lab 17 – DHCP Server Administration

## Overview

In Lab 17, DHCP Server was configured and administered on Windows Server 2022 in the SufyanLab.local Active Directory environment.

The purpose of this lab was to understand how DHCP automatically provides network configuration to clients and how an administrator can centrally control IP addressing, reservations, exclusions, leases, DNS registration, and DHCP policies.

---

## Lab Environment

| Component | Configuration |
|---|---|
| Domain | SufyanLab.local |
| Domain Controller | DC01 |
| DHCP Server | DC01 |
| DNS Server | DC01 |
| Client | CL01 |
| Network | 192.168.10.0/24 |
| DC01 IP | 192.168.10.10 |
| Default Gateway | 192.168.10.1 |
| CL01 Reserved IP | 192.168.10.50 |

---

## 1. DHCP Server Configuration

The DHCP Server role was configured on DC01.

A DHCP scope was created for the:

```text
192.168.10.0/24

The DHCP address pool was configured as:

192.168.10.50 – 192.168.10.200

The DHCP scope provides clients with their network configuration automatically.

2. DHCP Scope Options

The following DHCP options were configured:

Default Gateway
192.168.10.1
DNS Server
192.168.10.10
DNS Domain
sufyanlab.local

These options allow DHCP clients to automatically receive the correct gateway and DNS configuration.

3. DHCP Reservation

A DHCP reservation was created for CL01.

The purpose of the reservation was to ensure that CL01 receives the same IP address whenever it requests a DHCP lease.

Client: CL01
Reserved IP: 192.168.10.50

The reservation was successfully tested from CL01 by releasing and renewing the DHCP lease.

The client continued to receive:

192.168.10.50

This demonstrated that DHCP reservations provide consistent addressing for specific devices.

4. DHCP Exclusion Range

An exclusion range was created:

192.168.10.180 – 192.168.10.190

The purpose of the exclusion is to prevent DHCP from dynamically assigning these addresses.

These addresses can therefore be kept available for manually configured infrastructure such as servers, printers, or other network devices.

The exclusion was verified using PowerShell.

5. DHCP Lease Duration

The default lease duration was examined.

For testing purposes, the lease duration was temporarily changed to:

01:00:00

The client lease was then renewed to demonstrate how DHCP leases are refreshed.

This demonstrated the difference between:

DHCP address assignment
Lease duration
Lease renewal
Reservation

A reservation keeps a device associated with a particular IP, while the lease still has a lifetime and can be renewed.

6. DHCP and DNS Integration

The DHCP DNS dynamic update configuration was examined.

Initially, the DHCP server was configured with:

DynamicUpdates: OnClientRequest

This means DNS updates can occur when requested by the DHCP client.

The configuration was then changed to:

DynamicUpdates: Always

using PowerShell.

The setting was verified afterward.

The relationship between DHCP and DNS was also tested using:

nslookup CL01

CL01 was successfully resolved to its IP address.

An important concept learned here was that an existing DNS record can already resolve successfully even before changing the DHCP dynamic-update mode. nslookup confirms that a DNS record exists, but by itself does not prove which service originally created the record.

7. DHCP Policies

A DHCP Policy was created to demonstrate conditional DHCP configuration.

The policy was named:

CL01-Special-Policy

The condition used was:

MAC Address

with the CL01 MAC address:

08-00-27-CD-8B-7A

The policy was designed to demonstrate the concept:

When a particular type of client requests DHCP, specific DHCP configuration can be applied to that client.

DHCP policies can use conditions such as MAC address, vendor class, client identifier, and other supported DHCP conditions.

8. DHCP Policy Troubleshooting

During policy configuration, the policy was initially created at the wrong level.

The policy existed, but PowerShell showed:

ScopeId: 0.0.0.0

This indicated that the policy had been created at the DHCP server level instead of inside the intended DHCP scope.

The incorrect policy was removed.

The policy was then recreated under:

DHCP
└── IPv4
    └── 192.168.10.0
        └── Policies

The final verification showed:

Name:             CL01-Special-Policy
Enabled:          True
ScopeId:          192.168.10.0
ProcessingOrder:  1
Condition:        OR
MAC Address:      08-00-27-CD-8B-7A

This confirmed that the policy was successfully configured at the correct scope level.

9. Important Understanding of DHCP Policies

A DHCP policy does not directly function as a firewall or website-blocking mechanism.

Its purpose is to allow DHCP to apply different network configurations to clients based on defined conditions.

For example:

Client matches policy
        ↓
DHCP recognizes the client
        ↓
Specific DHCP configuration is applied

This can be useful when different groups of devices require different network configurations.

Security enforcement such as website blocking or network access restrictions would normally be handled by technologies such as:

Firewalls
DNS filtering
Proxies
VLANs
Group Policy
Endpoint security

DHCP can therefore be one component of a larger enterprise network design.

10. Client Verification

The following commands were used on CL01:

ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /registerdns
nslookup CL01

These commands were used to verify:

DHCP configuration
IP address assignment
DHCP server
DNS server
Gateway
Lease renewal
DNS registration
Name resolution
11. PowerShell Verification

PowerShell was used throughout the lab to verify the configuration.

Important commands included:

Get-DhcpServerv4Scope
Get-DhcpServerv4ScopeStatistics -ScopeId 192.168.10.0
Get-DhcpServerv4Reservation -ScopeId 192.168.10.0
Get-DhcpServerv4ExclusionRange -ScopeId 192.168.10.0
Get-DhcpServerv4Lease -ScopeId 192.168.10.0
Get-DhcpServerv4DnsSetting
Get-DhcpServerv4Policy -ScopeId 192.168.10.0
Key Concepts Learned
DHCP

DHCP automatically provides network configuration to clients instead of requiring administrators to manually configure every computer.

DHCP Scope

Defines the network and IP address range managed by DHCP.

Reservation

Assigns a specific IP address to a particular device.

Exclusion

Prevents DHCP from dynamically assigning a particular IP range.

Lease

Defines the period for which a DHCP client can use an assigned address before renewal is required.

DHCP Policy

Allows different DHCP configurations to be applied to clients that match specific conditions.

DHCP and DNS

DHCP provides network configuration while DNS provides name resolution.

Lab Outcome

Lab 17 successfully demonstrated centralized DHCP administration in a Windows Server environment.

The lab covered:

DHCP scope creation
DHCP options
Reservations
Exclusions
Lease duration
DHCP/DNS integration
Dynamic DNS updates
DHCP policies
Scope-level policy configuration
PowerShell-based verification
Client-side DHCP testing
Troubleshooting a scope-level policy configuration error

The lab demonstrated how DHCP, DNS, and Active Directory can work together as core services in a Windows-based organizational network.
