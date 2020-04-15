# WebSocket

Available since version 5.6.0.

WebSocket enables an interaction between a server and a client (browser) w/o the latter making polling requests. Example: When a new notification is received, the server sends the information to the browser in real-time.

Out-of-the-box WebSocket covers the following features:

* New in-app notifications
* New event reminders
* Updates in stream on the record detail view
* Updates of detail view (since 5.9.0)

Enable *Use WebSocket* parameter at Administation > Settings.

You need to have *zmq* php extension installed.

## Daemon

You need to run `websocket.php` as a daemon.

### Using systemd

Create a file `/etc/systemd/system/espocrm-websocket.service`.

```
[Unit]
Description=EspoCRM WebSocket Service
Requires=mysql.service
After=mysql.service

[Service]
Type=simple
Restart=always
RestartSec=5
StartLimitIntervalSec=0
User=www-data
ExecStart=/usr/bin/php /path/to/espocrm/websocket.php
StandardError=/path/to/espocrm/data/logs/websocket.log

[Install]
WantedBy=default.target
```

Command to get the service to start on boot:

`systemctl enable espocrm-websocket.service`


Command to start the service:

`systemctl start espocrm-websocket.service`

## SSL support

You need to set up a proxy that will forward SSL request to our websocket server and vice-versa.

### Apache

You need to have proxy and proxy_wstunnel modules installed.

```
sudo a2enmod proxy
sudo a2enmod proxy_wstunnel
```

In your apache config inside VirtualHost section for SSL (`<VirtualHost _default_:443>`) add the following:

```
    <IfModule proxy_module>
          ProxyRequests Off
          <Location /wss>
               ProxyPass ws://your-domain:8080
               ProxyPassReverse ws://your-domain:8080
	  </Location>
    </IfModule>
```

### Ngnix

Add to server.conf:

```
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

upstream websocket {
  server 127.0.0.1:8080;
}
```

Add to section `server`:

```
location /wss {
    proxy_pass http://websocket;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
}
```

Note: By default Nginix has *proxy_read_timeout* parameter set to 60 (seconds). You need to increase the value to avoid the connection being terminated too soon.

