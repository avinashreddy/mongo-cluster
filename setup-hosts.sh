#!/bin/bash

# This is required only when hosts are created on vagrant. 
ssh-keygen -R 10.113.1.10
ssh-keygen -R 10.113.1.11
ssh-keygen -R 10.113.1.13
ssh-keygen -R 10.113.1.14
ssh-keygen -R 10.113.1.15

ansible-playbook -b main.yaml --ask-vault-pass

