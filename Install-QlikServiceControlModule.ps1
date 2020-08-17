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
        
    # } else {

    #     $DownloadsPath = "$env:HOMEDRIVE$env:HOMEPATH\Downloads"
    
    #     Write-Host "Downloading files from GitHub to $downloads_folder..." -ForegroundColor Green      

    #     try {            
    #         Invoke-WebRequest -uri "https://github.com/qlikcustomersuccess/Qlik-Service-Control/archive/master.zip" -OutFile "$DownloadsPath\Qlik-Service-Control.zip"
    #         Write-Host "$ModulePath"
    #         if(Test-Path -Path "$ModulePath\Qlik-Service-Control") {
    #             Remove-Item "$ModulePath\Qlik-Service-Control" -Recurse -Force
    #         }                
    #         Move-Item -Path "$DownloadsPath\Qlik-Service-Control.zip" -Destination "$ModulePath"
    #         Expand-Archive -Path "$ModulePath\Qlik-Service-Control.zip" -DestinationPath "$ModulePath" -Force
    #         Move-Item -Path "$ModulePath\Qlik-Service-Control-master" -Destination "$ModulePath\Qlik-Service-Control"
    #     }
    #     catch {
    #         Write-Host "Download failed!" -ForegroundColor Red
    #         Exit
    #     }
    
    }
} catch {
    Set-Location $CurrentPath
    Throw "ERROR: Install/Update failed! Git is missing or repository path is inaccessible $repo_path"    
}
Set-Location $CurrentPath

Import-Module "$ModulePath\Qlik-Service-Control\Qlik-Service-Control.psd1"