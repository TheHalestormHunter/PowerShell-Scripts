
$Serverlist = Get-ChildItem -Path C:\Users\$env:USERNAME\Scripts\Scripts\Serverlist.txt



foreach ( $Server in $Serverlist ){


    Write-Host -ForegroundColor Green "Probing $Server For Model Type and Service Tag"

    $modelnum = Get-WMiobject #Model Number String

    $ServiceTag = Get-WMiobject #Service Tag String


    Add-Content -Path ./ServerList.csv "$($Server),$($ServiceTag),$($modelnum)"




}