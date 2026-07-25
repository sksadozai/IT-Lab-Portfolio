# Lab 09 Commands Cheat Sheet

## Refresh Group Policy

gpupdate /force

---

## View Applied Policies

gpresult /r

---

## Check Current User

whoami

---

## View User Groups

whoami /groups

---

## View Network Drive Mappings

net use

---

## Disconnect Network Drive

net use H: /delete

---

## Manually Map Drive

net use H: \\DC01\Users$\ali.khan

---

## Open Shared Folder

\\DC01\Users$

---

## Open Department Share

\\DC01\IT$

---

## User Profile Path

Active Directory Users and Computers

User

Properties

Profile

Home Folder

Connect:

H:

To:

\\DC01\Users$\username

---

## Important Concepts

Home Folder
- Personal storage
- Only owner can access

Department Share
- Team collaboration
- Everyone in same department can access

NTFS
- Real security

Share Permission
- Network entry permission

Effective Permission

Final Access =
Most Restrictive Combination of
Share Permission +
NTFS Permission
