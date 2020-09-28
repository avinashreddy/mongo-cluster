#!/bin/bash

# This is required only when hosts are created on vagrant. 
rm -f ~/.ssh/known_hosts

ansible-playbook -i ./inventory/hosts_uat -b main.yaml 

