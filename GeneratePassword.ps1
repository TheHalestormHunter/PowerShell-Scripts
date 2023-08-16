######################################################
### Generate Ramdom Password
### Author: HalestormHunter
### Started: 10-Nov-2020
### Status: Completed
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
###
### limitations under the License.
######################################################

#Load Web System Module

[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null

#Prompt For Password Requirements

$Length = Read-Host -Prompt "Password Length: "
$Numbers = Read-Host -Prompt "How many Numeric Characters? "


$Pass = [System.Web.Security.Membership]::GeneratePassword($Length,$Numbers)

Set-Clipboard -Value $Pass


Write-Host "Password Copied to Clipboard"
Write-Host "Random Password = " $Pass

