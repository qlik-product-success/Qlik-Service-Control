<#
    .SYNOPSIS
    RESTART Qlik Sense Enterprise services on the current server. 
 
    .DESCRIPTION
    All Qlik Sense services are stopped, then started, to accomplish a service restart. 
    Qlik Sense Repository Database (QRD) can be excepted from restart, as it might not 
    be required for example during maintenance.
    Service operation requires PowerShell to run as Administrator, bu the script will 
    automatically elevate the PowerSehll terminal if required. 

    REFERENCES
    Qlik Support Knowledge: 
    https://community.qlik.com/t5/Qlik-Support-Knowledge-Base/Manual-Start-and-Stop-order-of-Qlik-Sense-services/ta-p/1713773

    Run Powershell Scripts with Admin Privileges: 
    https://www.petri.com/run-powershell-scripts-with-administrative-privileges

    .PARAMETER IncludeRepositoryDatabase
    Qlik Sense Reopsitory Database (QRD) is not restarted by default. 
    Set this flag to also restart QRD.      

    .EXAMPLE
    C:\PS> .\Restart-QlikSense.ps1
    Restart all Qlik Sense services, except Qlik Sense Repository Database.

    .EXAMPLE
    C:\PS> .\Restart-QlikSense.ps1 -IncludeRepositoryDatabase
    Restart all Qlik Sense services, including Qlik Sense Repository Database.

    .NOTES
    Copyright (c) 2020. This script is provided "AS IS", without any warranty, under the MIT License.     
#>

param(
    [switch]$Elevated,
    [Parameter(Mandatory=$false)]
    [Switch] $IncludeRepositoryDatabase
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

# Stopp services
if($IncludeRepositoryDatabase) {
    . "$PSScriptRoot\Stop-QlikSense.ps1" -quiet -StopRepositoryDatabase
} else {
    . "$PSScriptRoot\Stop-QlikSense.ps1" -quiet
}

# Restart services
. "$PSScriptRoot\Start-QlikSense.ps1"
