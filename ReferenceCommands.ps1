New-ADUser -DisplayName:"Caitlin Brown" -GivenName:"Caitlin" -Name:"Caitlin Brown" -Path:"OU=SGUsers,DC=ad,DC=tsgwm,DC=com" -SamAccountName:"cbrown" -Surname:"Brown" -Type:"user" -UserPrincipalName:"cbrown@ad.tsgwm.com"

Set-ADAccountPassword -Identity:"CN=Caitlin Brown,OU=SGUsers,DC=ad,DC=tsgwm,DC=com" -NewPassword:"System.Security.SecureString" -Reset:$true -Server:"SG-DC01.ad.tsgwm.com"

Enable-ADAccount -Identity:"CN=Caitlin Brown,OU=SGUsers,DC=ad,DC=tsgwm,DC=com" -Server:"SG-DC01.ad.tsgwm.com"

Set-ADAccountControl -AccountNotDelegated:$false -AllowReversiblePasswordEncryption:$false -CannotChangePassword:$false -DoesNotRequirePreAuth:$false -Identity:"CN=Caitlin Brown,OU=SGUsers,DC=ad,DC=tsgwm,DC=com" -PasswordNeverExpires:$false -Server:"SG-DC01.ad.tsgwm.com" -UseDESKeyOnly:$false

Set-ADUser -ChangePasswordAtLogon:$true -Identity:"CN=Caitlin Brown,OU=SGUsers,DC=ad,DC=tsgwm,DC=com" -Server:"SG-DC01.ad.tsgwm.com" -SmartcardLogonRequired:$false

Get-ADUser -Identity UserID -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members New UserID