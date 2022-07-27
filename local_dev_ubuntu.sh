#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible-playbook local_dev_ubuntu.yml --ask-become-pass
