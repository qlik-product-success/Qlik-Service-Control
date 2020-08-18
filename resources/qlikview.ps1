function Show-QlikViewServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )

    $ComputerName | ForEach-Object { `
        Get-Service "qlikview*" -ComputerName $_ | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}

function Start-QlikView {

    [CmdletBinding(PositionalBinding=$false)]
    param(   
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get enabeld QlikView services and start in required order
    # Including Repo service, which must be started first if enabled
    # https://support.qlik.com/articles/000007438

    $QlikViewServices = Get-Service "qlikview*" -ComputerName $ComputerName | Where-Object { $_.StartType -ne "Disabled" }

    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewDirectory")}        | Start-Service  
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewServiceDispather")} | Start-Service  
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewDistribution")}     | Start-Service  
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewManagement")}       | Start-Service  
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewServer")}           | Start-Service  
    $QlikViewServices | Start-Service 

    if(-not $Quiet) {
        Show-QlikView -ComputerName $ComputerName
    }
}


function Stop-QlikView {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost",
        [Parameter(Mandatory=$false)]
        [Switch] $Quiet=$false
    )

    # Get all QlikViewServices services
    $QlikViewServices = Get-Service "qlikview*" -ComputerName $ComputerName

    # Stop services in proper order
    # https://support.qlik.com/articles/000007438
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewServer")}           | Stop-Service -Force 
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewManagement*")}      | Stop-Service -Force 
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewDistribution*")}    | Stop-Service -Force 
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewDirectory*")}       | Stop-Service -Force 
    $QlikViewServices | Where-Object {($_.Name -eq "QlikViewServiceDispather")} | Stop-Service -Force 
    $QlikViewServices | Stop-Service -Force 

    if(-not $Quiet) {
        Show-QlikView -ComputerName $ComputerName
    }
}

function Restart-QlikView {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [Parameter(Mandatory=$false)]
        [string]$ComputerName="localhost"
    )

    Stop-QlikView -ComputerName $ComputerName -Quiet 
    Start-QlikView -ComputerName $ComputerName
}