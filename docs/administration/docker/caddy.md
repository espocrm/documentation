# Caddy and EspoCRM

The [Caddy web server](https://caddyserver.com/) is an open-source, HTTP/2-enabled web server written in Go.

To connect Caddy and EspoCRM, you can use the Docker Compose environment. Also, you must have your own domain.

1. Create a folder that will contain your EspoCRM files and database.
2. Create here a `docker-compose.yml` file:

#### docker-compose.yml

```
services:

  caddy:
    image: caddy:latest
    container_name: caddy
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./certs:/etc/caddy/certs                   # optional: if you have self-signed certificates
      - ./Caddyfile:/etc/caddy/Caddyfile 
    environment:
      - ACME_AGREE=true                            # to automatically obtain certificates

  espocrm-db:
    image: mariadb:latest
    container_name: espocrm-db
    environment:
      MARIADB_ROOT_PASSWORD: root_password
      MARIADB_DATABASE: espocrm
      MARIADB_USER: espocrm
      MARIADB_PASSWORD: database_password
    volumes:
      - espocrm-db:/var/lib/mysql
    restart: always

  espocrm:
    image: espocrm/espocrm
    container_name: espocrm
    environment:
      ESPOCRM_DATABASE_PLATFORM: Mysql
      ESPOCRM_DATABASE_HOST: espocrm-db
      ESPOCRM_DATABASE_USER: espocrm
      ESPOCRM_DATABASE_PASSWORD: database_password
      ESPOCRM_ADMIN_USERNAME: admin
      ESPOCRM_ADMIN_PASSWORD: password
      ESPOCRM_SITE_URL: "https://{YOUR_DOMAIN}"
    volumes:
      - espocrm:/var/www/html
    restart: always
    depends_on:
      - espocrm-db
    expose:
      - 80 

  espocrm-daemon:
    image: espocrm/espocrm
    container_name: espocrm-daemon
    volumes:
      - espocrm:/var/www/html
    restart: always
    depends_on:
      - espocrm
    entrypoint: docker-daemon.sh

  espocrm-websocket:
    image: espocrm/espocrm
    container_name: espocrm-websocket
    environment:
      ESPOCRM_CONFIG_USE_WEB_SOCKET: "true"
      ESPOCRM_CONFIG_WEB_SOCKET_URL: "wss://{YOUR_DOMAIN}/ws"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBSCRIBER_DSN: "tcp://*:7777"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBMISSION_DSN: "tcp://espocrm-websocket:7777"
    volumes:
      - espocrm:/var/www/html
    restart: always
    depends_on:
      - espocrm
    entrypoint: docker-websocket.sh
    expose:
      - 8080

volumes:
  espocrm:
  espocrm-db:
```

3. Create here a `Caddyfile` text file:

#### Caddyfile

```
espocrm-example.com {
    reverse_proxy espocrm:80

    reverse_proxy /ws espocrm-websocket:8080 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-For {remote}
        header_up X-Forwarded-Proto {scheme}
    }
# Optional for Self-Signed SSL Certificate
    tls /etc/caddy/certs/myserver.crt /etc/caddy/certs/myserver.key
}
```

----

Now, start containers with the CLI command `docker compose up -d`.
