######################################################
# Find Locked Out User Accounts
# Author: HalestormHunter
# Started: 31-Dec-2019
# Status: Alpha
######################################################

#Import Tools for PWSH 6

#$Version = $PSVersionTable.PSVersion.Major
#
#if ( $Version -ne 5 ) {
#
#    Install-Module -Name WindowsCompatibility -Confirm:$false
#
#    	
#    Import-Module -Name WindowsCompatibility
#
#
#    Import-WinModule -Name ActiveDirectory
#}


#Start Main Loop

Clear-Host

while ( 2 -gt 1 ) {

$freshdata = Get-Date -Format " MM/dd/yyyy HH:mm"

Write-Host -ForegroundColor Green "======================================================="

Write-Host -ForegroundColor Green "Directory Data Updated on $freshdata"

Write-Host -ForegroundColor Green "======================================================="


Write-Host -ForegroundColor Yellow -BackgroundColor Black "Discovered Locked Out Accounts"

Write-Host -ForegroundColor Yellow -BackgroundColor Black "===================================="

Search-ADAccount -LockedOut

Write-Host -ForegroundColor Yellow -BackgroundColor Black "===================================="


Start-Sleep -Seconds 60

Clear-Host

}


