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

### Qlik NPrinting
* [Show-QlikNPrintingServices](./docs/Show-QlikNPrintingServices.md)

<!--- 
### QlikView Server / Publisher
* [Show-QlikViewServices](./docs/Show-QlikViewServices.md)


* [Start-QlikAlertingServices](./docs/Start-QlikAlertingServices.md)
* [Start-QlikNPrintingServices](./docs/Start-QlikNPrintingServices.md)
* [Start-QlikViewServices](./docs/Start-QlikViewServices.md)

* [Stop-QlikAlertingServices](./docs/Stop-QlikAlertingServices.md)
* [Stop-QlikNPrintingServices](./docs/Stop-QlikNPrintingServices.md)
* [Stop-QlikViewServices](./docs/Stop-QlikViewServices.md)

* [Restart-QlikAlertingServices](./docs/Restart-QlikAlertingServices.md)
* [Restart-QlikNPrintingServices](./docs/Restart-QlikNPrintingServices.md)
* [Restart-QlikViewServices](./docs/Restart-QlikViewServices.md)
//-->

## Installation

### Clone GitHub project

1. Run PowerShell as Administrator <br />
    ``` powershell
    Start-Process powershell -Verb runAs
    ```
1. Change location to PowerShell modules <br />
    ``` powershell
    Set-Location "$Env:ProgramFiles\WindowsPowerShell\Modules"
    ```
1. Clone repository from GitHub 
    ``` powershell
    git clone https://github.com/qlikcustomersuccess/Qlik-Service-Control
    ```
1. Import moduel to use it in the same Powershell session
    ``` powershell
    Import-Module .\Qlik-Windows-Service-Control\Qlik-Service-Control.psd1
    ```

### Download GitHub repository as Zip file

1. Run PowerShell as Administrator <br />
    ``` powershell
    Start-Process powershell -Verb runAs
    ```
1. Change location to PowerShell modules <br />
    ``` powershell
    Set-Location "$Env:ProgramFiles\WindowsPowerShell\Modules"
    ```
1. Download repository as ZIP from GitHub 
    ``` powershell
    Invoke-WebRequest -uri "https://github.com/qlikcustomersuccess/Qlik-Service-Control/archive/master.zip" -OutFile ".\Qlik-Service-Control.zip"
    ```
1. Expand ZIP file into module subfolder
    ``` powershell
    Expand-Archive -Path ".\Qlik-Service-Control.zip"
    ```
1. Import moduel to use it in the same Powershell session
    ``` powershell
    Import-Module .\Qlik-Service-Control\Qlik-Service-Control-master\Qlik-Windows-Service-Control.psd1
    ```

## License

This project is provided "AS IS", without any warranty, under the MIT License - see the [LICENSE](LICENSE) file for details