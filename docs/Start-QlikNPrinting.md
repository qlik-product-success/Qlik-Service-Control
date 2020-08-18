# Start-QlikNPrinting

## SYNOPSIS

Start all Qlik NPrinting services on server

## SYNTAX

``` powershell 
Start-QlikNPrinting [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Start all Qlik NPrinting services except Qlik NPrinting Repository Database, which is considred as a resilient servcie that should be left running.

## EXAMPLES

### Example 1

``` powershell
Start-QlikNPrinting 
```
Start Qlik NPrinting services on localhost.

### Example 1

``` powershell
Start-QlikNPrinting -ComputerName QlikServer1
```
Start Qlik NPrinting services on QlikServer1. 

### Example 1

``` powershell
Start-QlikNPrinting -ComputerName QlikServer1 -Quiet
```
Start Qlik NPrinting service on QlikServer1, and skip printout of service status.

## PARAMETERS 

### -Computername

Hostname of server running Qlik NPrinting. 

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