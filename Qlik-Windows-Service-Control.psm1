function Show-QlikSenseServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
    [string]$ComputerName="localhost"
    )

    Get-Service "Qlik*" -ComputerName $ComputerName| Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } | `
    Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype
}

function Start-QlikSense {

    [CmdletBinding(PositionalBinding=$false)]
    param(   
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get Qlik Sense related Services
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

    # Get all Qlik Sense services
    $QlikSenseServices = Get-Service "Qlik*" -ComputerName $ComputerName | Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } 

    # Stop all found services
    # Only stop QRD if requested
    if( $StopRepositoryDatabase)  { 
        $QlikSenseServices | Stop-Service -Force 
    }else{
        $QlikSenseServices | Where-Object { $_.Name -notlike "QlikSenseRepositoryDatabase" } | Stop-Service -Force 
    }    

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