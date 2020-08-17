#Requires -RunAsAdministrator

[CmdletBinding(PositionalBinding=$false)]
param(        
    [Parameter(Mandatory=$false)]
    [string]$ModulePath = "$Env:Programfiles\WindowsPowerShell\Modules\"
)

$ErrorActionPreference = 'Stop'

$repo_path = "https://github.com/qlikcustomersuccess/Qlik-Service-Control"

try{ 
    Test-Path -Path "$ModulePath"
} catch {
    Throw "ERROR: ModulePath is invalid; $ModulePath"    
}

try{ 
    
    Invoke-WebRequest -URI "https://github.com/qlikcustomersuccess/Qlik-Service-Control/archive/master.zip" `
                    -OutFile "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip"

    Unblock-File -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip"

    Expand-Archive -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip" `
                -DestinationPath "$env:HOMEDRIVE$env:HOMEPATH\Downloads\"

    New-Item -Path "$ModulePath\Qlik-Service-Control" -ItemType Directory

    Copy-Item -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control-master\" `
            -Destination "$ModulePath\Qlik-Service-Control"  `
            -Recurse
} catch {
    Throw "ERROR: Install/Update failed! Git is missing or repository path is inaccessible $repo_path"    
}

Import-Module "$ModulePath\Qlik-Service-Control\Qlik-Service-Control.psd1"

Get-ChildItem "$ModulePath\Qlik-Service-Control"