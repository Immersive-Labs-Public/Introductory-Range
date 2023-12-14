$backupPath = 'C:\setup\backup_gpo\'
$GPOName = "ImportedDefenderPolicySettings"

# Import the backed-up GPO
Import-GPO -BackupID 7C35599B-11D6-487C-9BCF-42E136547BAC -Path $backupPath -TargetName $GPOName -CreateIfNeeded

# Link the imported GPO to the domain root
$domainDn = (Get-ADDomain).DistinguishedName
New-GPLink -Name $GPOName -Target $domainDn -LinkEnabled Yes

# https://ss64.com/ps/import-gpo.html long live ss64