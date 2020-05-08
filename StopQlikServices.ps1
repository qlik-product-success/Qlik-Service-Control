# MIT License
# 
# Copyright (c) 2020 CSE
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE`
# SOFTWARE.

# Description: STOP Qlik Sense services in correct order, automatically triggering
# admin privileges.

# References:
# Qlik Sense Support:
# https://support.qlik.com/articles/000010331
#
# Run Powershell Scripts with Admin Privileges: 
# https://www.petri.com/run-powershell-scripts-with-administrative-privileges

# Trigger Admin Privileges
param([switch]$Elevated)
function Check-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Check-Admin) -eq $false) {
    if ($elevated) {
        # could not elevate, quit
    }
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

# Stop Qlik Sense Services
Get-Service QlikSenseRepositoryDatabase | Stop-Service -Force
Get-Service QlikLoggingService | Stop-Service
Get-Service QlikSenseServiceDispatcher | Stop-Service