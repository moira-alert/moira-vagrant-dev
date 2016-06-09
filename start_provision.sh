#!/bin/bash

ansible-playbook -i "localhost," -c local ansible/moira.yml
