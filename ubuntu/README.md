# Ubuntu Commands

## Users

1. Create user `adduser <username>` or `useradd -m <username> -p <password>`
2. delete user `deluser <username>`
3. ufw status verbose
4. ufw allow 8000/tcp
5. ufw allow 8000:8080/tcp

### Issue with ssh into the server using root account

1. edit the configuration file for ssh `/etc/ssh/sshd_config`
2. PermitRootLogin yes
3. sudo service ssh restart
