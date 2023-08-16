######################################################
### Run Dell Command Updater
### Author: HalestormHunter
### Started: 9-March-2020
### Status: Tested
###
### Copyright 2023 TheHaleStormHunter
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

#Check Computer Maker

if ( ( Get-WmiObject -Class Win32_Bios | Select-Object -ExpandProperty Manufacturer ) -ne 'Dell Inc.' ) {

    Write-Host Error
    exit

}

#Suspend Bitlocker

Get-BitLockerVolume | Suspend-BitLocker -RebootCount 2 -ErrorAction SilentlyContinue

#Test for Dell Command

if ( -Not ( Test-Path 'C:\Program Files (x86)\Dell\CommandUpdate') ) {

    #Install Dell Command If Missing

    New-Item -Path C:\ -Name "Temp" -Force -ItemType "directory"

    #Fixes SSL Negotiation Error

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    #Ensure Download is Complete before moving on

    Start-Job -Name InstallCommand -ScriptBlock { Invoke-WebRequest -Uri "https://dl.dell.com/FOLDER06095696M/1/Dell-Command-Update-Win-32_PH01C_WIN_3.1.1_A00.EXE" -OutFile C:\Temp\DellCommand.exe }
    
    Wait-Job -Name InstallCommand

    & C:\Temp\DellCommand.exe /s /f

    #Make Sure Command Is Installed Before Starting

    Start-Sleep -Seconds 15

    while ( -Not ( Test-Path 'C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe') ) {

        Write-Host "Please Wait While Dell Command is Installed"

        Start-Sleep -Seconds 20

    }

    

}

#Kick off update

Set-Location -Path "C:\Program Files (x86)\Dell\CommandUpdate"

.\dcu-cli /applyUpdates -reboot=enable -silent


