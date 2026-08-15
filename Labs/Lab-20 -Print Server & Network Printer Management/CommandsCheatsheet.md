# Lab 20 — Print Server Commands Cheat Sheet

## Printer Information

### List printers
```powershell
Get-Printer
```

### Detailed printer information
```powershell
Get-Printer -Name "SufyanLab-Printer" | Format-List *
```

### List printer ports
```powershell
Get-PrinterPort
```

### List installed printer drivers
```powershell
Get-PrinterDriver
```

## Print Jobs

### List jobs
```powershell
Get-PrintJob -PrinterName "SufyanLab-Printer"
```

### Show useful job information
```powershell
Get-PrintJob -PrinterName "SufyanLab-Printer" |
Format-Table Id,UserName,DocumentName,JobStatus
```

### Pause a job
```powershell
Suspend-PrintJob -PrinterName "SufyanLab-Printer" -ID <JobID>
```

### Resume a job
```powershell
Resume-PrintJob -PrinterName "SufyanLab-Printer" -ID <JobID>
```

### Delete/cancel a job
```powershell
Remove-PrintJob -PrinterName "SufyanLab-Printer" -ID <JobID>
```

Example:
```powershell
Remove-PrintJob -PrinterName "SufyanLab-Printer" -ID 19
```

> `Set-PrintJob` is not a valid Windows PrintManagement cmdlet.

## Print Spooler

### Check status
```powershell
Get-Service Spooler
```

### Restart
```powershell
Restart-Service Spooler
```

### Start
```powershell
Start-Service Spooler
```

### Stop
```powershell
Stop-Service Spooler
```

## Network Testing

### Test DC01 connectivity
```powershell
Test-Connection DC01
```

### Shared printer path
```text
\\DC01\SufyanLab-Printer
```

## Group Policy

### Force update
```cmd
gpupdate /force
```

### Show applied policies
```cmd
gpresult /r
```

### User policies only
```cmd
gpresult /scope:user /r
```

### Computer policies only
```cmd
gpresult /scope:computer /r
```

### Generate HTML report
```cmd
gpresult /h C:\gpresult.html
```

## Important Concepts

**Print:** submit print jobs.

**Manage documents:** manage jobs in the print queue, subject to effective permissions.

**Manage this printer:** administer printer configuration.

**Print Spooler:** Windows service responsible for processing print jobs.

**UNC printer path:**
```text
\\DC01\SufyanLab-Printer
```

## Basic Troubleshooting Workflow
1. Check printer visibility.
2. Check the shared printer path.
3. Check Print Spooler.
4. Check the print queue.
5. Identify stuck/error jobs.
6. Cancel or resume jobs when permitted.
7. Check printer permissions.
8. Check driver and port configuration.
9. Run `gpupdate /force` for GPO deployment.
10. Run `gpresult /r` to verify applied policies.
