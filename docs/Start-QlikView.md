# Start-QlikView

## SYNOPSIS

Start all QlikView services on server

## SYNTAX

``` powershell 
Start-QlikView [-ComputerName <String>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Start all QlikView services

## EXAMPLES

### Example 1

``` powershell
Start-QlikView 
```
Start QlikView services on localhost.

### Example 1

``` powershell
Start-QlikView -ComputerName QlikServer1
```
Start QlikView services on QlikServer1. 

### Example 1

``` powershell
Start-QlikView -ComputerName QlikServer1 -Quiet
```
Start QlikView service on QlikServer1, and skip printout of service status.

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