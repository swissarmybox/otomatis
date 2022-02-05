# Ubuntu for Server

This directory is for playing around with setting up an Ubuntu server machine.

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

ansible-playbook -i hosts.ini setup.yml -u root --ask-pass


/usr/bin/nmap
