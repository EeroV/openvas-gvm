My ansible scripts to install Greenbone source edition on Debian 11.
- https://greenbone.github.io/source-build/

Requirements: 
- Ansible
- -> apt-get install -y ansible
- Ansible collection community.general (required for sudo)
- -> ansible-galaxy collection install community.general
- Debian 11 with enought ram and cpu..

How to run:
- use download-sources.sh to download sources from internet
- use (example) command-to-run to execute ansible ..

Any comments/fixes welcome: eero.volotinen@iki.fi

