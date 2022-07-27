#!/bin/bash

# Install Homebrew and Ansible

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew update
brew upgrade
brew install ansible

ansible-playbook local_dev_mac.yml --ask-become-pass
