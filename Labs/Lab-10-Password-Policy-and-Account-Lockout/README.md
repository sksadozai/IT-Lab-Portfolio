# Lab 10 - Active Directory Password Policy & Account Lockout Policy

## Objective

Configure and test Password Policy and Account Lockout Policy in an Active Directory domain to improve authentication security and protect against weak passwords and brute-force attacks.

---

## Lab Environment

- Windows Server 2022 (DC01)
- Windows 11 Client (ClientWin11)
- Active Directory Domain Services
- Group Policy Management
- Active Directory Users and Computers

---

## Tasks Performed

### Part 1 - Password Policy

Configured the Default Domain Policy with the following settings:

- Enforce Password History: 24 Passwords
- Maximum Password Age
- Minimum Password Age
- Minimum Password Length: 12 Characters
- Password Complexity Enabled
- Store Password Using Reversible Encryption: Disabled

Applied the policy using:

```
gpupdate /force
```

---

### Password Policy Testing

Created and tested user accounts.

Verified that:

- Passwords shorter than 12 characters were rejected.
- Passwords not meeting complexity requirements were rejected.
- Strong passwords were accepted successfully.
- Domain password policy was enforced correctly.

---

### Part 2 - Account Lockout Policy

Configured:

- Account Lockout Threshold: 5 Invalid Logon Attempts
- Account Lockout Duration: 10 Minutes
- Reset Account Lockout Counter After: 10 Minutes

Applied the updated Group Policy.

```
gpupdate /force
```

---

### Account Lockout Testing

Used the test account "John".

Performed:

- Entered incorrect password five times.
- Verified account became locked.
- Opened Active Directory Users and Computers.
- Navigated to User Properties → Account.
- Unlocked the account.
- Logged in successfully using the correct password.

---

## Security Concepts Learned

- Password History
- Password Complexity
- Minimum Password Length
- Password Expiration
- Account Lockout Policy
- Brute Force Protection
- Group Policy Enforcement
- Account Recovery

---

## Blue Team Perspective

Implemented authentication controls to reduce the risk of:

- Weak passwords
- Password reuse
- Dictionary attacks
- Brute-force attacks
- Unauthorized account access

---

## Red Team Perspective

Observed that Account Lockout significantly slows password guessing attacks.

Potential attacker alternatives include:

- Password Spraying
- Phishing
- Credential Theft
- Kerberos-based attacks
- Privilege Escalation

---

## Outcome

Successfully implemented and validated enterprise-level authentication security policies in Active Directory by configuring Password Policy and Account Lockout Policy and verifying their behavior using real user accounts.
