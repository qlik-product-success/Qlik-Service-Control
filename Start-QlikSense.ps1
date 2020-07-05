<#
    .SYNOPSIS
    START Qlik Sense Enterprise services on the current server. 
 
    .DESCRIPTION
    All enabled Qlik Sense services are started. 
    Service operation requires PowerShell to run as Administrator, bu the script will automatically elevate the PowerSehll terminal if required. 

    REFERENCES
    Qlik Support Knowledge: 
    https://community.qlik.com/t5/Qlik-Support-Knowledge-Base/Manual-Start-and-Stop-order-of-Qlik-Sense-services/ta-p/1713773

    Run Powershell Scripts with Admin Privileges: 
    https://www.petri.com/run-powershell-scripts-with-administrative-privileges

    .EXAMPLE
    C:\PS> .\Start-QlikSense.ps1
    Stops all Qlik Sense services, besides Qlik Sense Repository Database.

    .NOTES
    Copyright (c) 2020. This script is provided "AS IS", without any warranty, under the MIT License.     
#>

param(
        [switch]$Elevated
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

# Get Qlik Sense related Services
$QlikSenseServices = Get-Service "Qlik*" | Where-Object { ($_.Name -like "QlikSense*" -or $_.Name -eq "QlikLoggingService") } 
$EnabledServices   = $QlikSenseServices | Where-Object { $_.StartType -ne "Disabled" }

Write-Host "Starting Qlik Sense services..." -ForegroundColor Green

$EnabledServices | Where-Object {($_.Name -eq "QlikSenseRepositoryDatabase")} | Start-Service
$EnabledServices | Where-Object {($_.Name -eq "QlikLoggingService")}          | Start-Service
$EnabledServices | Where-Object {($_.Name -eq "QlikSenseServiceDispatcher")}  | Start-Service
$EnabledServices | Where-Object {($_.Name -eq "QlikSenseRepositoryService")}  | Start-Service
$EnabledServices | Start-Service

# Display Qlik Sense Services Status
$QlikSenseServices | Select-Object Status, DisplayName, StartType