# Define GPO name
$GPOName = "DefenderPolicySettings"

# Create the GPO
$gpo = New-GPO -Name $GPOName

# Set policies

# Disable "Turn off Microsoft Defender Antivirus"
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" -ValueName "DisableAntiSpyware" -Type DWord -Value 1

# Disable "Turn off routine remediation"
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" -ValueName "DisableRoutinelyTakingAction" -Type DWord -Value 1

# Disable "Turn off real-time protection"
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -ValueName "DisableRealtimeMonitoring" -Type DWord -Value 1

# Link the GPO to the domain root
$domainDn = (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $domainDn -LinkEnabled Yes
