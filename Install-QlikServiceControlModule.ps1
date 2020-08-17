#Requires -RunAsAdministrator


[CmdletBinding(PositionalBinding=$false)]
param(        
    [Parameter(Mandatory=$false)]
    [string]$ModulePath = "$Env:Programfiles\WindowsPowerShell\Modules\"
)

$ErrorActionPreference = 'Stop'

$repo_path = "https://github.com/qlikcustomersuccess/Qlik-Service-Control"


try{ 
    $CurrentPath = Get-Location
    Test-Path -Path "$ModulePath"
} catch {
    Throw "ERROR: ModulePath is invalid; $ModulePath"    
}

try{ 
    if(Get-Command git) {

        if(Test-Path -Path "$ModulePath\Qlik-Service-Control") {
            Write-Host "Updating existing installation..." -ForegroundColor Green
            Set-Location "$ModulePath\Qlik-Service-Control"
            git pull
        } else {
            Write-Host "Installing Qlik Service Control module..." -ForegroundColor Green
            Set-Location "$ModulePath"
            git clone $repo_path
        }    
        
    }
} catch {
    Set-Location $CurrentPath
    Throw "ERROR: Install/Update failed! Git is missing or repository path is inaccessible $repo_path"    
}
Set-Location $CurrentPath