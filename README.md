# Start / Stop / Restart: Qlik Sense Enterprise on Windows

This project contains PowerShell scripts to STOP, START and RESTART Qlik Sense services. The servcie status changes are executed in the required order as descriebd in accurate order as referred in [Qlik Support Knowledge: Manual Start and Stop order of Qlik Sense services](https://community.qlik.com/t5/Qlik-Support-Knowledge-Base/Manual-Start-and-Stop-order-of-Qlik-Sense-services/ta-p/1713773)

Changing Windows service state in PowerShell requires the terminal to Run As Administrator. The script attmept to self-elevate the termninal if required. 

### Stop all Qlik Sense Services

* Stop Qlik Sense Services, __except__ Qlik Sense Repository Database (QRD). Typically there is no need to stop the QRD when for exmaple doing normal maintence or altering deployemtn configuration. 
    ``` 
    PS> .\Stop-QlikSense.ps1
    ```
* Stop Qlik Sense Services, __including__ Qlik Sense Repository Database (QRD).
    ``` 
    PS> .\Stop-QlikSense.ps1 -StopRepositoryDatabase
    ```

### Start Qlik Sense Services

Start all Qlik Sense services that are enabled. 
```
PS> .\Start-QlikSense.ps1 
```

### Retart Qlik Sense Services

Restart script invokes stop and start scripts, to the optiosn are similar to STOP. 

* Restart Qlik Sense Services, __except__ Qlik Sense Repository Database (QRD). Typically there is no need to stop the QRD when for exmaple doing normal maintence or altering deployemtn configuration. 
    ``` 
    PS> .Restart-QlikSense.ps1
    ```
* Restart Qlik Sense Services, __including__ Qlik Sense Repository Database (QRD).
    ``` 
    PS> .\Restart-QlikSense.ps1 -IncludeRepositoryDatabase
    ```

## License

This project is provided "AS IS", without any warranty, under the MIT License - see the [LICENSE](LICENSE) file for details