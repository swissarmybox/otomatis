# Otomatis

Repository containing all my setup automations with Ansible. Requires Ansible 2.0.

## Usage
### Dev Machines
#### Local Mac

No prerequisites required. Tested on M1 Mac.

```sh
./bootstrap_local_mac.sh
```

Then enter your `sudo` password

#### Local Ubuntu

No prerequisites required. Don't run it as root. Tested on X86 architecture.

```sh
./bootstrap_local_ubuntu.sh
```

Then enter your `sudo` password

#### Remote Ubuntu

Prerequisites:
* Create an Ubuntu VM (X86) on Linode
* Upload your local machine's public SSH key
* Put the IP of the VM on the `hosts.ini` under `ubuntu_dev`


```sh
./bootstrap_remote_ubuntu.sh
```

It will create a non-root user and password, and then reconnect with the created user and password

### Prod Machines
#### Static Blog

## Development

Run `ansible-lint <playbook>.yml` to lint before committing.

## ToDo

* Implement Molecules for testing
* Use assert instead of fail
* Make use of blocks
* Refactor roles

* Use template instead of lineinfile and do validation

I personally use lineinfile, but both modules support validation:

validate: /usr/sbin/sshd -t -f %s

    -t Test mode. Only check the validity of the configuration file and sanity of the keys. This is useful for updating sshd reliably as configuration options may change.

You might add something to your playbook/roles that does runs a package_facts and then checks the version of ssh installed?

Or you might limit your playbook/roles using only running on specific distros and versions that you know will be limited to a specific ssh release. As in Debian Stable will almost never give you an update that would have that kind of breaking change as a security or minor update. So you would limit your playbook/roles to only apply to those known stable releases. Anything out of that, you could fail out, or just do nothing, depending on your requirements.

Many of the modules include an argument that will be a command that can validate the configuration file. So you might also use that if you want to be really sure.

In the case of SSH, since that is probably your remote access. You might also consider running a secondary daemon on an alternate port with a simpler config file that is heavily locked down to a single fallback account or something, that would act as your backup.

Pro-tip: Keep a copy of the stock file around in your Ansible tree. For example, I would copy the stock sshd_config file into the tree as templates/sshd_config.stock. Then I'd make my templates/sshd_config.j2 template, edit it as desired, and build the task to install it. (The same principle applies if I'm just modifiying the file and installing with copy rather than template.)

When a new distro version is released (e.g. going from Debian 10 to 11 or Ubuntu 20.04 to 22.04), I will grab the new stock file, diff it against the sshd_config.stock that I saved, and merge those changes into sshd_config.j2. Then I replace sshd_config.stock with the newer version, so I'm ready for the next upgrade cycle.

Without this, it's harder to upgrade. If you compare your template against the new stock one, it's hard to tell if a given difference is because you changed that setting or if the distro did. You don't need to reinstall a fresh copy of the old distro to pull the file out (or go spelunking into the contents of the .deb/.rpm package).


<!-- Things to check: -->
<!-- install_volta -->
<!-- setup_dotfiles -->

<!-- Use assert instead of fail -->
<!-- make blocks? -->
<!-- refactor roles -->
