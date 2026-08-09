# Lab 18 — Windows File Server, FSRM, Storage Management & Auditing

## Overview

In this lab, I configured and tested a Windows Server 2022 file server environment using Active Directory security groups, SMB shares, NTFS permissions, File Server Resource Manager (FSRM), storage reports, file screening, quotas, and Windows security auditing.

The main objective was to understand how organizations centrally manage shared files while controlling:

- Who can access files
- What users can do with files
- How much storage can be consumed
- Which types of files can be stored
- How administrators monitor storage
- Who accessed or modified files

---

## Lab Environment

| Component | Configuration |
|---|---|
| Domain | `SufyanLab.local` |
| Domain Controller | `DC01` |
| Client | `CL01` |
| File Server | `DC01` |
| File Server Root | `C:\CompanyData` |
| Network Share | `\\DC01\CompanyData` |
| HR Folder | `C:\CompanyData\HR` |
| Archive Folder | `C:\CompanyData\Archive` |

---

# 1. File Server Structure

The central file server was organized using departmental folders under:


C:\CompanyData

The structure included departmental folders such as:

C:\CompanyData
├── HR
├── Finance
├── IT
├── Management
├── Sales
└── Archive

The folders were shared through SMB so that domain users could access them from client computers.

2. Active Directory Security Groups

Department-based Active Directory security groups were used to control access.

Examples included:

IT_Users
HR_Users
IT_Admins

The security-group approach allows permissions to be assigned to groups instead of configuring individual users one by one.

For example:

Ali Khan
    |
    └── IT_Users
            |
            └── IT Folder Access

The IT administrator group was given broader administrative access to the departmental folders.

3. NTFS Permissions

NTFS permissions were configured on the departmental folders.

The main principle used was:

Department Users → Access their department
IT Administrators → Administrative access to all departments

For example, HR_Users received appropriate access to the HR folder while normal IT users were prevented from accessing HR.

The Administrator account was added to the IT_Admins security group and successfully tested.

4. Permission Testing
IT User Test

Ali Khan, who belongs to the IT_Users group, was tested from CL01.

When Ali attempted to access:

\\DC01\CompanyData\HR

access was denied.

This confirmed that the department-level NTFS permissions were working correctly.

IT Administrator Test

The Administrator account was added to:

IT_Admins

After logging in again so that the new group membership was included in the security token, the administrator was able to access:

HR
IT
Finance
Management
Sales

This confirmed that the administrative permissions were working correctly.

5. File Server Resource Manager (FSRM)

FSRM was installed on DC01 to provide additional file-server management capabilities.

Installation command:

Install-WindowsFeature FS-Resource-Manager -IncludeManagementTools

FSRM was used for:

Storage quotas
File screening
Storage reports
6. FSRM Storage Quota

A 100 MB Hard Quota was created for:

C:\CompanyData\HR

Quota configuration:

Path: C:\CompanyData\HR
Limit: 100 MB
Type: Hard Quota

A hard quota prevents the configured folder from exceeding its defined storage limit.

The quota was verified with PowerShell.

The 100 MB quota was successfully enforced during testing.

An attempt to create a 100 MB file resulted in:

There is not enough space on the disk.

A small test file was successfully created because the folder was still below its quota.

This demonstrated that FSRM was enforcing the storage limit.

7. FSRM File Screening

File screening was configured on:

C:\CompanyData\HR

The built-in Block Executable Files template was used.

The screening type was:

Active Screening

The configured file group was:

Executable Files
Test

A .txt file was copied into the HR folder successfully.

An .exe file was then copied into the same folder.

The executable file was blocked.

This demonstrated that FSRM File Screening can prevent specific file types from being stored even when the user otherwise has permission to write to the folder.

8. Storage Reports

A Storage Reports Task was created for:

C:\CompanyData

The report included:

Files by File Group / Type
Large Files
Least Recently Accessed Files

The report was generated manually.

FSRM generated HTML reports under the Storage Reports directory.

The reports were opened using Microsoft Edge.

Observations

The Files by Type report displayed the files and file classifications available in the lab.

The Large Files report contained no significant large files because the lab environment contained only a small amount of data.

The Least Recently Accessed report had limited information because file access-time tracking was not enabled.

9. File Management Tasks

File Management Tasks were investigated during the lab.

The File Expiration feature was examined.

However, the task was not deployed because the condition section required classification properties that had not yet been configured.

Instead of creating unnecessary classification rules, this feature was left for a future Classification Management lab.

This helped demonstrate the relationship between:

Classification
      ↓
Properties
      ↓
Conditions
      ↓
File Management Tasks
10. Windows File Server Auditing

File-system auditing was configured using Group Policy.

A dedicated GPO was created:

File Server Auditing

The following policy was configured:

Computer Configuration
→ Policies
→ Windows Settings
→ Security Settings
→ Advanced Audit Policy Configuration
→ Audit Policies
→ Object Access
→ Audit File System

Both were enabled:

Success
Failure

The policy was then applied using:

gpupdate /force
11. Verifying the Audit Policy

The audit policy was initially found to be:

File System    No Auditing

After correcting the GPO configuration and applying the policy, the audit configuration was verified using:

auditpol /get /subcategory:"File System"

The result showed:

Success and Failure

This confirmed that Windows was now auditing file-system access.

12. Auditing the HR Folder

Auditing was configured on:

C:\CompanyData\HR

The audit entry was applied to:

This folder, subfolders and files

File-system activities were then generated by creating and modifying a test file.

Example:

C:\CompanyData\HR\Test.txt
13. Event ID 4663

After the auditing policy was correctly applied and the file was accessed, Windows Security logs generated Event ID 4663 events.

Event ID:

4663

The event showed information including:

Object Name
Account Name
Object Type
Accesses
Audit Success

The Object Name pointed to the actual file:

C:\CompanyData\HR\Test.txt

The Accesses section showed operations such as:

Read data
List directory
Write attributes

This successfully demonstrated Windows file-system auditing.

14. Event ID 5140 Observation

During investigation of the Security log, Event ID 5140 was also observed.

Event ID 5140 represents:

A network share object was accessed

One observed event involved:

SYSVOL

This was recognized as normal domain/network-share activity and was not used as the primary file auditing demonstration.

The important file-system auditing event for this lab was:

4663
15. Key Concepts Learned
NTFS Permissions

Control:

Who can access or modify a resource?

SMB Share

Provides network access to shared folders.

Example:

\\DC01\CompanyData
FSRM Quota

Controls:

How much storage can be consumed?

File Screening

Controls:

What types of files can be stored?

Storage Reports

Provide information about:

What is happening with storage?

Auditing

Answers:

Who actually accessed or modified a file, and what did they do?

16. Final Architecture

The final lab demonstrated a simplified real-world file-server model:

                    SufyanLab.local
                          |
                         DC01
                          |
                   File Server
                          |
                    CompanyData
                          |
        ┌─────────┬───────┼───────┬──────────┐
        |         |       |       |          |
       HR      Finance    IT   Management   Sales
        |
        ├── NTFS Permissions
        ├── 100 MB Hard Quota
        ├── Executable File Screening
        └── File System Auditing
17. Final Result

The lab successfully demonstrated centralized Windows file-server management using:

Active Directory security groups
SMB shares
NTFS permissions
FSRM quotas
FSRM file screening
FSRM storage reports
Group Policy auditing
Windows Security Event ID 4663

The environment now provides a practical example of how an organization can control, monitor, and secure shared file storage using Windows Server.
