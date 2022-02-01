# Local Ubuntu

This directory is for playing around with setting up an Ubuntu local dev machine.

## Development

Use the provided `Dockerfile` to play around and test changes. There is a non root user in the container, username is `jane` and password is `jane_password`. To run the `docker` container, make sure you are in this directory:

* Build docker container

  ```sh
  make build
  ```

* Run the container

  ```sh
  make run
  ```

* Test the playbook

  ```sh
  cd ~
  git clone https://github.com/swissarmybox/otomatis.git
  ansible-playbook --ask-become-pass otomatis/local/ubuntu_dev/setup/setup.yml
  ```

  Use `jane_password` as the password.

## Production

Setup an Ubuntu machine from scratch. Please remember security best practices (TODO: needs to write a playbook for automating this).

* Install `ansible` and `git`

  ```sh
  sudo apt update && \
  sudo apt install --yes git && \
  sudo apt-add-repository --yes --update ppa:ansible/ansible && \
  sudo apt install --yes ansible
  ```

* Clone and run ansible playbook

  ```sh
  cd ~
  git clone https://github.com/swissarmybox/otomatis.git
  ansible-playbook --ask-become-pass otomatis/local/ubuntu_dev/setup/setup.yml
  ```
