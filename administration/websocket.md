# WebSocket

Available since version 5.6.0.

Out-of-the-box WebSocket coverts the following features:

* New in-app notifications,
* New event reminders,
* Updates in stream on the record detail view.

Enable 'Use WebSocket' param at Administation > Settings.

You need to have zmq php extension installed.

## Daemon

You need to run `websocket.php` as a daemon.

### Systemd

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
StartLimitInterval=0
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

In your apache config inside VirtualHost section for SSL add the following:

```
    <IfModule proxy_module>
          ProxyRequests Off
          <Location /wss>
               ProxyPass ws://your-domain:8080
               ProxyPassReverse ws://your-domain:8080
	  </Location>
    </IfModule>
```
