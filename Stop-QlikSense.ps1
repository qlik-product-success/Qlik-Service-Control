<#
    .SYNOPSIS
    STOP Qlik Sense Enterprise services on the current server. 
 
    .DESCRIPTION
    All Qlik Sense services are stopped, except Qlik Sense Repository Database (QRD) 
    as it might not be required for maintenace. A flag allows to also stop QRD.
    Service operation requires PowerShell to run as Administrator, but the script will 
    automatically elevate the PowerSehll terminal if required. 

    REFERENCES
    Qlik Support Knowledge: 
    https://community.qlik.com/t5/Qlik-Support-Knowledge-Base/Manual-Start-and-Stop-order-of-Qlik-Sense-services/ta-p/1713773

    Run Powershell Scripts with Admin Privileges: 
    https://www.petri.com/run-powershell-scripts-with-administrative-privileges

    .PARAMETER StopRepositryDatabase
    Qlik Sense Reopsitory Database (QRD) is not stopped by default. 
    Set this flag to also stop QRD.      

    .PARAMETER Quiet
    By default service status is printed in temrinal after finished script execution.
    Set this flag to not print service status. 

    .EXAMPLE
    C:\PS> .\Stop-QlikSense.ps1
    Stops all Qlik Sense services, besides Qlik Sense Repository Database.

    .EXAMPLE
    C:\PS> .\Stop-QlikSense.ps1 -Quiet
    Stops all Qlik Sense services, besides Qlik Sense Repository Database. 
    Service status is not printed at the end. 

    .EXAMPLE
    C:\PS> .\Stop-QlikSense.ps1 -StopRepositoryDatabase
    Stops all Qlik Sense services, including Qlik Sense Repository Database.

    .NOTES
    Copyright (c) 2020. This script is provided "AS IS", without any warranty, under the MIT License.     
#>

param(
    [switch]$Elevated,
    [Parameter(Mandatory=$false)]
    [Switch] $StopRepositoryDatabase,
    [Parameter(Mandatory=$false)]
    [Switch] $Quiet
)

function Confirm-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Elevate PowerShell to Run As Administrator
# Throw exception if elevation fails
# otherwise call same command in elevated terminal
if ((Confirm-Admin) -eq $false) {
    if ($elevated) {
        throw "ERROR: PowerShell could not be elevated to Run As Administrator. Try again from elevated PowerShell terminal."
    }
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    Exit
}

# Set script locaiton in elevated prompt
Set-Location $PSScriptRoot

# Get all Qlik Sense services
$QlikSenseServices = Get-Service "Qlik*" | Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } 

Write-Host "Stopping Qlik Sense services..." -ForegroundColor Green 

# Stop all found services
# Only stop QRD if requested
if( $StopRepositoryDatabase)  { 
    $QlikSenseServices | Stop-Service -Force 
}else{
    $QlikSenseServices | Where-Object { $_.Name -notlike "QlikSenseRepositoryDatabase" } | Stop-Service -Force 
}    

# Display Qlik Sense Services Status
if(-not $Quiet) { $QlikServices | Select-Object Status, DisplayName, StartType }