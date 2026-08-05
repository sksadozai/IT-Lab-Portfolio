Import-Module ActiveDirectory

$Users = Import-Csv "C:\Scripts\Employees.csv"
$HomeRoot = "C:\HomeFolders"
$HomeShare = "\\DC01\Users$"

foreach ($User in $Users)
{
    $OU = "OU=$($User.Department),OU=Users,OU=Apex Solutions,DC=sufyanlab,DC=local"

    $Password = ConvertTo-SecureString $User.Password -AsPlainText -Force

    try
    {
        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName) ($($User.EmployeeID))" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -DisplayName "$($User.FirstName) $($User.LastName)" `
            -SamAccountName $User.EmployeeID `
            -UserPrincipalName "$($User.EmployeeID)@sufyanlab.local" `
            -Department $User.Department `
            -Title $User.JobTitle `
            -Path $OU `
            -AccountPassword $Password `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
	    -PasswordNeverExpires $false `
            -ErrorAction Stop
# Create Home Folder
$UserFolder = Join-Path $HomeRoot $User.EmployeeID

if (!(Test-Path $UserFolder))
{
    New-Item -ItemType Directory -Path $UserFolder | Out-Null
}

# Grant the user Full Control over his own home folder
$Acl = Get-Acl $UserFolder

$Rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "SUFYANLAB\$($User.EmployeeID)",
    "FullControl",
    "ContainerInherit,ObjectInherit",
    "None",
    "Allow"
)

$Acl.AddAccessRule($Rule)
Set-Acl -Path $UserFolder -AclObject $Acl
# Configure Home Folder in Active Directory
Set-ADUser `
    -Identity $User.EmployeeID `
    -HomeDrive "H:" `
    -HomeDirectory "$HomeShare\$($User.EmployeeID)"

        Write-Host "SUCCESS: Created $($User.EmployeeID) - $($User.FirstName) $($User.LastName)" -ForegroundColor Green
    }
    catch
    {
        Write-Host "FAILED: $($User.EmployeeID) - $($_.Exception.Message)" -ForegroundColor Red
    }
}
