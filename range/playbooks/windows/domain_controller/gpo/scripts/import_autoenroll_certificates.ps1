$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "AutoEnrollCertificates"

# Import the backed-up GPO
Import-GPO -BackupID 5473DD0C-E562-4B74-8733-49AA011FF30E -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the domain root
$domainDn = (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $domainDn -LinkEnabled Yes

# Remove 'Authenticated Users' without confirmation prompt
Set-GPPermissions -Name $GPOName -TargetName "Authenticated Users" -TargetType Users -PermissionLevel None -Confirm:$false

# Add 'Domain Computers' with Read and Apply permissions and replace existing permissions
Set-GPPermissions -Name $GPOName -TargetName "Domain Computers" -TargetType Group -PermissionLevel GpoApply -Confirm:$false

# Add 'Domain Users' with Read and Apply permissions and replace existing permissions
Set-GPPermissions -Name $GPOName -TargetName "Domain Users" -TargetType Group -PermissionLevel GpoApply -Confirm:$false
