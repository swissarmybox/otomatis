#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible-playbook bootstrap_local_ubuntu.yml --ask-become-pass
