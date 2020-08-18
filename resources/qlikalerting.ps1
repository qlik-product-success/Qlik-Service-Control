function Show-QlikAlertingServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )

    $ComputerName | ForEach-Object { `
        Get-Service "QlikAlerting*" -ComputerName $_ | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}

function Start-QlikAlerting {

    [CmdletBinding(PositionalBinding=$false)]
    param(   
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get enabled Qlik Alerting services and start 
    $QlikAlteringServices = Get-Service "QlikAlerting*" -ComputerName $ComputerName | `
                            Where-Object { $_.StartType -ne "Disabled" }

    $QlikAlteringServices | Start-Service

    if(-not $Quiet) {
        Show-QlikAlertingServices -ComputerName $ComputerName
    }
}

function Stop-QlikAlerting {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get all Qlik Alerting services
    $QlikAlteringServices = Get-Service "QlikAlerting*" -ComputerName $ComputerName

    # Stop all found services
    $QlikAlteringServices | Stop-Service -Force 

    if(-not $Quiet) {
        Show-QlikAlertingServices -ComputerName $ComputerName
    }
}

function Restart-QlikAlerting {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost"
    )

    Stop-QlikAlerting -ComputerName $ComputerName -Quiet 
    Start-QlikAlerting -ComputerName $ComputerName
}