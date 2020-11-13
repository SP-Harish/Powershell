
Import-Module ActiveDirectory
$end=""
while($end -ne 'q')
{
    #storing user first name in the variable.
    $firstname= read-host -Prompt "please enter your first name"
    $lastname= read-host -prompt "Please enter your last name"
    $password= read-host -prompt "please enter your password"

    #specify where to store the user account
    $ou_path = "OU=Headquaters,DC=cyber,DC=local"


    #converting the password in secure string character
    $securepassword = ConvertTo-SecureString $password -AsPlainText -Force

    #create user account:
    New-ADUser -Name "$firstname $lastname" -GivenName $firstname -Surname $lastname -UserPrincipalName "$firstname.$lastname" -path $ou_path -AccountPassword $securepassword -ChangePasswordAtLogon $true -Enabled $true
    $end= Read-Host -Promp "press q to exit"
}