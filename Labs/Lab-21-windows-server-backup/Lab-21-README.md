# Lab 21 --- Windows Server Backup

## Objective

Learn Windows Server Backup (WSB), VSS, backup destinations, custom
backups, and basic backup troubleshooting on Windows Server 2022.

## Lab Environment

-   Server: Windows Server 2022
-   Server name: DC01 / WindowsServer
-   Domain: SufyanLab.local
-   Backup destination: Dedicated virtual disk, `ServerBackup (E:)`
-   Data: `C:\CompanyData`

## Tasks Completed

### 1. Installed Windows Server Backup

Installed the Windows Server Backup feature through Server Manager and
opened it from Server Manager → Tools → Windows Server Backup.

### 2. Created a Dedicated Backup Disk

Added a separate virtual disk to the server VM and configured it as an
NTFS volume named `ServerBackup (E:)`.

### 3. Configured a Custom Backup

Used **Backup Once → Different options → Custom** and selected: - Local
drive as the destination type - `ServerBackup (E:)` as the destination -
`C:\CompanyData` as the protected data

### 4. Configured Shadow Copies / VSS

Configured Shadow Copies for the required volumes. VSS provides the
point-in-time snapshot used by Windows Server Backup.

### 5. Successful Backup

The custom `C:\CompanyData` backup completed successfully.

The Windows Server Backup console showed: - Last Backup Status:
**Successful** - Backup time: **9/9/2026 4:12 PM**

## Troubleshooting Performed

An attempt was made to include **System State** in the backup. It failed
with VSS-related errors including: - `0x80780119` - `0x807800C5` - VSS
Event ID 8193 - Backup Event ID 521 - Event ID 513 involving the System
Writer and Microsoft Link-Layer Discovery Protocol

Diagnostic commands used:

``` text
vssadmin list providers
vssadmin list writers
vssadmin list shadowstorage
vssadmin list shadows
fsutil volume diskfree C:
sc qc cryptsvc
sc query cryptsvc
```

The VSS writers, including the **NTDS Writer**, reported **Stable / No
error**. Cryptographic Services was configured for automatic startup and
was running.

## Key Concepts Learned

-   Windows Server Backup provides backup and recovery capabilities for
    Windows Server.
-   A separate backup disk is preferable to storing backups on the
    source disk.
-   VSS creates a consistent point-in-time snapshot while data is in
    use.
-   System State is especially important on a Domain Controller because
    it contains critical Windows and Active Directory-related state.
-   Backup failures can involve VSS/source-volume requirements even when
    the destination appears to have enough free space.
-   Event Viewer, `vssadmin`, `fsutil`, and service queries are useful
    troubleshooting tools.

## Result

**Lab 21 completed.**

A successful custom backup of `C:\CompanyData` was created on
`ServerBackup (E:)`.

The System State backup issue was documented as a troubleshooting
observation rather than making potentially unsafe changes to
hidden/system volumes.

## Portfolio Notes

This lab demonstrates practical junior system administrator skills
involving: - Windows Server Backup - VSS - Backup destination
management - Data protection - Domain Controller backup concepts - Event
Viewer troubleshooting - Command-line diagnostics - Basic backup failure
analysis
