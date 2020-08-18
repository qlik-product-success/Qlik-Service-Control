# Stop-QlikView

## SYNOPSIS

Stop all QlikView services on server

## SYNTAX

``` powershell 
Stop-QlikView [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Stop all QlikView services

## EXAMPLES

### Example 1

``` powershell
Stop-QlikView 
```
Stop QlikView services on localhost.

### Example 1

``` powershell
Stop-QlikView -ComputerName QlikServer1
```
Stop QlikView services on QlikServer1. 

### Example 1

``` powershell
Stop-QlikView -ComputerName QlikServer1 -Quiet
```
Stop QlikView service on QlikServer1, and skip printout of service status.

## PARAMETERS 

### -Computername

Hostname of server running QlikView. 
Hostname must be a valid hostname. 

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