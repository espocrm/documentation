# Server proxy_pass to Docker

* [Apache server](#apache)
* [Nginx server](#nginx)

## Apache

#### Creating 

In /etc/apache2/sites-available create a config file (e.g. crm.com.conf).
The file configs:

```
<VirtualHost 172.20.0.6:80>
    ProxyPreserveHost On 
    ProxyRequests Off 

    ProxyPass / http://localhost:8003/
    
    ServerName crm.com

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
* 172.20.0.6 - my computer/server LAN IP address
* 80 - port that listen for the connection
* http://localhost:8003/ - proxied to localhost on port 8003 that is bind to the Docker container.

Run this command in the terminal to enable new configs:
`sudo a2ensite crm.com.conf`

Restart a web server:
`sudo service apache2 restart`

#### Adding configs for DNS
Add this row to the /etc/hosts file:
`172.20.0.6 crm.com`

## Nginx

#### Creating 

In /etc/nginx/sites-available create a config file (e.g. crm.com.conf).
The file configs:

```
server {
    listen          172.20.0.6:80;
    server_name     crm.com;
    
    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass  http://localhost:8003/;
    }
    
}
```
* 172.20.0.6 - my computer/server LAN IP address
* 80 - port that listen for the connection
* http://localhost:8003/ - proxied to localhost on port 8003 that is bind to the Docker container.

Run this command in the terminal to enable new configs:
`sudo ln -s /etc/nginx/sites-available/crm.com.conf /etc/nginx/sites-enabled/`

Restart a web server:
`sudo service nginx restart`

#### Adding configs for DNS
Add this row to the /etc/hosts file:
`172.20.0.6 crm.com`

