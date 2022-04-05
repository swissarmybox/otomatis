#!/bin/bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew update
brew upgrade
brew install ansible

ansible-playbook setup_mac.yml --ask-become-pass
