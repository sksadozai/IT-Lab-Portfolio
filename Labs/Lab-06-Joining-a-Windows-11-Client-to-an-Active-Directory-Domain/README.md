# Lab 06 - Join Windows 11 Client to Active Directory Domain

## Objective
Connect a Windows 11 client computer to the Active Directory domain and verify that it is successfully managed by the Domain Controller.

---

## Lab Environment

| Component | Value |
|-----------|-------|
| Domain Controller | DC01 |
| Domain | SufyanLab.local |
| Company OU | Apex Solutions |
| Client Computer | CL01 |
| Operating System | Windows 11 Pro |

---

## Tasks Performed

### Step 1
Configured the Windows 11 client with the correct network settings.

- Static IP Address
- Subnet Mask
- Preferred DNS Server pointing to the Domain Controller

---

### Step 2
Verified communication with the Domain Controller.

Commands used:

```cmd
ping 192.168.10.10
ipconfig /all
```

---

### Step 3
Opened:

Settings → System → About → Rename this PC (Advanced)

Selected:

**Domain**

Entered:

```
SufyanLab.local
```

---

### Step 4
Authenticated using the Domain Administrator credentials.

Example:

```
SUFYANLAB\Administrator
```

After successful authentication, Windows requested a restart.

---

### Step 5
Restarted the client machine.

Logged in using the Domain Administrator account.

---

### Step 6
Verified from the Domain Controller.

Opened:

```
Active Directory Users and Computers
```

Navigated to:

```
Computers
```

Confirmed that:

```
CL01
```

appeared successfully inside Active Directory.

---

## Result

✔ Windows 11 successfully joined the Active Directory Domain.

✔ The client is now centrally managed by the Domain Controller.

✔ Authentication can now be performed using domain accounts.

---

## Skills Learned

- Domain Join Process
- Client Authentication
- Active Directory Computer Objects
- DNS Dependency during Domain Join
- Domain Administration Basics

---

## Commands Used

```cmd
ipconfig /all

ping 192.168.10.10
```

---

## Screenshots

- Client Network Configuration
- Domain Join Window
- Successful Restart
- Active Directory showing CL01
- Successful Domain Login

---

## Key Concepts Learned

- Difference between Local Account and Domain Account
- Why DNS is required before joining a domain
- How Active Directory automatically creates a Computer Object
- Centralized authentication using Active Directory
- Domain trust relationship between client and Domain Controller

---

## Lab Status

Completed Successfully ✅
