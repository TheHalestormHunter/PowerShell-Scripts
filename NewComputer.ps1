######################################################
# New Computer Configuration
# Author: TheHalestormHunter
# Started: 5-Nov-2019
# Status: Untested
######################################################

#Check For PKI

#Get-ChildItem -Path Cert:\LocalMachine\SMS

if ( Test-Path -Path Cert:\LocalMachine\My\* ){

    Write-Host -ForegroundColor "PKI Certs Installed"

}

else {

    Write-Host -ForegroundColor Red -BackgroundColor Black "PKI Certs NOT installed, Try Again Later"
    Write-Host -ForegroundColor Red -BackgroundColor Black "Attempting GP Update..."
    gpupdate /force
    exit

}


#Run Config Manager Actions

#Hardware Inventory

Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000001}" | Out-Null

#Hardware Inventory Collection Cycle

Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000101}" | Out-Null

#Software Inventory

Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000002}" | Out-Null

#Make My Life Easier Later on

Enable-PSRemoting -Force

#Add User to RDP Group

Write-Host -ForegroundColor Green "Enter Future Enduser to add to RDP Group"

$ComUser = Read-Host -Prompt  "->"

Add-LocalGroupMember -Group "Remote Desktop Users" -Member $ComUser


