# Define GPO name
$GPOName = "Refuse Machine Account Password Changes"

# Import GroupPolicy module
Import-Module GroupPolicy

# Check if the GPO exists, if not, create it
if (-not (Get-GPO -Name $GPOName)) {
    New-GPO -Name $GPOName -Comment "GPO to refuse machine account password changes on DC only" -Confirm:$false
}

# Set the registry value for the GPO
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -ValueName "RefusePasswordChange" -Type DWord -Value 1 -Confirm:$false

# Link the GPO to the Domain Controllers OU
$DomainDn = (Get-ADDomain).DistinguishedName
$DCOu = "OU=Domain Controllers,$DomainDn"
New-GPLink -Name $GPOName -Target $DCOu -LinkEnabled Yes -Confirm:$false

# Adjust security filtering
# Remove "Authenticated Users"
Set-GPPermission -Name $GPOName -TargetName "Authenticated Users" -TargetType Group -PermissionLevel None -Confirm:$false

# Ensure "Domain Controllers" group has GpoApply permission
Set-GPPermission -Name $GPOName -TargetName "Domain Controllers" -TargetType Group -PermissionLevel GpoApply -Confirm:$false
