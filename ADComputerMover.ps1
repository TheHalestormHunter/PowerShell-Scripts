######################################################
### Move AD Computers to correct OU
### Author: HalestormHunter
### Started: 16-Aug-2023
### Status: Tested
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

$loop1 = 1

while (2 -gt 1) {
    


    while ( $loop1 -lt 2 ) {



        Write-Host -ForegroundColor Magenta "Computers Default OU"
        Get-ADComputer -Filter * -SearchBase "OU=Computers,DC=bhmanagement,DC=com" -SearchScope OneLevel | ForEach-Object {$_.Name}
        

        Write-Host -ForegroundColor Magenta "Type the name of the computer to be moved..."

        $comname = Read-Host -Prompt "Computer Name ->"

        Clear-Host

        Write-Host -ForegroundColor Yellow -BackgroundColor Black "Computer Selected: $comname"


        Write-Host "Does This Look correct? (Y/N)"

        $confirm = Read-Host -Prompt "-->"

        if ( $confirm -eq "Y") {

            $loop1 = 5

        }



    }



    Write-Host "Moving Computer Object to Corp Comp OU"

    Start-Sleep -Seconds 2

   Move-ADObject -Identity:"CN=$comname,OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=Contoso,DC=com" -Server:"WIMDC10.int.contoso.com" -TargetPath:"OU=Laptops,OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=contoso,DC=com"

    Write-Host -ForegroundColor Green "Done..."

    Pause

    Clear-Host

    $loop1 = 1

}


