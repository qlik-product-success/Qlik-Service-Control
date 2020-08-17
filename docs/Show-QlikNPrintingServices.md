# Show-QlikNPrintingServices

## SYNOPSIS

Display state of deployed Qlik NPrinting services on one or more servers.

## SYNTAX

``` powershell 
Show-QlikNPrintingServices [-ComputerName String[]]  [<CommonParameters>]
```

## DESCRIPTION


## EXAMPLES

### Example 1

``` powershell
Show-QlikNPrintingServices -ComputerName QlikServer1, QlikServer2
```

Get Qlik NPrinting service status from QlikServer1 and QlikServer2 and display in terminal. 

## PARAMETERS 

### -Computername

Hostnames to collect Qlik NPrinting service information from. 
Executing user must be authorized to access the listed hostnames. 

### CommonParameters

    This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters.

## INPUT 

None

## OUTPUTS

Service Status

## NOTES

## RELATED LINKS
