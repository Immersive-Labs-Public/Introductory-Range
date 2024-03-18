$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "EventForwarderServer"

# Import the backed-up GPO
Import-GPO -BackupID E11908A4-2215-43D1-9923-9184DC33EE28 -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the "WEF" OU
$ouDn = "OU=WEF," + (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $ouDn -LinkEnabled Yes

# https://ss64.com/ps/import-gpo.html long live ss64