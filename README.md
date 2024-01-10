# Introductory Range - Example Corp

### Introduction

This repository contains the step-by-step guide and files required to build a simple Windows Active Directory (AD) range environment using Ansible, containing a number of hosts and enterprise services as well as defensive monitoring, all inside the Immersive Labs Ranges platform.

Once the host machines are deployed, further configuration is performed using Ansible to reduce build time and manual steps before having a range ready to go.  This range could be used as a base to develop scenarios and simulations to train or assess technical professionals.

The use of Ansible will also allow for tweaks and adjustments to be made to the final environment before it is built, giving users complete control over the final range.


### Example Corp

By following this guide, users will finish with a range consisting of **nine** machines, excluding the range admin machine which is created automatically, the majority of which will be domain joined.  The domain also contains an enterprise certificate server with auto deployment of user and computer certificates enabled, as well as a file server.  A SIEM solution is provided and configured in the form of a server running Elastic and logs from Windows machines are centrally aggregated to a Windows machine using Windows Event Forwarding (WEF), before being shipped to the Elastic server.  This allows for users to swap out to a different SIEM solution with ease by simply swapping out Elastic for another preferred product and using whatever preferred collector is appropriate.  To enhance monitoring capability within the environment, custom event subscriptions are created on the WEF server and Sysmon is deployed with Olaf Hartong's default [modular config](https://github.com/olafhartong/sysmon-modular/blob/master/sysmonconfig.xml)

During the build, Ansible will be run from an Ubuntu machine inside the range itself which can then be deleted / discarded once the build is completed.


### Limitations

The guides do expect _some_ pre-existing knowledge on the use of Ansible and the underlying technologies in general, but it is aimed at beginners and will provide step-by-step instructions for your first range build.  Further guidance on the use of Ansible can be found [here](https://docs.ansible.com/ansible/latest/getting_started/introduction.html).


### Using the Guides

Steps to building the range are provided in chapters in the Github wiki, with the first chapter linked here:  [Chapter-1](../../wiki/Chapter-1)
