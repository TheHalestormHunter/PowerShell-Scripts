######################################################
# Move AD Computers to correct OU
# Author: HalestormHunter
# Started: 24-Oct-2019
# Status: Untested
######################################################


Write-Host -ForegroundColor Green "======================================="
Write-Host -ForegroundColor Green "Enter Computer to Clone Memberships From"
Write-Host -ForegroundColor Green "======================================="

#Grab Computer Name

$OGComputer = Read-Host -Prompt "->"

#Test Validity

try { Get-ADComputer -Identity $OGComputer | Out-Null }

catch {

    Write-Host -ForegroundColor Red -BackgroundColor Black "Computer Not Found! Exiting..."
    exit

}




Write-Host -ForegroundColor Magenta "==========================================="
Write-Host -ForegroundColor Magenta "Enter Computer to Add Group Memberships to"
Write-Host -ForegroundColor Magenta "==========================================="

#Grab Computer Name

$NWComputer = Read-Host "->"

try { Get-ADComputer -Identity $NWComputer | Out-Null}

catch {

    Write-Host -ForegroundColor Red -BackgroundColor Black "Computer Not Found! Exiting..."
    exit

}

Clear-Host

#Verifiy Selections

Write-Host -ForegroundColor Yellow -BackgroundColor Black "Verify Selections"
Write-Host -ForegroundColor Yellow -BackgroundColor Black "==========================================="
Write-Host ""
Write-Host -ForegroundColor Green "Selected Computer to Clone Group Membership: $OGComputer"
Write-Host -ForegroundColor ""
Write-Host "Groups to be cloned:"
Get-ADComputer -Identity $OGComputer | Get-ADPrincipalGroupMembership | Select-Object -ExpandProperty name
Write-Host ""
Write-Host -ForegroundColor Magenta "Selected Destinnation Computer: $NWComputer"
Write-Host ""
$Prompt = Read-Host -Prompt "Does This Look Correct? (Y/N)"

if ( $Prompt -ne "Y" ){

    exit

}
else {
    Write-Host -ForegroundColor DarkGreen -BackgroundColor Black "Selections Confirmed!"
    Start-Sleep -Seconds 3
}

Clear-Host


Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="
Write-Host -ForegroundColor Yellow -BackgroundColor Black "Cloning Group Memberships of $OGComputer to $NWComputer"
Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="


Get-ADComputer -Identity $OGComputer -Properties MemberOf | Select-Object -ExpandProperty MemberOf | Add-ADGroupMember -Members $NWComputer

