# Otomatis (WIP)

Repository containing all my setup automations with Ansible. Requires Ansible 2.0

## Scenarios:
* [X] Setup Mac locally for development

  No prerequisites required.

  ```sh
  ./bootstrap_local_mac.sh
  ```

  Then enter your `sudo` password

* [ ] Setup Ubuntu locally for development

* [ ] Setup Ubuntu remotely for development

  Prerequisites:
  * Create an Ubuntu VM on Linode
  * Upload your local machine's public SSH key
  * Put the IP of the VM on the `hosts.ini`

  ```sh
  ./bootstrap_remote_ubuntu.sh
  ```
  It will create a non-root user and password, and then reconnect with the created user and password
