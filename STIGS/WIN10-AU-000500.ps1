<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Ife Adebiyi
    LinkedIn        : linkedin.com/in/IfeCyberproject007/
    GitHub          : github.com/IfeCyberproject007
    Date Created    : 2025-07-14
    Last Modified   : 2025-07-14
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
    PS C:\> .\(STIG-ID-WN10-AU-000500).ps1 
#>

# Set registry path and value
$registryPath = "HKLM:\SOFTWARE\POLICIES\Microsoft\EventLog\Application"
$valueName = "MaxSize"
$valueData = 0x80000  # 524288 in decimal (512 KB)

# Create the key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Registry key successfully set: $registryPath\$valueName = $valueData"
