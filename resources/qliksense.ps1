function Show-QlikSenseServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )

    $ComputerName | ForEach-Object { `
        Get-Service "Qlik*" -ComputerName $_ | Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}

function Start-QlikSense {

    [CmdletBinding(PositionalBinding=$false)]
    param(   
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get enabeld Qlik Sense related Services and start in required order
    # Including Repository Database, which must be started first if enabled
    $QlikSenseServices = Get-Service "Qlik*" -ComputerName $ComputerName | Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } 
    $EnabledServices   = $QlikSenseServices | Where-Object { $_.StartType -ne "Disabled" }

    $EnabledServices | Where-Object {($_.Name -eq "QlikSenseRepositoryDatabase")} | Start-Service
    $EnabledServices | Where-Object {($_.Name -eq "QlikLoggingService")}          | Start-Service
    $EnabledServices | Where-Object {($_.Name -eq "QlikSenseServiceDispatcher")}  | Start-Service
    $EnabledServices | Where-Object {($_.Name -eq "QlikSenseRepositoryService")}  | Start-Service
    $EnabledServices | Start-Service

    if(-not $Quiet) {
        Show-QlikSenseServices -ComputerName $ComputerName
    }
}


function Stop-QlikSense {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get all Qlik Sense services, except Qlik Sense Repository database 
    # Databse assuem to always remain running
    $QlikSenseServices = Get-Service "Qlik*" -ComputerName $ComputerName | `
                         Where-Object { (       $_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") `
                                          -and ($_.Name -notlike "QlikSenseRepositoryDatabase") } 

    # Stop all found services
    $QlikSenseServices | Stop-Service -Force 

    # TBA: Check that services are stopped
    #      Kill processes if still running
    #      Re-iterate stop service. 

    if(-not $Quiet) {
        Show-QlikSenseServices -ComputerName $ComputerName
    }
}

function Restart-QlikSense {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost"
    )

    Stop-QlikSense -ComputerName $ComputerName -Quiet 
    Start-QlikSense -ComputerName $ComputerName
}