$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "EventForwarderClient"

# Import the backed-up GPO
Import-GPO -BackupID EEE3C0A9-02B7-443B-BA10-B86B687A1B44 -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the "WEF" OU
$ouDn = "OU=Systems," + (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $ouDn -LinkEnabled Yes

# Link the imported GPO to the "DC" OU
$DomainDn = (Get-ADDomain).DistinguishedName
$DCOu = "OU=Domain Controllers,$DomainDn"
New-GPLink -Name $GPOName -Target $DCOu -LinkEnabled Yes 

# https://ss64.com/ps/import-gpo.html long live ss64