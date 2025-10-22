# WebSocket

The WebSocket enables interaction between a server and a client (browser) without the latter making polling requests. Example: When a new notification is received, the server sends the information to the browser in real time.

Out-of-the-box the WebSocket covers the following features:

* New in-app notifications;
* New event reminders;
* Updates in stream on the record detail view;
* Updates of the detail view.

!!! important

    You need to have *zmq* php extension installed.

Enable **Use WebSocket** parameter at Administration > Settings.

## Daemon

You need to run `websocket.php` as a daemon.

### Using systemd

Create a file `/etc/systemd/system/espocrm-websocket.service`.

```
[Unit]
Description=EspoCRM WebSocket Service
Requires=mysql.service
After=mysql.service
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
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

You need to set up a proxy that will forward SSL requests to our websocket server and vice-versa.

### Apache

You need to have *proxy* and *proxy_wstunnel* modules installed.

```
sudo a2enmod proxy
sudo a2enmod proxy_wstunnel
```

In your Apache config inside the *VirtualHost* section for SSL (`<VirtualHost _default_:443>`), add the following:

```
<IfModule proxy_module>
  ProxyRequests Off
  <Location /wss>
       ProxyPass ws://your-domain:8080
       ProxyPassReverse ws://your-domain:8080
  </Location>
</IfModule>
```

### Nginx

Add to *server.conf*:

```
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

upstream websocket {
  server 127.0.0.1:8080;
}
```

Add to the section `server`:

```
location /wss {
    proxy_pass http://websocket;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
    proxy_read_timeout 12h;
}
```

!!! note

    By default, Nginx has *proxy_read_timeout* parameter set to 60 (seconds). You need to increase the value to avoid the connection being terminated too soon. In the example, we set it to 12h.

## Checking whether it works

Click F12 to open the browser console. See whether there's any error related to the WebSocket. If you enabled the WebSocket in the settings, the frontend client will try to connect to the WebSocket once the page is loaded. If something went wrong, an error will be displayed in the browser console.

## Config params

* webSocketDebugMode – bool – `false` – if you run a server (`php websocket.php`) manually from CLI, you will be able to see debug messages in the terminal; changing requires WebSocket process restart;
* webSocketUrl – string – a custom URL for websocket; used only by the client (frontend);
* webSocketUseSecureServer – bool – `false` – to use SSL w/o a proxy;
* webSocketZeroMQSubscriberDsn – string – `tcp://127.0.0.1:5555` – an endpoint to bind to for message listening; to be changed when used inside a container;
* webSocketZeroMQSubmissionDsn – string – `tcp://localhost:5555'` – an endpoint to connect to for message sending; to be changed when used inside a container;
* webSocketPort – string – by default '8443' (ssl) or '8080';
* webSocketSslCertificateFile
* webSocketSslCertificateLocalPrivateKey
* webSocketSslCertificatePassphrase
* webSocketSslAllowSelfSigned
* webSocketUseSecureServer

## Installing ZMQ

### Option 1

```
sudo apt install php-zmq
```

### Option 2

If the previous won't work, try compiling.

You need to have `libzmq3-dev` installed:

```
apt install libzmq3-dev
```

You need to have `php-dev` installed:

```
apt install php-dev
```

Then execute the following commands (from the *root* user):

```
cd /usr
curl -fSL https://github.com/zeromq/php-zmq/archive/e0db82c3286da81fa8945894dd10125a528299e4.tar.gz -o php-zmq.tar.gz
tar -zxf php-zmq.tar.gz
cd php-zmq-e0db82c3286da81fa8945894dd10125a528299e4
phpize && ./configure
make
make install
cd .. && rm -rf php-zmq-e0db82c3286da81fa8945894dd10125a528299e4 && rm php-zmq.tar.gz
```

Then edit *php.ini* (both for the CLI and webserver), add:

```
extension=zmq
```

## Event loop implementations

The default [event loop](https://github.com/reactphp/event-loop?tab=readme-ov-file#loop-implementations) implementation of the WebSocket server relies on file descriptors. By default, the maximum number of file descriptors per process may be set relatively low (commonly 1024).

For production, it's reasonable to install [ext-ev](https://pecl.php.net/package/ev) extension, or any other recommended by ReactPHP. With the extension installed, it will automatically choose the appropriate event loop implementation.
