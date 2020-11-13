#Import required module
Import-Module Active Directory 

#Prompt the user enter the location of the .CSV file.
$filepath= Read-Host -Prompt "enter the path of the file"

#converting the file into variables. Import csv is the required module.
$securepassword = ConvertTo-SecureString "paf0e3#$IU" -AsPlainText -Force
$users= Import-Csv $filepath

foreach($user in $users)
{
    $fname=$user.'First Name'
    $lname=$user."Last Name"
    $title=$user.'job Title'
    $officephone=$user.'Office Phone'
    $employee_id=$user.'Employee ID'
    $emailid=$user.'Email Address'
    $Description=$user.Description
    $oa_path= $user.'Organizational Unit'
        
    New-ADUser -Name "$fname $lname" -Title $title -GivenName $lname -Surname $lname -UserPrincipalName "$fname.$lname" -OfficePhone $officephone -Description $Description -path $ou_path -AccountPassword $securepassword -ChangePasswordAtLogon $true -Enabled $true -EmailAddress $emailid
    echo "account created for $fname in $oa_path"
}
