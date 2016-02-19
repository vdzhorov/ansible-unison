#!/bin/bash

# define variables
ROLE_NAME=weareinteractive.unison

# create role symnlink
ln -s $(pwd) /usr/share/ansible/roles/$ROLE_NAME

echo 'installing dependencies'
apt-get install openssh-server openssh-client

echo 'checking version'
ansible --version

echo 'checking syntax'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml --syntax-check

echo 'running playbook'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml
