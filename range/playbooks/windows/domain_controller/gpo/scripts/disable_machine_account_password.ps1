# Define GPO name
$GPOName = "Disable Machine Account Password Changes"

# Create the GPO
$gpo = New-GPO -Name $GPOName

# Import GroupPolicy module
Import-Module GroupPolicy

# Create a new GPO
New-GPO -Name $GPOName -Comment "GPO to disable machine account password changes"

# Set the registry value for the GPO
Set-GPRegistryValue -Name $GPOName -Key "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -ValueName "DisablePasswordChange" -Type DWord -Value 1

# Link the GPO to an OU (Modify the OU path accordingly)
$domainDn = (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target "$domainDn" -LinkEnabled Yes