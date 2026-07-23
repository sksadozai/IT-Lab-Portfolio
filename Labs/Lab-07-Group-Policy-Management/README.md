# Lab 07 - Group Policy Management (GPO)

## Objective

Create and apply a Group Policy Object (GPO) to restrict IT department users from accessing the Control Panel and Windows Settings.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows 11 Client (CL01)
- Active Directory Domain Services
- Group Policy Management Console (GPMC)

Domain:
```
sufyanlab.local
```

Organization:
```
Apex Solutions
```

Target OU:
```
Users
└── IT
```

---

## Tasks Performed

- Opened Group Policy Management.
- Navigated to the IT Organizational Unit (OU).
- Created a new GPO named:

```
Apex Solutions - IT Desktop Restrictions
```

- Linked the GPO to the IT OU.
- Edited the GPO.
- Enabled the following policy:

```
User Configuration
 └── Policies
     └── Administrative Templates
         └── Control Panel
             └── Prohibit access to Control Panel and PC Settings
```

- Logged into Windows 11 as domain user **Ali Khan**.
- Verified that Control Panel access was blocked.
- Verified policy application using `gpresult`.

---

## Verification

Successful verification included:

- User authenticated through Active Directory.
- Control Panel restriction message displayed.
- `gpresult /r` confirmed the applied GPO.

Applied Group Policy:

```
Apex Solutions - IT Desktop Restrictions
```

---

## Skills Learned

- Group Policy Management
- Creating and Linking GPOs
- User Configuration Policies
- Organizational Units (OU)
- Policy Verification
- Domain User Management
- Windows Administration

---

## Screenshots

- Group Policy Created
- Policy Configuration
- Restriction Message
- GPResult Output

---

## Result

Successfully deployed and verified a Group Policy Object that prevents IT department users from accessing Control Panel and Windows Settings.
