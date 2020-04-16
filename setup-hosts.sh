#!/bin/bash

# This is required only when hosts are created on vagrant. 
ssh-keygen -R 10.200.1.10
ssh-keygen -R 10.200.1.11
ssh-keygen -R 10.201.1.10
ssh-keygen -R 10.201.1.11
ssh-keygen -R 10.201.1.12
ssh-keygen -R 10.200.2.10
ssh-keygen -R 10.200.2.11
ssh-keygen -R 10.201.2.10
ssh-keygen -R 10.201.2.11


ansible-playbook -b main.yaml --ask-vault-pass

