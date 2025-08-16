<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Ife Adebiyi
    LinkedIn        : linkedin.com/in/ife-adebiyi-033699219
    GitHub          : github.com/IfeCyberproject007
    Date Created    : 16-08-2025
    Last Modified   : 16-08-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Run PowerShell as Administrator

# Define path and values
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 32768
$valueType = "DWord"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Create or update the registry value
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType $valueType -Force | Out-Null

Write-Output "Registry value '$valueName' set to $valueData under $regPath"
