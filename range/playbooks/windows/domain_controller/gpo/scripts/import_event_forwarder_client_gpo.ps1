$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "EventForwarderClient"

# Import the backed-up GPO
Import-GPO -BackupID 80E173FD-441C-4AE4-B234-106AC57F92D4 -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the "WEF" OU
$ouDn = "OU=Systems," + (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $ouDn -LinkEnabled Yes

# https://ss64.com/ps/import-gpo.html long live ss64