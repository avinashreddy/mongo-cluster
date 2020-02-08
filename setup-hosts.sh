#!/bin/bash

ssh-keygen -R 10.113.1.10
ssh-keygen -R 10.113.1.11
ssh-keygen -R 10.113.1.13

ansible-playbook -b playbook-configure-hosts.yaml --extra-vars "@vars.vault"

