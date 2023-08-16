######################################################
### Search Computers and Command
### Author: HalestormHunter
### Started: 16-Aug-2023
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


Write-Host "Move Computer"


$comp = Read-Host -Prompt "Enter Computer Name"



Move-ADObject -Identity:"CN=$comp,OU=Computers,DC=bhmanagement,DC=com" -TargetPath:"OU=BHCO,OU=Computers,OU=Corp,DC=bhmanagement,DC=com"