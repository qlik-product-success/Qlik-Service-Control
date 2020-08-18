# Stop-QlikSense

## SYNOPSIS

Stop all Qlik Sense services on server

## SYNTAX

``` powershell 
Stop-QlikSense [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Stop all Qlik Sense services except Qlik Sense Repository Database, which is considred as a resilient servcie that should be left running.

## EXAMPLES

### Example 1

``` powershell
Stop-QlikSense 
```
Stop Qlik Sense services on localhost.

### Example 1

``` powershell
Stop-QlikSense -ComputerName QlikServer1
```
Stop Qlik Sense services on QlikServer1. 

### Example 1

``` powershell
Stop-QlikSense -ComputerName QlikServer1 -Quiet
```
Stop Qlik Sense service on QlikServer1, and skip printout of service status.

## PARAMETERS 

### -Computername

Hostname of server running Qlik Sense Enterprise on Windows. 

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