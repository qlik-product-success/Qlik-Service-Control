function Show-QlikServices {

    [CmdletBinding(PositionalBinding=$false)]
    param(        
        [string[]]$ComputerName="localhost"
    )
    
    $ComputerName 
    
    "su-apac02.qliktech.com" | ForEach-Object { `
        Get-Service "Qlik*" -ComputerName $_ | `
        Select-Object @{Name='ComputerName';Expression={$_.MachineName}}, DisplayName, Status, Starttype | `
        Format-Table * -AutoSize `
    }
}