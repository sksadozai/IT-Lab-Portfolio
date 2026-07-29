# Lab 12 - Active Directory CSV Automation

## Objective

Learn how to automate Active Directory user creation using PowerShell and a CSV file instead of manually creating every user through Active Directory Users and Computers (ADUC).

---

## Lab Environment

- Windows Server 2022 (DC01)
- Active Directory Domain Services
- PowerShell
- CSV File (Users.csv)
- Apex Solutions Domain

---

## Skills Learned

- Import CSV into PowerShell
- Read CSV records
- Use variables
- Create AD users automatically
- Specify Organizational Units (OU)
- Create secure passwords using ConvertTo-SecureString
- Verify created users
- Understand duplicate object errors

---

## Tasks Completed

### 1. Created Users.csv

Created a CSV containing:

- First Name
- Last Name
- Department
- Username
- Password

---

### 2. Imported CSV

Imported user information using:

Import-Csv C:\Scripts\Users.csv

---

### 3. Created PowerShell Script

Developed CreateUsers.ps1 to:

- Read every record
- Create Active Directory users
- Place users into the correct OU
- Assign usernames
- Assign passwords
- Enable accounts

---

### 4. Verified Users

Verified successful creation using:

Get-ADUser

and

Active Directory Users and Computers

---

### 5. Duplicate User Test

Attempted to create another "Ali Khan".

PowerShell returned:

"An attempt was made to add an object to the directory with a name that is already in use."

This demonstrated that Active Directory prevents duplicate Common Names (CN) within the same Organizational Unit.

---

## Blue Team Perspective

Automation provides:

- Consistent account creation
- Reduced human error
- Faster deployment
- Standardized naming

Current weaknesses:

- Passwords stored in plain text
- No logging
- No error handling
- No duplicate checking
- No automatic group assignment

---

## Red Team Perspective

An attacker gaining access to Users.csv could obtain:

- Usernames
- Departments
- Initial passwords

This demonstrates why production environments avoid storing passwords inside CSV files.

---

## Key Concepts Learned

- Import-Csv
- foreach loop
- Variables
- New-ADUser
- ConvertTo-SecureString
- OU Path
- Distinguished Name (DN)
- Common Name (CN)
- SamAccountName
- UserPrincipalName (UPN)

---

## Lab Outcome

Successfully automated Active Directory user creation using PowerShell and CSV while understanding enterprise naming conventions and duplicate object behavior.
