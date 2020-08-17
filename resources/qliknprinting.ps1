function Show-QlikNPrintingServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )

    $ComputerName | ForEach-Object { `
        Get-Service "*nprinting*" -ComputerName $_ | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}