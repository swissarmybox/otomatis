# Ubuntu Notes
## Security Checklist

1. Turn on automatic updates
   a. Update app

      ```sh
      apt update
      ```

   b. Turn on automatic updates

      ```sh
      apt install unatttended-upgrades
      dpkg-reconfigure --priority=low unattended-upgrades
      ```

      Choose `Yes`

2. Disable root, password and ipv6 login

   a. Edit `sshd_config`

      ```sh
      sudo vim /etc/ssh/sshd_config
      ```

      Use another port for SSH, for example 666

      ```
      Port 666 # Use non 22 port for SSH
      AddressFamily inet # Only allow IPV4 address
      PermitRootLogin no
      PasswordAuthentication no
      ```

  b. Restart SSH daemon

     ```sh
     sudo systemctl restart sshd
     ```

3. Configure firewalls

   a. Install UFW

      ```sh
      sudo apt install ufw
      ```

   b. Check Status

      ```sh
      sudo ufw status
      ```

   c. Enable port that are allowed

      ```sh
      sudo ufw allow 666 # Enable port 666 for SSH
      sudo ufw enable # Enable the firewall
      ```

   d. Disable ping

      ```sh
      sudo vim /etc/ufw/before.rules
      ```

      Go to `ok icmp codes for INPUT`, add this line

      ```
      -A ufw-before-input -p icmp --icmp-type echo-request -j DROP
      ```

   e. Restart UFW

      ```sh
      sudo ufw reload
      ```

4. Reboot server

   ```sh
   sudo reboot
   ```

## Miscellaneous
### Systemd Commands

* To list all services

  ```sh
  systemctl list-units --type=service
  ```

* Stop a service

  ```sh
  systemctl stop <service-name>
  ```

* Start a service

  ```sh
  systemctl start <service-name>
  ```

* Restart a service

  ```sh
  systemctl restart <service-name>
  ```

* Reload a service (useful if just making configuration service without killing the service)

  ```sh
  systemctl reload <service-name>
  ```

* Disable when server boots

  ```sh
  systemctl disable <service-name>
  ```

* Enable when server boots

  ```sh
  systemctl enable <service-name>
  ```

### SSH Keys

* Create a new SSH keygen
  
  ```sh
  ssh-keygen -b 4096
  ```

  This will put it on the default location, which is in `/home/<username>/.ssh/id_rsa`

* Copy the ssh to the server

  ```sh
  ssh-copy-id <server-username>@<server-ip-address>
  ```

* Verify that we can login to the server without password

  ```sh
  ssh <server-username>@<server-ip-address>
  ```

### Network Commands

* Check CNAME and A Records

  ```sh
  dig mydomain.com
  ```

# Enable Nginx

1. Install Nginx

   ```sh
   sudo apt update
   sudo apt install nginx
   ```

2. Enable firewall

   ```sh
   sudo ufw app list
   ```

   To check all the application profile that is compatible with UFW

   ```sh
    Nginx Full: This profile opens both port 80 (normal, unencrypted web traffic) and port 443 (TLS/SSL encrypted traffic)
    Nginx HTTP: This profile opens only port 80 (normal, unencrypted web traffic)
    Nginx HTTPS: This profile opens only port 443 (TLS/SSL encrypted traffic)
    ```

   ```sh
   sudo ufw allow 'Nginx HTTP'
   ```

   To verify

   ```sh
   sudo ufw status
   ```

3. Check if Nginx is running

   Find your server's public IP


   ```sh
   curl -4 icanhazip.com
   ```

   Go to your web browser and enter `http://your-public-ip`

   You should see nginx

4. Add website static files

   ```sh
   cd ~
   mkdir www
   ```

   Add your index.html
   
   ```sh
   touch www/index.html
   ```



# Nginx Notes

1. /etc/nginx/sites-available/default
2. /root/var/www/html
3. to proxy to express server, do

```
location / {
  proxy_pass http://127.0.0.1:3000/
}
```

4. `nginx -t` to run over configuration and valid that everything makes sense so that it doesn't break

# Adding SSL to Nginx

Go to letsencrypt.com to get free SSL certificate

2. User

   a. Create a new user

      ```sh
      adduser test
      ```

      Input a password, and just choose the default for every question

  b. Put user to sudo group

     ```sh
     usermod -aG sudo test
     ```

