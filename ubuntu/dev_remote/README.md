# Ubuntu for Server

Ansible Playbook to setup a remote Ubuntu dev machine.

## Prerequisites

1. If you haven't already. Create a public/private SSH key pair.

   ```sh
   ssh-keygen -b 4096
   ```

   This will put the key pair on the default location, which is in `/home/<username>/.ssh/id_rsa`

2. Copy the ssh to the server as __ROOT__

   ```sh
   ssh-copy-id root@<server-ip-address>
   ```

   Enter the __ROOT__'s password

3. Verify that you can login as __ROOT__ without password

   ```sh
   ssh root@<server-ip-address>
   ```

## Run Setup

Enter the `setup` directory.

2. Insert the hosts IP address by editing `hosts.ini` and also edit the `pre_setup.yml` `copy_local_key` to represent the SSH public certificate that you are going to transfer to the hosts

2. Run ansible as root for pre-setup

   This will ask for a user account and password that will be created. Please remember this username and password.

   ```sh
   ansible-playbook -i hosts.ini -u root pre_setup.yml
   ```

3. Run ansible as newly created user for setup

  Use the newly created user and password.

  ```sh
  ansible-playbook -i hosts.ini --ask-become-pass -u <user> setup.yml
  ```
