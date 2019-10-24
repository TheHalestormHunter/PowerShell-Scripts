######################################################
# Move AD Computers to correct OU
# Author: HalestormHunter
# Started: 8-Oct-2019
# Status: Tested
######################################################

Clear-Host

$loop1 = 1

while (2 -gt 1) {
    


    while ( $loop1 -lt 2 ) {



        Write-Host -ForegroundColor Magenta "Computers in _Windows 10 OU"
        Get-ADComputer -Filter * -SearchBase "OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=itagroup,DC=com" -SearchScope OneLevel | ForEach-Object {$_.Name}
        

        Write-Host -ForegroundColor Magenta "Type the name of the computer to be moved..."

        $comname = Read-Host -Prompt "Computer Name ->"

        Clear-Host

        Write-Host -ForegroundColor Yellow -BackgroundColor Black "Computer Selected: $comname"


        Write-Host "Does This Look correct? (Y/N)"

        $confirm = Read-Host -Prompt "-->"

        if ( $confirm -eq "Y") {

            $loop1 = 5

        }



    }



    Write-Host "Moving Computer Object to Laptops OU"

    Start-Sleep -Seconds 2

    Get-ADComputer $comname | Move-ADObject -TargetPath "OU=Laptops,OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=itagroup,DC=com"

    Write-Host -ForegroundColor Green "Done..."

    Pause

    Clear-Host

}


