# Lab 10 - Commands Cheat Sheet

## Update Group Policy

```cmd
gpupdate /force
```

Updates both Computer and User Group Policies immediately.

---

## Display Applied Group Policies

```cmd
gpresult /r
```

Shows Resultant Set of Policy (RSoP).

---

## Display Detailed Policy Report

```cmd
gpresult /h report.html
```

Creates an HTML report of applied policies.

---

## Force Policy Refresh

```cmd
gpupdate /target:user /force
```

Refreshes only User Policies.

---

```cmd
gpupdate /target:computer /force
```

Refreshes only Computer Policies.

---

## Password Policy Location

```
Group Policy Management
    ↓
Default Domain Policy
    ↓
Edit
    ↓
Computer Configuration
    ↓
Policies
    ↓
Windows Settings
    ↓
Security Settings
    ↓
Account Policies
    ↓
Password Policy
```

---

## Account Lockout Policy Location

```
Group Policy Management
    ↓
Default Domain Policy
    ↓
Edit
    ↓
Computer Configuration
    ↓
Policies
    ↓
Windows Settings
    ↓
Security Settings
    ↓
Account Policies
    ↓
Account Lockout Policy
```

---

## Unlock Locked User

```
Active Directory Users and Computers
    ↓
Users OU
    ↓
Select User
    ↓
Properties
    ↓
Account Tab
    ↓
Unlock Account
```

---

## Verify Password Policy

- Create a new user.
- Assign a weak password.
- Verify Windows rejects it.
- Assign a strong password.
- Verify Windows accepts it.

---

## Verify Account Lockout

- Enter incorrect password five times.
- Verify account locks.
- Unlock account from Active Directory.
- Log in successfully.

---

## Lab Summary

✔ Password History Configured

✔ Password Complexity Enabled

✔ Minimum Password Length Configured

✔ Password Expiration Configured

✔ Account Lockout Configured

✔ Group Policy Tested

✔ Password Policy Verified

✔ Account Lockout Verified

✔ User Successfully Unlocked
