# Caddy and EspoCRM

The Caddy web server is an open-source, HTTP/2-enabled web server written in Go.

To connect Caddy and EspoCRM, you can use the Docker Compose environment. Also, you must have your own domain.

1\. Create a folder that will contain your EspoCRM files and database.

2\. Create here a `docker-compose.yml` file:

#### docker-compose.yml

```
services:

  caddy:
    image: caddy:latest
    container_name: caddy
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./certs:/etc/caddy/certs            # optional: if you have self-signed certificates
      - ./Caddyfile:/etc/caddy/Caddyfile
    environment:
      - ACME_AGREE=true                     # to automatically obtain certificates

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
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 20s
      start_period: 10s
      timeout: 10s
      retries: 3

  espocrm:
    image: espocrm/espocrm:latest
    container_name: espocrm
    environment:
      ESPOCRM_DATABASE_HOST: espocrm-db
      ESPOCRM_DATABASE_USER: espocrm
      ESPOCRM_DATABASE_PASSWORD: database_password
      ESPOCRM_ADMIN_USERNAME: admin
      ESPOCRM_ADMIN_PASSWORD: password
      ESPOCRM_SITE_URL: "https://{YOUR_DOMAIN}"
    volumes:
      - espocrm-data:/var/www/html/data
      - espocrm-custom:/var/www/html/custom
      - espocrm-custom-client:/var/www/html/client/custom
    restart: unless-stopped
    depends_on:
      espocrm-db:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "bin/command", "app-check"]
      start_period: 20s
      interval: 60s
      timeout: 20s
      retries: 3
    expose:
      - 80

  espocrm-daemon:
    image: espocrm/espocrm:latest
    container_name: espocrm-daemon
    volumes_from:
      - espocrm
    restart: unless-stopped
    entrypoint: docker-daemon.sh
    depends_on:
      espocrm:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "bin/command", "app-check"]
      start_period: 20s
      interval: 180s
      timeout: 20s
      retries: 3

  espocrm-websocket:
    image: espocrm/espocrm:latest
    container_name: espocrm-websocket
    environment:
      ESPOCRM_CONFIG_USE_WEB_SOCKET: "true"
      ESPOCRM_CONFIG_WEB_SOCKET_URL: "wss://{YOUR_DOMAIN}/ws"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBSCRIBER_DSN: "tcp://*:7777"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBMISSION_DSN: "tcp://espocrm-websocket:7777"
    volumes_from:
      - espocrm
    restart: unless-stopped
    entrypoint: docker-websocket.sh
    depends_on:
      espocrm:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "bin/command", "app-check"]
      start_period: 20s
      interval: 180s
      timeout: 20s
      retries: 3
    expose:
      - 8080

volumes:
  espocrm-db:
  espocrm-data:
  espocrm-custom:
  espocrm-custom-client:
```

3\. Create here a `Caddyfile` text file:

#### Caddyfile

```
YOUR_DOMAIN {
    reverse_proxy espocrm:80

    reverse_proxy /ws espocrm-websocket:8080 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-For {remote}
        header_up X-Forwarded-Proto {scheme}
    }

    # Optional for Self-Signed SSL Certificate
    # tls /etc/caddy/certs/myserver.crt /etc/caddy/certs/myserver.key
}
```

----

Now, start containers with the CLI command `docker compose up -d`.
