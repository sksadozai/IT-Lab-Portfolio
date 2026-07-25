## Lab 09 – Home Folder Creation and Drive Mapping

## Objective

Configure personal home folders for domain users and automatically map them as a network drive during logon.

---

## Environment

- Windows Server 2022 (DC01)
- Windows 11 Client
- Active Directory Domain Services
- Domain: SufyanLab.local

---

## Tasks Performed

### 1. Created Home Folder Share

Created a new folder:

C:\HomeFolders

Shared as:

\\DC01\Users$

(Hidden Share)

---

### 2. Configured Share Permissions

Authenticated Users
- Full Control

Administrators
- Full Control

Reason:
Share permissions are kept open because NTFS permissions will provide the real security.

---

### 3. Configured NTFS Permissions

Disabled permission inheritance.

Removed inherited Users permissions.

Configured:

- SYSTEM
- Administrators
- CREATOR OWNER

These permissions allow Windows to automatically secure each user's personal folder.

---

### 4. Created User Home Folder

Created folder:

C:\HomeFolders\ali.khan

Configured user profile:

Active Directory Users and Computers

Ali Khan

Properties

Profile

Connect:

H:

To:

\\DC01\Users$\ali.khan

Repeated for other users.

---

### 5. User Login Test

Logged into Windows 11.

Executed:

gpupdate /force

Logged out.

Logged back in.

Verified:

This PC

H: Drive

ali.khan (\\DC01\Users$)

---

### 6. Tested Access

Ali Khan:
- Can access own Home Folder
- Cannot access another user's Home Folder

Verified NTFS security.

---

### 7. Department Shared Folder Test

IT Department users:

Shared Folder:

\\DC01\IT$

Ali Khan created files.

Logged in as another IT user.

Verified files are visible.

This confirms collaboration works through departmental shared folders.

---

## Skills Learned

- Hidden Shares ($)
- Home Folder Mapping
- Drive Letter Mapping
- NTFS Permissions
- Share Permissions
- Permission Inheritance
- CREATOR OWNER
- Active Directory User Profile
- Personal Storage vs Shared Storage

---

## Commands Used

gpupdate /force

whoami

whoami /groups

gpresult /r

net use

---

## Result

Successfully configured secure personal Home Folders using NTFS permissions while maintaining departmental collaboration using Shared Folders.
