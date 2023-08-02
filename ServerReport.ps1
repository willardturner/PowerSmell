function Get-PowerSmell {
    [CmdletBinding()]
    param (
        [ValidateSet("C","D","E","F","G","H")]
        [string]$DriveLetter = 'C'
    )
    # Retrieve System Name
    $Name = $Env:COMPUTERNAME

    # Operating System name
    $Version = (Get-ComputerInfo | Select-Object OsVersion).osversion

    # Logical Disk Count
    $DiskInstance = Get-Ciminstance CIM_LogicalDisk
    $DiskCount = $DiskInstance.Count

    # Finding the Freespace of the drive(s)
    $Freespace = ($DiskInstance | Where-Object { $_.DeviceID -eq ($DriveLetter + ":") }).freespace

    # Homework - Adding installed programs to the server repot list
    $Printers = (get-printer).Name

    # Homework - Adding System Type to Servcer Reprot 
    $systype = (Get-Computerinfo | Select-Object CsSystemType).CsSystemType

    # write some bad examples of output
    Write-Host "Server Name: $Name"

    #good example of output
    Write-output "Computer name: $Name"
    Write-Output "Computer Version: $Version"

    # make our own custom object
    $obj = [PSCustomObject]@{
        ComputerName         = $Name
        OSVersion            = $Version
        DiscCount            = $DiskCount
        'GB Free'            = [System.Math]::Round($FreeSpace / 1Gb, 2)
        'Installed Printers' = $Printers
        OStype               = $systype
    }

    #writing the output of the custom object 
    Write-output $obj
}
