# Lab 07 - Commands Cheat Sheet

## Force Group Policy Update

```cmd
gpupdate /force
```

Updates both User and Computer Group Policies immediately.

---

## Display Applied Group Policies

```cmd
gpresult /r
```

Shows the Resultant Set of Policy (RSoP).

---

## Generate HTML Group Policy Report

```cmd
gpresult /h C:\gporeport.html
```

Creates a detailed HTML report of applied policies.

---

## Open Generated Report

```cmd
start C:\gporeport.html
```

---

## Display Current User

```cmd
whoami
```

---

## Display Current Domain User

```cmd
whoami /fqdn
```

---

## Display Computer Name

```cmd
hostname
```

---

## Display IP Configuration

```cmd
ipconfig
```

---

## Display Full Network Configuration

```cmd
ipconfig /all
```

---

## Verify Domain Controller Connectivity

```cmd
ping dc01
```

or

```cmd
ping dc01.sufyanlab.local
```

---

## Verify DNS Resolution

```cmd
nslookup dc01
```

---

## Useful GUI Tools

Run Command:

```
gpmc.msc
```

Opens Group Policy Management Console.

---

Run Command:

```
dsa.msc
```

Opens Active Directory Users and Computers.

---

Run Command:

```
dnsmgmt.msc
```

Opens DNS Manager.

---

## Policy Used in This Lab

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── Control Panel
             └── Prohibit access to Control Panel and PC Settings
```

---

## Expected Result

✔ Domain user receives a restriction message when opening Control Panel.

✔ `gpresult /r` shows:

```
Apex Solutions - IT Desktop Restrictions
```
