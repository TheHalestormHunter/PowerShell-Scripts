######################################################
# Find Locked Out User Accounts
# Author: HalestormHunter
# Started: 31-Dec-2019
# Status: Alpha
###
### Copyright 2023 TheHalestormHunter
### Licensed under the Apache License, Version 2.0 (the "License");
### you may not use this file except in compliance with the License.
### You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
###
### Unless required by applicable law or agreed to in writing, software
### distributed under the License is distributed on an "AS IS" BASIS,
### WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
### See the License for the specific language governing permissions and
### limitations under the License.
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

$freshdata = Get-Date -Format "yyyy-MM-dd HH:mm"

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


