######################################################
# Find Computer Names
# Author: HalestormHunter
# Started: 9-Oct-2019
# Status: Alpha
######################################################

Clear-Host

$CTime = Get-Date -Format g

Write-Host -ForegroundColor Cyan "======================================="
Write-Host -ForegroundColor Cyan "Current Time: $CTime "
Write-Host -ForegroundColor Cyan "======================================="

while ( 1 -lt 2) {

    Write-Host -ForegroundColor Green "=================================================="
    Write-Host -ForegroundColor Green "=    Enter Username To Find There Computer       ="
    Write-Host -ForegroundColor Green "=================================================="

    $user = Read-Host -Prompt "-->"

    Write-Host -ForegroundColor Red -BackgroundColor Black "Do NOT use this computer name for $user"
    Write-Host ""

    Write-Host -ForegroundColor Yellow "=================================================="
    Get-ADComputer -Filter "Name -like '*$user*'" | ForEach-Object {$_.DNSHostName} 
    Write-Host -ForegroundColor Yellow "=================================================="
    

    Pause

    Clear-Host

}


