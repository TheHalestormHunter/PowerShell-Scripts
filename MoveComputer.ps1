
Write-Host "Move Laptop to TD OU"


$comp = Read-Host -Prompt "Enter Computer Name"



Move-ADObject -Identity:"CN=$comp,OU=Laptops,OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=itagroup,DC=com" -TargetPath:"OU=Travel Directors,OU=Laptops,OU=_Windows 10,OU=Physical Workstations,OU=Machines,DC=int,DC=itagroup,DC=com"