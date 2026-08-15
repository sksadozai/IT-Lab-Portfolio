# Lab 20 — Print Server & Network Printer Management

## Objective
Set up and manage a Windows Server print server, create a shared network printer, connect a Windows 11 domain client, test print jobs, understand printer permissions, and use Group Policy deployment.

## Lab Environment
- Domain: SufyanLab.local
- Print Server/DC: DC01
- Client: ClientWin11
- Printer: SufyanLab-Printer
- Role: Print and Document Services

## Tasks Completed
1. Installed **Print and Document Services** on DC01.
2. Opened **Print Management** and verified Drivers, Forms, Ports, and Printers.
3. Created **SufyanLab-Printer** using the Network Printer Installation Wizard.
4. Configured it as a shared network printer.
5. Verified the shared printer path:
   `\\DC01\SufyanLab-Printer`
6. Connected ClientWin11 to the shared printer.
7. Submitted test print jobs from Administrator and Ali Khan.
8. Inspected the print queue and job status.
9. Reviewed printer security permissions.
10. Tested the difference between **Print** and **Manage documents** permissions.
11. Used **Deploy with Group Policy** to configure printer deployment.

## Permissions Learned
- **Print** — allows a user to submit print jobs.
- **Manage documents** — allows a user to manage jobs in the print queue.
- **Manage this printer** — allows administrative management of printer configuration.

Practical result: Ali could submit his own print job but could not delete Administrator's job with the current permissions.

## Job Relevance
Print-server skills are useful in IT support and system administration for:
- Adding network printers
- Connecting users to shared printers
- Troubleshooting printer visibility and connectivity
- Clearing stuck print jobs
- Checking Print Spooler
- Managing printer permissions
- Deploying printers through Group Policy
- Troubleshooting drivers and ports

## Key Takeaway
**A print server provides centralized printer management.** Instead of configuring every workstation independently, administrators manage shared printers centrally and control access through permissions and Group Policy.

## Lab Status
**Completed — Lab 20: Print Server & Network Printer Management**
