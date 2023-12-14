# Content  - Introductory Range

This repository contains the files required to build a simple Windows Active Directory range environment using Ansible. The commands used to configure the range are as follows:

```
ansible-playbook -i inventory.yml playbooks/playbook.yml
```

To run specific sections of the playbook, append the appropriate tags to the end of the command.

```
ansible-playbook -i inventory.yml playbooks/playbook.yml -tags domain-join
```

*The full list of tags can be found in the range/playbooks/playbook.yml file.*

## Please note:

* You will need to connect to the range VPN to run Ansible on your local machine to configure the network.
* The password values in the `range/inventory.yml` file must be updated with the correct passwords for your hosts.
* The range SSH key must be added to the range directory to connect to (and configure) Linux hosts.

