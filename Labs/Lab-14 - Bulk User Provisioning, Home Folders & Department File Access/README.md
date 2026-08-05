# Lab 14 - Bulk User Provisioning, Home Folders & Department File Access

## Objective

Automate Active Directory user provisioning using PowerShell and CSV while implementing secure home folders, department-based shared folders, and access control through Security Groups.

---

## Lab Components

- Bulk user creation using CSV
- Automatic OU placement
- Department assignment
- Job title assignment
- Automatic password configuration
- Force password change at first logon
- Home folder creation
- H: drive mapping
- Security Group membership automation
- Department shared folders
- NTFS Permissions
- Share Permissions
- Home folder security
- User access verification

---

## Folder Structure

```
C:\Scripts\
│
├── CreateUsers.ps1
├── AddUsersToGroups.ps1
├── Employees.csv
```

```
C:\HomeFolders\
│
├── APX1001
├── APX1002
├── ...
```

---

## Organizational Units

```
Apex Solutions
│
├── Users
│   ├── IT
│   ├── HR
│   ├── Finance
│   ├── Sales
│   └── Management
│
├── Security Groups
├── Computers
├── Servers
├── Service Accounts
└── Administration
```

---

## PowerShell Automation

### CreateUsers.ps1

Automatically performs:

- Creates users from CSV
- Places users inside correct OU
- Sets Department
- Sets Job Title
- Creates Home Folder
- Maps H: Drive
- Forces password change at first logon

---

### AddUsersToGroups.ps1

Automatically:

- Reads Department
- Adds users into corresponding Security Groups

---

## Home Folder Configuration

Root Folder

```
C:\HomeFolders
```

Mapped as

```
\\DC01\Users$
```

Each user receives

```
H:
```

Example

```
\\DC01\Users$\APX1001
```

---

## Security Configuration

### NTFS

Parent folder configured once.

Each user inherits the correct permissions.

Users can:

- Access their own Home Folder

Users cannot:

- Access another user's Home Folder

---

### Department Shares

Each department has its own shared folder.

Example

```
IT
HR
Finance
Sales
Management
```

Access is controlled entirely through Security Groups.

---

## Validation Performed

✔ Bulk users created successfully

✔ Users placed into correct OUs

✔ Security Groups assigned automatically

✔ Home folders created automatically

✔ H: Drive mapped automatically

✔ Password change required at first logon

✔ Users can access their own Home Folder

✔ Users cannot access another user's Home Folder

✔ Department members can access their own shared folder

✔ Users cannot access other department shares

---

## Technologies Used

- Windows Server 2022
- Active Directory Domain Services
- DNS
- PowerShell
- CSV
- NTFS Permissions
- SMB Shares
- Security Groups
- VirtualBox

---

## Skills Practiced

- Active Directory Administration
- PowerShell Automation
- Bulk User Provisioning
- File Server Administration
- NTFS Permission Management
- SMB Share Management
- Security Group Administration
- Home Folder Configuration
- Access Control Verification

---

## Result

Successfully automated enterprise-style Active Directory user provisioning with secure home folders, department-based access control, and PowerShell automation.
