## EASY WAY TO INSTALL GREENBONE source edition on Debian 11 ##

My ansible scripts to install Greenbone source edition on Debian 11.
Installation tested only on Debian 11. Other versions/distribution require minor/major modifications.

- https://greenbone.github.io/source-build/

- Easy-install:
 - install requirements using: ./deps
 - generate needed files and commandline using ./build-commandline.sh -i ip-address -d domain_name -e your-email

Requirements: 
- Ansible
- -> apt-get install -y ansible
- Ansible collection community.general (required for sudo)
- -> ansible-galaxy collection install community.general
- Debian 11 with enought ram and cpu..

How to run:
- use download-sources.sh to download sources from internet
- use (example) command-to-run to execute ansible ..
- gsa password is saved into file /tmp/gsa-password

Note:
- nginx-with-ssl-certbot.yaml requires working A record and http connectivity from let's encrypt service

Files:
- openvas-gvm.yaml - main file to install Greebone source edition
- nginx-with-ssl-files.yaml - nginx ssl proxy for gsa with your own certificate files
- nginx-with-ssl-certbot.yaml - nginx ssl proxy for gsa with letsencrypt (requires http connections and working a record)
- files/ssl_certificate.key - your ssl key file
- files/ssl_certificate.crt - your certificate file

Variables:
-  ssl domain used with ssl
domain_name=gsa.example.com
- email used with certbot
email=foo@gsa.example.com



## NO SUPPORT AVAILABLE. THANKS ##
