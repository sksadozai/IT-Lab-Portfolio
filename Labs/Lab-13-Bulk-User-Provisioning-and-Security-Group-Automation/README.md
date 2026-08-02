# Lab 13 - Bulk User Provisioning and Security Group Automation

## Objective

Automate Active Directory user provisioning using PowerShell and CSV files. Instead of creating users manually through the Active Directory Users and Computers console, this lab demonstrates how administrators can create multiple users, assign organizational units, populate user attributes, enforce password policies, and automatically add users to security groups.

---

## Lab Tasks

### Part 1 - Bulk User Creation

- Created a structured Employees.csv file.
- Imported CSV data using PowerShell.
- Created Active Directory users automatically.
- Assigned users to their respective Organizational Units (OUs).
- Populated user attributes:
  - Employee ID
  - First Name
  - Last Name
  - Department
  - Job Title
- Used Employee ID as the logon username (SamAccountName).
- Forced users to change their password at first logon.
- Added PowerShell Try/Catch error handling for reliable execution.

---

### Part 2 - Automatic Security Group Assignment

- Created a PowerShell script to assign users to Security Groups based on their Department.
- Implemented Switch statements for department-based logic.
- Added Try/Catch error handling for group assignments.
- Verified successful group memberships using PowerShell.

---

## Technologies Used

- Windows Server 2022
- Active Directory Domain Services (AD DS)
- PowerShell
- Active Directory PowerShell Module
- CSV Import
- VirtualBox

---

## PowerShell Concepts Learned

- Import-Csv
- Foreach Loop
- Variables
- Switch Statements
- New-ADUser
- Add-ADGroupMember
- Try/Catch Error Handling
- ConvertTo-SecureString
- Get-ADUser
- Get-ADGroupMember

---

## Skills Gained

- Enterprise User Provisioning
- Active Directory Automation
- Bulk User Management
- Security Group Automation
- CSV Data Processing
- PowerShell Scripting
- Troubleshooting Script Errors
- Error Handling using Try/Catch

---

## Outcome

Successfully automated the creation of multiple Active Directory users from a CSV file and assigned them to the appropriate Organizational Units and Security Groups using PowerShell. Improved script reliability through structured error handling and verified all created objects using Active Directory PowerShell cmdlets.
