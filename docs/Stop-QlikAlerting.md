# Stop-QlikAlerting

## SYNOPSIS

Stop all Qlik Alerting services on server

## SYNTAX

``` powershell 
Stop-QlikAlerting [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Stop all Qlik Alerting services

## EXAMPLES

### Example 1

``` powershell
Stop-QlikAlerting 
```
Stop Qlik Alerting services on localhost.

### Example 1

``` powershell
Stop-QlikAlerting -ComputerName QlikServer1
```
Stop Qlik Alerting services on QlikServer1. 

### Example 1

``` powershell
Stop-QlikAlerting -ComputerName QlikServer1 -Quiet
```
Stop Qlik Alerting service on QlikServer1, and skip printout of service status.

## PARAMETERS 

### -Computername

Hostname of server running Qlik Alerting. 

### -Quiet

Flag to suppress service status printout after finished execution.

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters.

## INPUT 

None

## OUTPUTS

Service status print on terminal, unless suppressed with `-Quiet`.

<!-- 
## NOTES

## RELATED LINKS
-->