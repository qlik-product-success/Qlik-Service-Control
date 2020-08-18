# Start-QlikSense

## SYNOPSIS

Start all Qlik Sense services on server

## SYNTAX

``` powershell 
Start-QlikSense [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Start all Qlik Sense services including Qlik Sense Repository Database, in case it is stopped and enabled.

## EXAMPLES

### Example 1

``` powershell
Start-QlikSense 
```
Start Qlik Sense services on localhost.

### Example 1

``` powershell
Start-QlikSense -ComputerName QlikServer1
```
Start Qlik Sense services on QlikServer1. 

### Example 1

``` powershell
Start-QlikSense -ComputerName QlikServer1 -Quiet
```
Start Qlik Sense service on QlikServer1, and skip printout of service status.

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