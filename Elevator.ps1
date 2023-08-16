######################################################
### A PowerShell Clone of the Bash Script Elevator.sh
### Author: TheHalestormHunter
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

$fail = 2

while ( 1 -lt $fail ) {

#Randomly Place Elevator

$locate = Get-Random -Maximum 10 -Minimum 1

Clear-Host

$level = Read-Host -Prompt "What Floor are you on? (1-10)" #Current Floor Defined


$level = [int]$level

#Sanitize Entry
if (( $level -lt 1) -and ( $level -gt 10)) {
    Write-Host -ForegroundColor Red "Fatal Error Has Occured"
    Start-Sleep -Seconds 1
    Exit
}

#Determine if Elevator is above caller

while ($locate -lt $level) {
    Write-Host Please Wait...
    #Write-Host $locate
    Start-Sleep -Milliseconds 1000
    Clear-Host
    $locate = ($locate + 1)
}

#Determine if Elevator is below caller

while ($locate -gt $level) {
    Write-Host Please Wait...
    #Write-Host $locate
    Start-Sleep -Milliseconds 600
    Clear-Host
    $locate = ($locate - 1)
}

#Confirm Arrival

if ($level -eq $locate) {
    Clear-Host
    Write-Host The Elevator Is Here!
}

Start-Sleep -Seconds 3
Clear-Host

#Prompt Destination

$going = Read-Host -Prompt "What Floor are you going to? (1-10)"

$going = [int]$going

Clear-Host

#Write-Host $going

#Start-Sleep -Seconds 2

#Sanitize Entry
if (( $going -lt 1 ) -and ( $going -gt 10 )) {
    Write-Host -ForegroundColor Red "Fatal Error Has Occured"
    Start-Sleep -Seconds 1
    Exit
}

function lights {
    #$Red = Write-Host -ForegroundColor Red
    #$Yellow = Write-Host -ForegroundColor Yellow
    #Green = Write-Host -ForegroundColor Green

    #Up Arrow Logic

    if ( $going -gt $locate ) { 
        Write-Host -ForegroundColor Green "Up"
    }
    
    else { 
        Write-Host "Up"
    } 
    
    #Level 1 Light

    if ( $locate -eq 1 ) { 
        Write-Host -ForegroundColor Yellow "1" 
    }


    else {
        Write-Host "1"
    }


    #Level 2 Light
    
    if ( $locate -eq 2 ) {
        Write-Host -ForegroundColor Yellow "2"
    }

    else {
        Write-Host "2"
    }

    #Level 3 Light
    
    if ( $locate -eq 3 ) {
        Write-Host -ForegroundColor Yellow "3"
    }

    else {
        Write-Host "3"
    }


    #Level 4 Light
    
    if ( $locate -eq 4 ) {
        Write-Host -ForegroundColor Yellow "4"
    }

    else {
        Write-Host "4"
    }

    #Level 5 Light
    
    if ( $locate -eq 5 ) {
        Write-Host -ForegroundColor Yellow "5"
    }

    else {
        Write-Host "5"
    }

    #Level 6 Light
    
    if ( $locate -eq 6 ) {
        Write-Host -ForegroundColor Yellow "6"
    }

    else {
        Write-Host "6"
    }

    #Level 7 Light
    
    if ( $locate -eq 7 ) {
        Write-Host -ForegroundColor Yellow "7"
    }

    else {
        Write-Host "7"
    }

    #Level 8 Light
    
    if ( $locate -eq 8 ) {
        Write-Host -ForegroundColor Yellow "8"
    }

    else {
        Write-Host "8"
    }

    #Level 9 Light
    
    if ( $locate -eq 9 ) {
        Write-Host -ForegroundColor Yellow "9"
    }

    else {
        Write-Host "9"
    }

    #Level 10 Light
    
    if ( $locate -eq 10 ) {
        Write-Host -ForegroundColor Yellow "10"
    }

    else {
        Write-Host "10"
    }


    #Down Arrow Logic

    if ( $going -lt $locate ) {
        Write-Host -ForegroundColor Red "Down"
    
    }
    else {
        Write-Host "Down"
    }

}

#function indicator {
#    Write-Host " 
#    ================================================== 
#    | "$u" | "$a" | "$b" | "$c" | "$d" | "$e" | "$f" | "$g" | "$h" | "$i" | "$j" | "$dw" | 
#    ================================================== 
#    "
#}

#End Indicator Logic

Clear-Host

#If your selection is less than where you are, you go down 

while ( $going -lt $locate ) { 
    lights
    #indicator
    Start-Sleep -Milliseconds 600
    $locate = ( $locate - 1 )
    Clear-Host
}

#If your selection is greater than where you are, you go up

while ( $going -gt $locate ) { 
    lights
    #indicator
    Start-Sleep -Milliseconds 1000
    $locate = ( $locate + 1 )
    Clear-Host
}

if ( $going -eq $locate ) {
    lights
    #indicator
    Start-Sleep -Seconds 2
    Clear-Host
    Write-Host "You Have Arrived!"
}

Start-Sleep -Seconds 2
Clear-Host

Read-Host -Prompt "Press Enter To Use The Elevator"

}


Write-Host -ForegroundColor Red "Error"