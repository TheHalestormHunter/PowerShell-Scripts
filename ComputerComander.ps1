######################################################
### Search Computers and Command
### Author: HalestormHunter
### Started: 30-Oct-2019
### Status: Tested
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

#Check Version, Only Runs in PWSH 5


if ($PSVersionTable.PSVersion.Major -ne 5) {
    
    Write-Host -BackgroundColor Black -ForegroundColor Red "THIS SCRIPT ONLY RUNS IN PWSH 5! PLEASE RELAUNCH IN PWSH 5!"

    Start-Sleep -Seconds 5
    
    exit
}

#Start Primary Loop

$Starter = 1

while ( $Starter -lt 2) {

    $CTime = Get-Date -Format "dd-MMM-yyyy HH:mm"

    Write-Host -ForegroundColor Cyan "======================================="
    Write-Host -ForegroundColor Cyan "Current Time: $CTime "
    Write-Host -ForegroundColor Cyan "======================================="

    Write-Host -ForegroundColor Green "====================================="
    Write-Host -ForegroundColor Green "=    Enter Computer to Select       ="
    Write-Host -ForegroundColor Green "====================================="

    $Compute = Read-Host -Prompt "->"

    Clear-Host

    #Start Secondary Loop

    $Secondary = 1

    while ( $Secondary -lt 2 ) {
    

        #Display Selected Host

        $ShortHand = Get-ADComputer -Identity $Compute | Select-Object -ExpandProperty Name

        Write-Host -ForegroundColor Yellow -BackgroundColor Black "====================================="
        Write-Host -ForegroundColor Yellow -BackgroundColor Black "You Selected -> $ShortHand           "
        Write-Host -ForegroundColor Yellow -BackgroundColor Black "====================================="
        #Give Command Options
        
        #Header
        
        Write-Host ""
        Write-Host -ForegroundColor Green "Select Action Option"
        Write-Host -ForegroundColor Green "===================================="
        Write-Host ""
        
        #Options Pane

        Write-Host -ForegroundColor Cyan "(1) List Users Logged on to $Shorthand "
        Write-Host -ForegroundColor DarkYellow "(2) Logoff Users (Broken)"
        Write-Host -ForegroundColor Red -BackgroundColor Black "(3) Restart Computer"
        Write-Host -ForegroundColor Red -BackgroundColor Black "(4) Shutdown Computer"
        Write-Host -ForegroundColor Red -BackgroundColor Black "(5) DELETE Computer from AD"
        Write-Host -ForegroundColor Gray "(6) Select Different Computer"
        Write-Host -ForegroundColor Gray "(7) Exit"


        $Selection = Read-Host -Prompt "->"

        Clear-Host

        #Option 1 List Users

        if ( $Selection -eq 1 ){

            Get-WmiObject -ComputerName $ShortHand -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName
            Pause

        }

        #Option 2 Logoff Users

        if ( $Selection -eq 2){

            #Invoke-Command -ComputerName $ShortHand -ScriptBlock { logoff 2 }
            Invoke-CimMethod -ClassName Win32_Operatingsystem -ComputerName $ShortHand -MethodName Win32Shutdown -Arguments @{ Flags = 4 } | Out-Null

        }

        #Option 3 Restart Computer
        
        if ( $Selection -eq 3){
            
            $Delay = Read-Host -Prompt "Action Delay in Seconds ->"

            Start-Sleep -Seconds $Delay

            Restart-Computer -ComputerName $ShortHand -Force

        }

        #Option 4 Stop Computer

        if ( $Selection -eq 4 ){

            $Delay = Read-Host -Prompt "Action Delay in Seconds ->"

            Start-Sleep -Seconds $Delay

            Stop-Computer -ComputerName $ShortHand -Force

        }

        #Option 5 Delete Computer

        if ( $Selection -eq 5){

            Get-ADComputer -Identity $ShortHand | Remove-ADComputer -Confirm:$false -Recursive
            
        }

        #Option 6 Select New Computer

        if ( $Selection -eq 6 ){

            $Secondary = 5
            $Compute = $null
            $ShortHand = $null

        }

        #Option 7 Exit Script

        if ( $Selection -eq 7){

            $Secondary = 5
            $Starter = 5
            exit
        }

        
    
    }




}
