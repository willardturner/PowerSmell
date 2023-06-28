# Retrieve System Name
$Name = $Env:COMPUTERNAME

# Operating System name
$Version = (Get-ComputerInfo | Select-Object OsVersion).osversion

# Logical Disk Count
$DiskCount = (Get-Ciminstance CIM_LogicalDisk).count

