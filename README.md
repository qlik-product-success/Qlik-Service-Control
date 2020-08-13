# Control Windows srvcies for Qlik products

This PowerShell module simplifies control of Windows services for Qlik Sense Enterprise on Windows. It can start, stop and restart services in the correct order, and allows doing so on both local and remote servers. 

## Install module 

1. Run PowerShell as Administrator <br />
    `Start-Process powershell -Verb runAs`
1. Change location to PowerShell modules <br />
    `Set-Location $Env:ProgramFiles\WindowsPowerShell\Modules`
1. Clone repository <br />
    `git clone https://github.com/qlikcustomersuccess/Qlik-Windows-Service-Control`
1. Import PowerShell module <br />
    `Import-Module .\Qlik-Windows-Service-Control\Qlik-Windows-Service-Control.psd1`

## Update Module

1. Run PowerShell as Administrator <br />
    `Start-Process powershell -Verb runAs`
1. Change location to PowerShell modules <br />
    `Set-Location $Env:ProgramFiles\WindowsPowerShell\Modules\Qlik-Windows-Service-Control`
1. Pull latest version of repository<br />
    `git pull`
1. Remove module from current PowerShell session<br />
    `Remove-Module Qlik-Windows-Service-Control`
1. Import PowerShell module <br />
    `Import-Module .\Qlik-Windows-Service-Control.psd1`

## Qlik Sense Enterprise on Windows

### Show services

``` Powershell
PS C:\> Show-QlikSenseServices -ComputerName qlikserver1.domain.local
```

### Start services

``` Powershell
PS C:\> Start-QlikSense -ComputerName qlikserver1.domain.local
```

### Stop services

``` Powershell
PS C:\> Stop-QlikSense -ComputerName qlikserver1.domain.local
```

### Restart services

``` Powershell
PS C:\> Restart-QlikSense -ComputerName qlikserver1.domain.local
```

## License

This project is provided "AS IS", without any warranty, under the MIT License - see the [LICENSE](LICENSE) file for details