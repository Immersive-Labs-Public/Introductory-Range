# Introductory Range – Example Corp

### Introduction

This repository contains a step-by-step guide and the files required to build a simple Windows Active Directory (AD) range environment using Ansible. Your range will contain a number of hosts and enterprise services as well as defensive monitoring, all inside the Immersive Labs Ranges platform.

Once the host machines are deployed, you'll perform some more configuration with Ansible to reduce the build time and manual steps before your range is ready to go. You can then use your range as a base to develop scenarios and simulations to train or assess technical professionals.

Using Ansible allows you to tweak and adjust the final environment before it's published, giving you complete control over the final range.


### Example Corp

By following this guide, you'll finish with a range consisting of **nine** machines, excluding the range admin machine, which is created automatically. The majority of these machines will be domain-joined. The domain also contains an enterprise certificate server with auto-deployment of user and computer certificates enabled, as well as a file server.

You're provided with a SIEM solution that's configured in the form of a server running Elastic. Logs from Windows machines are centrally aggregated to a Windows machine using Windows Event Forwarding (WEF), before being shipped to the Elastic server. This allows you to swap out to a different SIEM solution with ease by simply switching Elastic for another preferred product and using whatever preferred collector is appropriate.

To enhance monitoring capability within the environment, custom event subscriptions are created on the WEF server and Sysmon is deployed with Olaf Hartong's default [modular config](https://github.com/olafhartong/sysmon-modular/blob/master/sysmonconfig.xml).

During the build, Ansible will be run from an Ubuntu machine inside the range itself which you can then delete or discard once the build is complete.


### Limitations

These guides expect some pre-existing knowledge of Ansible and the underlying technologies in general, but it's aimed at beginners and will provide step-by-step instructions for your first range build. Further guidance on using Ansible can be found [here](https://docs.ansible.com/ansible/latest/getting_started/introduction.html).


### Using the guides

Steps to building the range are provided in chapters in the repo wiki, with the first chapter linked here: [Chapter 1](../../wiki/Chapter-1)
