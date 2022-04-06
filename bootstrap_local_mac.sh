#!/bin/bash

# Install Homebrew and Ansible

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew update
brew upgrade
brew install ansible

ansible-playbook bootstrap_local_mac.yml --ask-become-pass
