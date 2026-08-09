# Lab 18 — Windows File Server Commands Cheat Sheet

This cheat sheet contains the PowerShell and command-line commands actually used during the lab.

---

## 1. Check FSRM Installation

Check whether File Server Resource Manager is installed:

powershell
Get-WindowsFeature FS-Resource-Manager

Possible states include:

Available
Installed
2. Install FSRM

Install File Server Resource Manager with management tools:

Install-WindowsFeature FS-Resource-Manager -IncludeManagementTools
3. Check FSRM Quota

View the quota configured for the HR folder:

Get-FsrmQuota -Path "C:\CompanyData\HR"
4. Display Detailed Quota Information

Display detailed information about the HR quota:

Get-FsrmQuota -Path "C:\CompanyData\HR" | Format-List *

A more focused version:

Get-FsrmQuota -Path "C:\CompanyData\HR" | Format-List Path,Size,Usage,SoftLimit,Description

Important properties:

Path
Size
Usage
SoftLimit
Description
5. Create a Test File with fsutil

Create a file with a specified size:

fsutil file createnew "C:\CompanyData\HR\TestFile.bin" 1048576

The value is specified in bytes.

For example:

1048576 bytes ≈ 1 MB

A larger test used during the quota demonstration:

fsutil file createnew "C:\CompanyData\HR\TestFile.bin" 104857600
104857600 bytes ≈ 100 MB

The 100 MB attempt was blocked by the 100 MB hard quota.

6. Delete a Test File

Remove the quota test file:

Remove-Item "C:\CompanyData\HR\TestFile.bin"
7. Create the Archive Directory

Create the archive directory used during the File Management Task exercise:

New-Item -Path "C:\CompanyData\Archive" -ItemType Directory -Force
8. Verify CompanyData Contents

Display the folders and files under CompanyData:

Get-ChildItem "C:\CompanyData"
9. Check Current User Group Membership

Display the groups in the current user's security token:

whoami /groups

This was useful for verifying whether the current logon session contained:

SUFYANLAB\IT_Admins
10. Check NTFS Permissions

Display the NTFS permissions of the HR folder:

icacls "C:\CompanyData\HR"

The output was used to verify permissions such as:

SUFYANLAB\IT_Admins
SUFYANLAB\HR_Users
11. Apply Group Policy

Force the latest Group Policy settings:

gpupdate /force

This was used after configuring the file-system auditing policy.

12. Check Windows File-System Auditing

Check the current File System audit policy:

auditpol /get /subcategory:"File System"

Before the GPO was correctly applied, the result was:

No Auditing

After correcting the GPO and running gpupdate /force, the result showed:

Success and Failure
13. Verify Folder Auditing Configuration

Display the auditing rules configured on the HR folder:

Get-Acl "C:\CompanyData\HR" | Select-Object -ExpandProperty Audit

This can be used to inspect the audit rules configured on the folder.

GUI Tools Used

The following tools were also used extensively during the lab.

Server Manager

Used for:

Installing FSRM
Accessing server management tools
File Server Resource Manager

Used for:

Quotas
File Screening
Storage Reports
File Management Tasks
Group Policy Management

Used to configure:

Audit File System

with:

Success
Failure
Event Viewer

Used to inspect:

Windows Logs
→ Security


