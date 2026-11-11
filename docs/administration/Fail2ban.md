# Fail2ban

Fail2Ban is a security tool that monitors system logs for repeated failed authentication attempts and temporarily blocks suspicious IP addresses. It helps protect the server against brute-force attacks.

The following steps demonstrate how to install and check that Fail2Ban is correctly configured on your server.

1\. Install
```
sudo apt update
sudo apt install fail2ban -y
```
2\. Create the SSH jail configuration
Create the file:
```
sudo nano /etc/fail2ban/jail.d/sshd.local
```
Add the following configuration:
```
[sshd]
enabled = true
port = ssh
filter = sshd
backend = systemd

findtime = 10m
maxretry = 5
bantime = 1h
```
3\. Test the configuration
Run:
```
sudo fail2ban-client -t
```
You should see:
```
OK: configuration test is successful
```
4\. Restart Fail2Ban
```
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
```
5\. Check the jail
```
sudo fail2ban-client status
```
Check SSH jail details:
```
sudo fail2ban-client status sshd
```