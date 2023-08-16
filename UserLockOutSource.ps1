#####################################################
### User Lock Out Source Finder
### Author: HalestormHunter
### Started: 24-Oct-2019
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





Import-Module ActiveDirectory
$UserName = Read-Host "Please enter username"
#Get main DC
$PDC = (Get-ADDomainController -Filter * | Where-Object {$_.OperationMasterRoles -contains "PDCEmulator"})
#Get user info
$UserInfo = Get-ADUser -Identity $UserName
#Search PDC for lockout events with ID 4740
$LockedOutEvents = Get-WinEvent -ComputerName $PDC.HostName -FilterHashtable @{LogName='Security';Id=4740} -ErrorAction Stop | Sort-Object -Property TimeCreated -Descending
#Parse and filter out lockout events
Foreach($Event in $LockedOutEvents)
  {
    If($Event | Where-Object {$_.Properties[2].value -match $UserInfo.SID.Value})
    {

      $Event | Select-Object -Property @(
        @{Label = 'User'; Expression = {$_.Properties[0].Value}}
        @{Label = 'DomainController'; Expression = {$_.MachineName}}
        @{Label = 'EventId'; Expression = {$_.Id}}
        @{Label = 'LockoutTimeStamp'; Expression = {$_.TimeCreated}}
        @{Label = 'Message'; Expression = {$_.Message -split "`r" | Select-Object -First 1}}
        @{Label = 'LockoutSource'; Expression = {$_.Properties[1].Value}}
      )

    }}