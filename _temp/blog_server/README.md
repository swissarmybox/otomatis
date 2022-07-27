# Ubuntu for Blog Server

## TODO
### Let's Encrypt Certbot

Do this when you connect your domain to your IP address.

Certbot will automatically configure nginx to use https and set a cron job to automatically renew your certficates.

```sh
sudo add-apt-repository ppa:certbot/certbot

# install certbot for nginx
sudo apt install python-certbot-nginx

# install cert for domain

sudo certbot --nginx -d nickbodmer.com -d www.nickbodmer.com
```


## Nginx yaml stuffs


Need to secure nginx

https://gist.github.com/plentz/6737338

- hosts: all
  tasks:
    - name: ensure nginx is at the latest version
      apt: name=nginx state=latest
      become: yes
    - name: start nginx
      service:
          name: nginx
          state: started
      become: yes
    - name: UFW - Allow http/https connections
      ufw:
        rule: allow
        name: 'Nginx Full'
      become: yes
    - name: copy the nginx config file and restart nginx
      copy:
        src: /Users/nick/Google Drive/Sync/Documents/Ansible/nginx_config.cfg
        dest: /etc/nginx/sites-available/nginx_config.cfg
      become: yes
    - name: create symlink
      file:
        src: /etc/nginx/sites-available/nginx_config.cfg
        dest: /etc/nginx/sites-enabled/default
        state: link
      become: yes
    - name: restart nginx
      service:
        name: nginx
        state: restarted
      become: yes
