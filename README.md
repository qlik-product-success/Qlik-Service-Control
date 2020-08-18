# Control Windows services for Qlik products

## About
Qlik Service Control is a PowerShell module that simplifies control of Windows services for Qlik products. It provide a set of simple commands that enable checking current state of services and changing the state by start/stop/restart commands.

## Usage and examples

The module provides a set of commands for viewing, (re)starting and stopping services on local or remote servers. See the linked sub-pages for more details on each command.

### Any product

* [Show-QlikServices](./docs/Show-QlikServices.md)

### Qlik Sense Enterprise on Windows

* [Show-QlikSenseServices](./docs/Show-QlikSenseServices.md)
* [Start-QlikSense](./docs/Start-QlikSense.md)
* [Stop-QlikSense](./docs/Stop-QlikSense.md)
* [Restart-QlikSense](./docs/Restart-QlikSense.md)

### Qlik Alerting 
* [Show-QlikAlertingServices](./docs/Show-QlikAlertingServices.md)
* [Start-QlikAlertingServices](./docs/Start-QlikAlertingServices.md)
* [Stop-QlikAlertingServices](./docs/Stop-QlikAlertingServices.md)
* [Restart-QlikAlertingServices](./docs/Restart-QlikAlertingServices.md)

### Qlik NPrinting
* [Show-QlikNPrintingServices](./docs/Show-QlikNPrintingServices.md)
* [Start-QlikNPrintingServices](./docs/Start-QlikNPrintingServices.md)
* [Stop-QlikNPrintingServices](./docs/Stop-QlikNPrintingServices.md)
* [Restart-QlikNPrintingServices](./docs/Restart-QlikNPrintingServices.md)

<!--- 
### QlikView Server / Publisher
* [Show-QlikViewServices](./docs/Show-QlikViewServices.md)


* [Start-QlikViewServices](./docs/Start-QlikViewServices.md)
* [Stop-QlikViewServices](./docs/Stop-QlikViewServices.md)

* [Restart-QlikViewServices](./docs/Restart-QlikViewServices.md)
//-->

## Installation

If you have PowerShell 5.x you can install the module from NuGet using the following command. Note, you may need to enable TLS1.2 for NuGet to be successful. 

```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```
```
Get-PackageProvider -Name NuGet -ForceBootstrap
```
```
Install-Module -Name QlikServiceControl
```
Alternatively, the module can be installed by downloading and extracting the files to C:\Program Files\WindowsPowerShell\Modules\Qlik-Service-Control, the module will then be loaded the next time you open a PowerShell console. 

1. Run PowerShell terminal as Administrator
1. Download module from GitHub to user's Downloads folder
    ``` powershell
    Invoke-WebRequest -URI "https://github.com/qlikcustomersuccess/Qlik-Service-Control/archive/master.zip" `
                      -OutFile "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip"
    ```
1. Unblock downloaded ZIP file
    ``` powershell
    Unblock-File -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip"
    ```    
1. Unzip module files
    ``` powershell
    Expand-Archive -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control.zip" `
                   -DestinationPath "$env:HOMEDRIVE$env:HOMEPATH\Downloads\"
    ```
1. Create new folder in PowerShell module's folder. 
    ``` powershell
    New-Item -Path "$env:ProgramFiles\WindowsPowerShell\Modules\Qlik-Service-Control" -ItemType Directory
    ```
1. Copy files from Downloads to Module path
    ``` powershell
    Copy-Item -Path "$env:HOMEDRIVE$env:HOMEPATH\Downloads\Qlik-Service-Control-master\" `
              -Destination "$env:ProgramFiles\WindowsPowerShell\Modules\Qlik-Service-Control"  `
              -Recurse
    ```

You can also load the module for the current session using the Import-Module command and providing the name or path to the module.

```
Import-Module QlikServiceControl
```
```
Import-Module .\QlikServiceControl.psd1
```

## Limitations

### Database services

Database are assume to be resilient services which should remains running. 
Database services are not stopped when prodcut is stopped. 

### PowerShell 5.x

Current implementation relies on remote host access via `-ComputerName` parameter in `*-Service` method calls. 
This parameter is depreceated in PowerShell 6+, so this module cuyrrnelty only works in PowerShell 5.x

## License

This project is provided "AS IS", without any warranty, under the MIT License - see the [LICENSE](LICENSE) file for details