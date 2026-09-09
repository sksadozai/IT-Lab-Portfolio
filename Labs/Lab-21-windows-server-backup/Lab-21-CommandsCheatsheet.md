# Lab 21 --- Windows Server Backup Commands Cheat Sheet

## Windows Server Backup

Open:

``` text
Server Manager → Tools → Windows Server Backup
```

One-time backup:

``` text
Backup Once → Different options
```

Scheduled backup:

``` text
Backup Schedule
```

## VSS Commands

List VSS providers:

``` cmd
vssadmin list providers
```

Check VSS writers:

``` cmd
vssadmin list writers
```

Healthy writers normally show:

``` text
State: [1] Stable
Last error: No error
```

Check shadow-storage allocation:

``` cmd
vssadmin list shadowstorage
```

List existing shadow copies:

``` cmd
vssadmin list shadows
```

## Disk / Storage

Open Disk Management:

``` text
diskmgmt.msc
```

Check free space:

``` cmd
fsutil volume diskfree C:
```

## Cryptographic Services

Check configuration:

``` cmd
sc qc cryptsvc
```

Check status:

``` cmd
sc query cryptsvc
```

Running state:

``` text
STATE : 4 RUNNING
```

## Windows Server Backup CLI

List available backup versions:

``` cmd
wbadmin get versions
```

Get current backup status:

``` cmd
wbadmin get status
```

List backup disks:

``` cmd
wbadmin get disks
```

Start a System State backup:

``` cmd
wbadmin start systemstatebackup -backuptarget:E:
```

Use the System State command only when the destination has sufficient
space.

## Troubleshooting Workflow

1.  Check the WSB error code.
2.  Check Event Viewer.
3.  Run:

``` cmd
vssadmin list providers
vssadmin list writers
vssadmin list shadowstorage
vssadmin list shadows
```

4.  Check source-volume free space:

``` cmd
fsutil volume diskfree C:
```

5.  Check relevant services.
6.  Avoid changing registry permissions, VSS limits, or hidden
    partitions until the actual cause is established.

## Key Terms

  -----------------------------------------------------------------------
  Term                                Meaning
  ----------------------------------- -----------------------------------
  WSB                                 Windows Server Backup

  VSS                                 Volume Shadow Copy Service

  System State                        Critical Windows
                                      configuration/service state;
                                      especially important for Domain
                                      Controllers

  Backup destination                  Location where backup data is
                                      stored

  Shadow Copy                         Point-in-time snapshot created by
                                      VSS

  NTDS Writer                         VSS writer associated with Active
                                      Directory Domain Services

  System Writer                       VSS writer responsible for
                                      system-related files
  -----------------------------------------------------------------------

## Lab Result

**Successful:** Custom backup of `C:\CompanyData` to
`ServerBackup (E:)`.

**Troubleshooting:** System State backup generated VSS/space-related
errors and was documented for future investigation.
