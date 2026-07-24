# Lab 08 - Department File Shares and NTFS Permissions

## Objective
Learn how to create secure departmental shared folders using Share Permissions and NTFS Permissions in Windows Server Active Directory.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows 11 Client (CL01)
- Active Directory Domain: sufyanlab.local

---

## Tasks Performed

### 1. Created Department Folders

Created the following folders:

C:\Shares\
├── Finance
├── HR
├── IT
└── Sales

---

### 2. Configured Shared Folders

Enabled Advanced Sharing for every department folder.

Share Names:

- Finance$
- HR$
- IT$
- Sales$

Used "$" to create hidden administrative shares.

---

### 3. Configured Share Permissions

Assigned permissions only to the respective department security groups.

Examples:

Finance$ → Finance_Users

HR$ → HR_Users

IT$ → IT_Users

Sales$ → Sales_Users

Permissions granted:

- Read
- Change

---

### 4. Configured NTFS Permissions

Configured NTFS permissions through the Security tab.

Added the matching security group to every department folder.

Permission assigned:

- Modify

Default permissions for SYSTEM and Administrators were preserved.

---

### 5. Tested Access

Logged in as:

Ali Khan

Verified:

✅ Access to:

\\DC01\IT$

❌ Access Denied:

\\DC01\Finance$

This confirms that both Share Permissions and NTFS Permissions are working correctly.

---

## Skills Learned

- Windows File Sharing
- Hidden Shares
- Share Permissions
- NTFS Permissions
- Principle of Least Privilege
- Department-Based Access Control
- Active Directory Security Groups
- Access Verification

---

## Result

Successfully implemented secure departmental file sharing where users can only access their own department resources.
