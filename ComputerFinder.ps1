######################################################
### Find Computer Names
### Author: HalestormHunter
### Started: 9-Oct-2019
### Status: Tested
###
###
###
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


Clear-Host

$CTime = Get-Date -Format "dd-MMM-yyyy HH:mm"

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


