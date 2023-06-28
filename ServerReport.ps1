# Retrieve System Name
$Name = $Env:COMPUTERNAME

# Operating System name
$Version = (Get-ComputerInfo | Select-Object OsVersion).osversion

# Logical Disk Count
$DiskCount = (Get-Ciminstance CIM_LogicalDisk).count

# write some bad examples of output
Write-Host "Server Name: $Name"

#good example of output
Write-output "Computer name: $Name"
Write-Output "Computer Version: $Version"

# make our own custom object
$obj = [PSCustomObject]@{
   ComputerName = "$Name"
   OSVersion = "$Version"
   DiscCount = "$DiskCount"
}

#writing the output of the custom object 
Write-output $obj