#!/bin/bash

# ssh-keygen -R 10.113.1.10
# ssh-keygen -R 10.113.1.11
# ssh-keygen -R 10.113.1.13
# ssh-keygen -R 10.113.1.14
# ssh-keygen -R 10.113.1.15

ansible-playbook -b playbook-configure-hosts.yaml --ask-vault-pass  --e target_hosts=mongo

