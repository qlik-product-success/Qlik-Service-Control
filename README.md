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

If you have PowerShell 5.x you can install the module from NuGet using the following command.

```
Get-PackageProvider -Name NuGet -ForceBootstrap
Install-Module -Name QlikServiceControl
```
Otherwise, the module can be installed by downloading and extracting the files to C:\Program Files\WindowsPowerShell\Modules\Qlik-QlikServiceControl, the module will then be loaded the next time you open a PowerShell console. You can also load the module for the current session using the Import-Module command and providing the name or path to the module.

```
Import-Module QlikServiceControl
```
```
Import-Module .\QlikServiceControl.psd1
```
## License

This project is provided "AS IS", without any warranty, under the MIT License - see the [LICENSE](LICENSE) file for details