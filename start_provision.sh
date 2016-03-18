#!/bin/bash

ansible-playbook -i /tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory ansible/moira.yml 
