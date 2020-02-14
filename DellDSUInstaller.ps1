######################################################
### Download and Install Dell DSU
### Author: HalestormHunter
### Started: 13-Feb-2020
### Status: Beta
###
### Copyright 2020 Bryant D. I. Harkin "TheHaleStormHunter"
### Licensed under the Apache License, Version 2.0 (the "License");
### you may not use this file except in compliance with the License.
### You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

### Unless required by applicable law or agreed to in writing, software
### distributed under the License is distributed on an "AS IS" BASIS,
### WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
### See the License for the specific language governing permissions and

### limitations under the License.
######################################################

#Add Check For Server Model?

#Grab DSU Package

#Fixes SSL Negotiation Error

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

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

$trigger = New-ScheduledTaskTrigger -At 2am
$task = New-ScheduledTaskAction -Execute "shutdown.exe -r -f -t 0"
$user = whoami.exe
Register-ScheduledTask -TaskName 'Restart Server' -Trigger $trigger -User $user -Action $task -Force

#Inform of Reboot

Write-Host -ForegroundColor Yellow -BackgroundColor Black "Reboot Scheduled For 02:00 Tommorow"




