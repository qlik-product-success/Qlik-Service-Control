function Show-QlikNPrintingServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )

    $ComputerName | ForEach-Object { `
        Get-Service "*nprinting*" -ComputerName $_ | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}

function Start-QlikNPrinting {

    [CmdletBinding(PositionalBinding=$false)]
    param(   
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get enabeld Qlik NPRinting related Services and start in required order
    # Including Repo service, which must be started first if enabled
    # https://support.qlik.com/articles/000058729

    $NPrintingServices = Get-Service "*nprinting*" -ComputerName $ComputerName | Where-Object { $_.StartType -ne "Disabled" }

    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingRepoService")}      | Start-Service  
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingMessagingService")} | Start-Service  
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingWebEngine")}        | Start-Service  
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingScheduler")}        | Start-Service  
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingEngine")}           | Start-Service  
    $NPrintingServices | Start-Service 

    if(-not $Quiet) {
        Show-QlikNPrintingServices -ComputerName $ComputerName
    }
}


function Stop-QlikNPrinting {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get all Qlik Nprinting services, except Repo service
    # Database assumed to always remain running
    $NPrintingServices = Get-Service "*nprinting*" -ComputerName $ComputerName | `
                         Where-Object { $_.Name -notlike "QlikNPrintingRepoService" } 

    # Stop services in proper order
    # https://support.qlik.com/articles/000058729
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingEngine")}           | Stop-Service -Force 
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingScheduler")}        | Stop-Service -Force 
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingWebEngine")}        | Stop-Service -Force 
    $NPrintingServices | Where-Object {($_.Name -eq "QlikNPrintingMessagingService")} | Stop-Service -Force 
    $NPrintingServices | Stop-Service -Force 

    if(-not $Quiet) {
        Show-QlikNPrintingServices -ComputerName $ComputerName
    }
}

function Restart-QlikNPrinting {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost"
    )

    Stop-QlikNPrinting -ComputerName $ComputerName -Quiet 
    Start-QlikNPrinting -ComputerName $ComputerName
}