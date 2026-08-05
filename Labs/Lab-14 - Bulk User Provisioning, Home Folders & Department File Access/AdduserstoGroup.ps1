Import-Module ActiveDirectory

$Users = Import-Csv "C:\Scripts\Employees.csv"

foreach ($User in $Users)
{
    try
    {
        switch ($User.Department)
        {
            "IT" {
                Add-ADGroupMember -Identity "IT_Users" -Members $User.EmployeeID -ErrorAction Stop
            }

            "Finance" {
                Add-ADGroupMember -Identity "Finance_Users" -Members $User.EmployeeID -ErrorAction Stop
            }

            "HR" {
                Add-ADGroupMember -Identity "HR_Users" -Members $User.EmployeeID -ErrorAction Stop
            }

            "Sales" {
                Add-ADGroupMember -Identity "Sales_Users" -Members $User.EmployeeID -ErrorAction Stop
            }

            "Management" {
                Add-ADGroupMember -Identity "Management_Users" -Members $User.EmployeeID -ErrorAction Stop
            }

            Default {
                throw "Unknown Department: $($User.Department)"
            }
        }

        Write-Host "SUCCESS: $($User.EmployeeID) added to $($User.Department) Users" -ForegroundColor Green
    }
    catch
    {
        Write-Host "FAILED: $($User.EmployeeID) - $($_.Exception.Message)" -ForegroundColor Red
    }
}
