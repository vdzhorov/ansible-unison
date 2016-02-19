#!/bin/bash

# define variables
ROLE_NAME=franklinkim.unison

# create role symnlink
ln -s $(pwd) /usr/share/ansible/roles/$ROLE_NAME

echo 'checking syntax'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml --syntax-check

echo 'running playbook'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml
