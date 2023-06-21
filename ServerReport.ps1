# Retrieve System Name
$Name = $Env:COMPUTERNAME

# Operating System name
$Version = (Get-ComputerInfo | Select-Object OsVersion).osversion

