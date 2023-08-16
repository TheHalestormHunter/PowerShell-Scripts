#####################################################
### Find Server Model
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

$Serverlist = Get-ChildItem -Path C:\Users\$env:USERNAME\Scripts\Scripts\Serverlist.txt



foreach ( $Server in $Serverlist ){


    Write-Host -ForegroundColor Green "Probing $Server For Model Type and Service Tag"

    $modelnum = Get-WMiobject #Model Number String

    $ServiceTag = Get-WMiobject #Service Tag String


    Add-Content -Path ./ServerList.csv "$($Server),$($ServiceTag),$($modelnum)"




}