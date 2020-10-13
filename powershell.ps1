
Write-Host "Welcome to Powershell" -ForegroundColor Red     #directly write to the screen.
# Get-Process -Name microsoft* 

# Get-PSDrive | Where-Object { $_.free -gt 1 } | Select-Object *

# Get-PSDrive | Where-Object { $_.free -gt 1 } | ForEach-Object { write-host "freespace for" $_.root "is" ($_.free / 1gb)gb -ForegroundColor Green }          # get the freespace for each disk in the system.

# "{0:N0}" -f 1000000000000000        #format the input(1000000000000)

# Get-Volume | Where-Object { $_.SizeRemaining -lt 1gb } | ForEach-Object { write-host ($_.SizeRemaining / 1gb) } #less than 1gb.

# Get-Volume | Where-Object { $_.SizeRemaining -lt 1gb } | ForEach-Object { $c = 0; Write-Host "HARISH"; } { write-host ($_.SizeRemaining / 1gb); } { $c = $c + $_.SizeRemaining; } { Write-Host "Total size remaining is" ($c / 1gb); }    #some of freespace available.(without C:\)

#Create directory without using mkdir command.
# New-Item -ItemType Directory "without_mkdir"

# #starting a process
# Start-Process 

#Find Powershell version 
#$PsVersionTable 

##################################  storing passwords in securely   ##########################
# $pass = "harish"
# $pw = $pass | ConvertTo-SecureString -AsPlainText -Force
#  $plaincred = New-Object System.Management.Automation.PSCredential -ArgumentList $un, $pw #adds it to the system for logging

#  eg.
#  connect-msolservice -Credential $plaincred

####################################    credentials    #############################################
# Get-Credential
# Get-Credential | Export-Clixml -Path pass.txt

###################################     date & time    ##############################################
# Get-Date
# Get-Date | select *
# Get-Date | select * | Where-Object { $_.DayOfWeek } | ForEach-Object { Write-Host $_.DayOfWeek } 

# $date = get-date
# $date.ToShortDateString()


# #################################### File date metadata ##################
#  ls .\pass.txt | select *
#  $zebra = ls .\pass.txt | select *

#  $zebra.CrearionTime


######################################## write-host ################

# write-host "Good day mate"

# "Roland garros is here." | Tee-object 007.txt # to display both on screen and to write it to a file.

########################################## warnings #############
# Write-Warning "Rafa is here."
# Write-Warning "Rafa is here." -WarningAction Inquire
# Write-Debug "Please look at the script again." -Debug


############################################  STRINGS ##########
# $horse = "Roland Garros is here."
# $horse.ToUpper()
# $horse.Tolower()

# $hit = "The name is JB."
# $hit2 = $hit.TrimStart("The")
# $hit

# $hit.substring(2)

###########################################  PATH & LOCATIONS #########
# get-childitem | select Fullname

###########################################  ARRAYS  ######################

# $arrray = @()
# $processes = Get-Process

# foreach ($Proc in $processes) {
#     if ($proc.WS / 1mb -gt 100) {
#         $arrray += New-Object psobject -Property @{'ProcessName' = $proc.name; 'workingset' = $proc.ws } #creating a newobject that has two column names 'processname' and 'working set'. Adding corresponding values below it.
#     }
# }
# $arrray | select 'ProcessName', 'workingset' | Export-Csv .\csvdata1.csv -NoTypeInformation

########## Importting from csv to a variable  #############
# $csvimport
# $csvimport = Import-Csv .\csvdata1.csv
# $csvimport[1].ProcessName

########################### variable manipulation
# $horse = "Good morning"
# $Horse | Get-Member
# $horse.GetType()
# $horse.count
# Get-Variable horse
# Remove-Variable horse
# $numbertyped = Read-Host "enter a number:"    #getting a input from the user.
############################# switch statements ########
# switch (2) {
#     0 { "You typed zero" }
#     1 { "You typed one" }
#     2 { "you typed two" }
#     default { "You didn't type the correct thing" }
# }


################# open a firefox window before running the below script.
# $proc = Get-Process
# $firefoxcount = 0
# $firefoxmem = 0
# foreach ($p in $proc) {
#     switch ($p.ProcessName) {
#         firefox { "Browser"; $firefoxcount += 1; $firefoxmem = $firefoxmem + $p.workingset; }
#         Powershell { "scripting $_" }  #$_ - powershell(matching name)
#         # default { "no match" }
#     }
# }
# #$firefoxmem = "{0:N2}" -f ($firefoxmem/1gb)
# Write-Host "FIREFOX uses $firefoxmem"


################################### creating active directory users ###############################
# Script to create Active Directory accounts

# Add the Active Directory bits and not complain if they're already there
Import-Module ActiveDirectory -ErrorAction SilentlyContinue

# set default password
# change pass@word1 to whatever you want the account passwords to be
# $defpassword = (ConvertTo-SecureString "pass@word1" -AsPlainText -force)

# # Get domain DNS suffix
# $dnsroot = '@' + (Get-ADDomain).dnsroot

# # Import the file with the users. You can change the filename to reflect your file
# $users = Import-Csv .\users.csv

# foreach ($user in $users) {
#     if ($user.manager -eq "") { # In case it's a service account or a boss
#         try {
#             New-ADUser -SamAccountName $user.SamAccountName -Name ($user.FirstName + " " + $user.LastName) `
#                 -DisplayName ($user.FirstName + " " + $user.LastName) -GivenName $user.FirstName -Surname $user.LastName `
#                 -EmailAddress ($user.SamAccountName + $dnsroot) -UserPrincipalName ($user.SamAccountName + $dnsroot) `
#                 -Title $user.title -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires  $true `
#                 -AccountPassword $defpassword -PassThru `
                    
#         }
#         catch [System.Object] {
#             Write-Output "Could not create user $($user.SamAccountName), $_"
#         }
#     }
#     else {
#         try {
#             New-ADUser -SamAccountName $user.SamAccountName -Name ($user.FirstName + " " + $user.LastName) `
#                 -DisplayName ($user.FirstName + " " + $user.LastName) -GivenName $user.FirstName -Surname $user.LastName `
#                 -EmailAddress ($user.SamAccountName + $dnsroot) -UserPrincipalName ($user.SamAccountName + $dnsroot) `
#                 -Title $user.title -manager $user.manager `
#                 -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires  $true `
#                 -AccountPassword $defpassword -PassThru `
                    
#         }
#         catch [System.Object] {
#             Write-Output "Could not create user $($user.SamAccountName), $_"
#         }
#     }
#     # Put picture part here.
#     $filename = "$($user.SamAccountName).jpg"
#     Write-Output $filename

#     if (test-path -path $filename) {
#         Write-Output "Found picture for $($user.SamAccountName)"

#         $photo = [byte[]](Get-Content $filename -Encoding byte)
#         Set-ADUser $($user.SamAccountName) -Replace @{thumbnailPhoto = $photo } 
#     }
# }

############################################ script to schedule task automatically  ######################################
# $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'C:\Users\S.P.Harish\Desktop\Powershell\Ts_shell.ps1'

# $trigger = New-ScheduledTaskTrigger -Daily -At 9am

# Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "psvideo" -description "The name is Harish."

########################################### write output vs write-host ######################################
# Write-Output "Hi mate this is harry." # Write-Output , on the other hand, writes to the pipeline, so the next command can accept it as its input. You are not required to use Write-Output in order to write objects, as Write-Output is implicitly called for you. Write-Host writes to the console itself. 

# Write-Output a u s t r a l i a | Measure-Object

