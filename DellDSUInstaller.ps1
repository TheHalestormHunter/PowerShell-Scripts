######################################################
### Download and Install Dell DSU
### Author: HalestormHunter
### Started: 13-Feb-2020
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
###
### limitations under the License.
######################################################
Clear-Host

$CTime = Get-Date -Format g

Write-Host -ForegroundColor Cyan "======================================="
Write-Host -ForegroundColor Cyan "Current Time: $CTime                   "
Write-Host -ForegroundColor Cyan "======================================="

#Add Check For Server Model

if ( $(Get-ComputerInfo | Select-Object -ExpandProperty CsManufacturer) -ne "Dell Inc." ) {

    Write-Host -ForegroundColor Red -BackgroundColor Black "This is NOT a Dell Server...Exiting!"
    exit

}

$ServerModel = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model

Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="
Write-Host -ForegroundColor Yellow -BackgroundColor Black "Machine Info: $ServerModel                             "
Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="

#Fixes SSL Negotiation Error

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Grab DSU Package

$url = "https://dl.dell.com/FOLDER05327752M/1/Systems-Management_Application_FT56W_WN64_1.6.0_A00.EXE"

Invoke-WebRequest -Uri $url -OutFile ~\Downloads\dsu.EXE

#Run DSU installer

& C:\Users\$env:Username\Downloads\dsu.exe -s

Start-Sleep -Seconds 10

#Refresh PWSH Session

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

#Invoke Non-Interactive DSU session

dsu /n

#Schedule Reboot

$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date -Hour 2 -Minute 0 -Second 0).AddDays(1)
$task = New-ScheduledTaskAction -Execute powershell.exe -Argument  "-c Restart-Computer -force"
$user = whoami.exe

#Inport Password Securely

$securepassword = Read-Host -AsSecureString -Prompt "Enter Account Password"

#Convert To Correct Format

$password = [System.Net.NetworkCredential]::new("", $securepassword).Password

#Register New Task

Register-ScheduledTask -TaskName 'Restart Server' -Trigger $trigger -User $user -Password $password -Action $task -Force

#Flush Password

Write-Host "Flushing Password Data..."

Start-Sleep -Seconds 2

Clear-Variable -Name password -Force
Clear-Variable -Name securepassword -Force

Clear-Host

#Inform of Reboot

Write-Host -ForegroundColor Yellow -BackgroundColor Black "Reboot Scheduled For 02:00 Tommorow"

Start-Sleep -Seconds 2

#Suspend Bitlocker IF Enabled

Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="
Write-Host -ForegroundColor Yellow -BackgroundColor Black "Suspending Bitlocker For 2 Reboots                     "
Write-Host -ForegroundColor Yellow -BackgroundColor Black "======================================================="


Get-BitLockerVolume | Suspend-BitLocker -RebootCount 2 -ErrorAction SilentlyContinue

Clear-Host

Write-Host -ForegroundColor Green "Done"
Start-Sleep -Seconds 2





