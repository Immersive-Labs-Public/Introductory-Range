# Define GPO name
$GPOName = "DisableFirewallSettings"

# Create the GPO
New-GPO -Name $GPOName

# Set policies to disable Windows Firewall for Domain, Private, and Public profiles
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -ValueName "EnableFirewall" -Type DWord -Value 0
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -ValueName "EnableFirewall" -Type DWord -Value 0
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName "EnableFirewall" -Type DWord -Value 0

# Link the GPO to the domain root
$domainDn = (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $domainDn -LinkEnabled Yes
