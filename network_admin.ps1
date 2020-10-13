Write-Host "WELCOME TO POWERSHELL FOR NETWORK ADMINISTRATION" -ForegroundColor Yellow
# #########################################  Network Information  ################################
# Get-NetIPConfiguration

# #############################################  Getting traceroute a domain ###########
# Test-NetConnection instagram.com -traceroute

# ######################################### Get local logs. #########################
# Get-EventLog -logname System -EntryType Warning

# ########################################  Get service details.
# Get-Service | Where-Object { $_.status -eq "stopped" }

# ####################################### Recent update information ###################
# Get-HotFix

# ####################################  Network firewall rule  #########################
# New-NetFirewallRule -DisplayName "Allow Inbound Port 80" -Direction Inbound -LocalPort 80 -Protocol TCP -Action Allow

# #################################### Secure pwd ###########################
# $newpd = ConvertTo-SecureString -String "harry123" -AsPlainText -Force

# #################################### Active directory new user #####################
# New-ADUser -Name harish.s.p -AccountPassword $newpd

# #################################### enable newuser  ###############################
# Enable-ADAccount -Identity harish.s.p

# ###################################Reset Password & Force change ##################
# set-ADAccpunt password harish.s.p -NewPassword $newpd -Reset-PassThru | Set-Aduser -ChangePasswordAtLogon $true

# ####################################  New GROUP  ##################################
# #New-ADGroup -Name "Melbournians" -SamAccountName Melbournians -GroupCategory Security -GroupScope Global-Path #"CN=Users,DC=IgniteNZ", DC=Internal"

# #################################### Search for accounts with NON -expiring passwords  ##################

# search-ADAccount -PasswrodNeverExpires 

# ####################################  Seach for locked out accounts ##########################
# search-AdAccount -Lockedout

# #################################### search for disabled account #############################
# search-ADAccount -AccountDisabled

