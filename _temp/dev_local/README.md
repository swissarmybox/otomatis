# Ubuntu for Development

This directory is for playing around with setting up an Ubuntu local dev machine. This assumes that Ubuntu desktop is installed previously, and a new non-root user is already created.

## Development

Use the provided `Dockerfile` to play around and test changes. There is a non root user in the container, username is `test` and password is `testpwd`. To run the `docker` container, make sure you are in this directory.

Be advised that some items related tasks don't work on Docker:
* volta
* ufw

Make your changes to this repository, without committing at first. Test the changes:

* Run the container with mount

  ```sh
  make run-with-mount
  ```

* To test the playbook but bypassing git

  ```sh
  cd ~
  ansible-playbook --ask-become-pass .otomatis/ubuntu/dev/setup/setup.yml
  ```

  Use `testpwd` as the password.

Once you are confident that the changes are working. Commit, and push the changes, then test the actual workflow.

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
  git clone https://github.com/swissarmybox/otomatis.git .otomatis
  ansible-playbook --ask-become-pass .otomatis/ubuntu/dev/setup/setup.yml
  ```

  Use `testpwd` as the password.

## Production

Setup an Ubuntu machine from scratch. Please remember security best practices.

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
  git clone https://github.com/swissarmybox/otomatis.git .otomatis
  ansible-playbook --ask-become-pass .otomatis/ubuntu/dev/setup/setup.yml
  ```

## TODO

* Automate SSH key to Github
* Implement security best practices
