## Configure Computer Template for Certificate Authority

- Open "Certificate Authority" -> "Certificate Templates" -> "Manage"
- Duplicate the "Computer" template 
- Under "General":
  - Name: "Computer (AD)"
  - Validity period: 10 years
  - Publish certificate in Active Directory: enabled
- Under "Subject Name":
  - Enable "DNS name"
  - Enable "User Principal name (UPN)"
- Under "Security":
  - Add "Domain Computers" with "Read", "Enroll" and "Autoenroll" permission


## Configure User Template for Certificate Authority

- Open "Certificate Authority" -> "Certificate Templates" -> "Manage"
- Duplicate the "User" template
- Under "General":
  - Name: "User (AD)"
  - Validity period: 10 years
  - Publish certificate in Active Directory: enabled
- Under "Subject Name":
  - Disable "Include e-mail name in subject name"
  - Disable "E-mail name"
  - Disable "DNS name"
  - Enable "User Principal name (UPN)"
- Under "Security":
  - Add "Domain Users" with "Read", "Enroll" and "Autoenroll" permission

Once both the templates are created, they need to be added to the CA. This can be done by right clicking on "Certificate Templates" and selecting "New" -> "Certificate Template to Issue". Select the two templates created above and click "OK".