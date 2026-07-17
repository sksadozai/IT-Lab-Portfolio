# Lab 04 - Active Directory Organizational Design

## Objective

The objective of this lab was to verify the successful deployment of Active Directory Domain Services (AD DS), explore the default Active Directory structure, and design an enterprise-ready Organizational Unit (OU) hierarchy for the fictional company **Apex Solutions**.

---

## Lab Environment

| Component | Value |
|-----------|-------|
| Company | Apex Solutions |
| Domain | sufyanlab.local |
| Domain Controller | DC01 |
| Operating System | Windows Server 2022 |
| Virtualization Platform | Oracle VirtualBox |

---

## Tasks Performed

- Verified that the Active Directory domain was functioning correctly.
- Opened **Active Directory Users and Computers (ADUC)**.
- Explored the default Active Directory containers.
- Verified DNS configuration using **DNS Manager**.
- Confirmed the existence of the **Forward Lookup Zone** (`sufyanlab.local`).
- Designed and implemented an enterprise Organizational Unit (OU) structure.
- Created a scalable hierarchy following enterprise best practices.

---

## Organizational Unit Structure

```text
sufyanlab.local
│
└── Apex Solutions
    │
    ├── Administration
    │   └── IT Administrators
    │
    ├── Users
    │   ├── IT
    │   ├── HR
    │   ├── Finance
    │   ├── Sales
    │   └── Management
    │
    ├── Computers
    │   ├── IT
    │   ├── HR
    │   ├── Finance
    │   ├── Sales
    │   └── Management
    │
    ├── Servers
    │   ├── Domain Controllers
    │   ├── Member Servers
    │   └── Linux Servers
    │
    ├── Security Groups
    │
    └── Service Accounts
```

---

## Why This Design?

Instead of placing all users and computers directly under the domain, the infrastructure was designed using Organizational Units (OUs).

This provides several advantages:

- Better organization
- Easier administration
- Simplified Group Policy management
- Scalability for future growth
- Separation of users, computers, servers, and administrative objects

This structure closely resembles how enterprise environments are typically organized.

---

## Verification

The following items were verified successfully:

- Active Directory Domain Services installed
- Domain Controller operational
- DNS service functioning correctly
- Forward Lookup Zone available
- Organizational Units created successfully

---

## Screenshots

The following screenshots are included in this lab:

1. Active Directory Users and Computers
2. DNS Manager
3. Organizational Unit Structure

---

## Skills Practiced

- Active Directory Administration
- Organizational Unit (OU) Design
- Enterprise Infrastructure Planning
- DNS Verification
- Windows Server Administration
- Microsoft Management Console (MMC)

---

## Key Learning Outcomes

After completing this lab, I learned:

- The purpose of Organizational Units (OUs)
- Why enterprise environments separate users and computers
- How Active Directory organizes network resources
- The relationship between DNS and Active Directory
- Best practices for designing scalable directory structures

---

## Next Lab

Lab 05 - User and Group Management

In the next lab, user accounts, security groups, and administrative accounts will be created for Apex Solutions.
