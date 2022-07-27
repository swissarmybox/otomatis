#!/bin/bash

# Run Ansible to create non-root
echo "You will be asked a username and password, please remember it"
ansible-playbook -u root remote_dev_ubuntu_presetup.yml

# Run Ansible with the non-root user
echo "What was the name of the created user"
read created_user

ansible-playbook -u $created_user --ask-become-pass remote_dev_ubuntu.yml
