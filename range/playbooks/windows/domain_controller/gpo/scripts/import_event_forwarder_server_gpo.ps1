$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "EventForwarderServer"

# Import the backed-up GPO
Import-GPO -BackupID E34D36BE-9B45-4F8A-8B8F-EC6E0DF5CF0D -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the "WEF" OU
$ouDn = "OU=WEF," + (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $ouDn -LinkEnabled Yes

# https://ss64.com/ps/import-gpo.html long live ss64