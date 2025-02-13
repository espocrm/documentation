# Traefik and EspoCRM

Traefik is an open-source reverse proxy that makes it easy to work with microservices and/or just containers with your applications.

To connect Traefik and EspoCRM, you can use the Docker Compose environment. Also, you must have your own domain.

1. Create a folder that will contain your EspoCRM files and database.
2. Create here a `docker-compose.yml` file:

#### docker-compose.yml

```
services:

  traefik:
    image: traefik:latest
    container_name: traefik
    command:
      - --api.insecure=true
      - --providers.docker=true
      - --providers.docker.exposedbydefault=false
      - --entrypoints.websecure.address=:443
      - --entrypoints.web.address=:80
      - --entrypoints.web.http.redirections.entryPoint.to=websecure
      - --entrypoints.web.http.redirections.entryPoint.scheme=https
      - --entrypoints.web.http.redirections.entrypoint.permanent=true
      - --certificatesresolvers.esporesolver.acme.tlschallenge=true
      - --certificatesresolvers.esporesolver.acme.email={EMAIL_ADDRESS}
      - --certificatesresolvers.esporesolver.acme.storage=/letsencrypt/acme.json
    ports:
      - "80:80"             
      - "8080:8080"    
      - "443:443"       
    volumes:
      - ./letsencrypt:/letsencrypt                                      
      - /var/run/docker.sock:/var/run/docker.sock:ro     

  espocrm-db:
    image: mariadb:latest
    container_name: espocrm-db
    command: --max-allowed-packet=64MB
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: root_password
      MARIADB_DATABASE: espocrm
      MARIADB_USER: espocrm
      MARIADB_PASSWORD: database_password
    volumes:
      - ./espocrm-db:/var/lib/mysql

  espocrm:
    image: espocrm/espocrm:latest
    container_name: espocrm
    environment:
      ESPOCRM_DATABASE_HOST: espocrm-db
      ESPOCRM_DATABASE_USER: espocrm
      ESPOCRM_DATABASE_PASSWORD: database_password
      ESPOCRM_ADMIN_USERNAME: admin
      ESPOCRM_ADMIN_PASSWORD: password
      ESPOCRM_SITE_URL: "https://{ESPOCRM_DOMAIN}"
    restart: always
    volumes:
      - ./espocrm:/var/www/html
    labels:
      - traefik.enable=true                                           
      - traefik.http.routers.espocrm-app.rule=Host(`{ESPOCRM_DOMAIN}`)
      - traefik.http.routers.espocrm-app.entrypoints=websecure
      - traefik.http.routers.espocrm-app.tls=true
      - traefik.http.routers.espocrm-app.tls.certresolver=esporesolver

  espocrm-daemon:
    image: espocrm/espocrm:latest
    container_name: espocrm-daemon
    volumes:
      - espocrm:/var/www/html
    restart: always
    entrypoint: docker-daemon.sh

  espocrm-websocket:
    image: espocrm/espocrm:latest
    container_name: espocrm-websocket
    environment:
     ESPOCRM_CONFIG_USE_WEB_SOCKET: "true"
     ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBSCRIBER_DSN: "tcp://*:7777"
     ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBMISSION_DSN: "tcp://espocrm-websocket:7777"
    volumes:
      - espocrm:/var/www/html
    restart: always
    entrypoint: docker-websocket.sh
    labels:
      - traefik.enable=true
      - traefik.http.routers.espocrm-ws.rule=Host(`{ESPOCRM_DOMAIN}`) && PathPrefix(`/ws`)
      - traefik.http.routers.espocrm-ws.entrypoints=websecure
      - traefik.http.routers.espocrm-ws.tls=true
      - traefik.http.routers.espocrm-ws.tls.certresolver=esporesolver
      - traefik.http.services.espocrm-ws.loadbalancer.server.port=8080

volumes:
  espocrm-db:
  espocrm:
```

Traefik container commands explanation:

- **api.insecure=true** – *Enable the API in insecure mode. You can access Traefik Dashboard at `your_server_IP:8080`*
- **providers.docker=true** – *Enable Docker as the provider for Traefik*
- **providers.docker.exposedbydefault=false** – *Don't expose every container to Traefik, only expose enabled ones*
- **entrypoints.websecure.address=:443** – *Define an entrypoint for HTTPS on port :443 named websecure*
- **entrypoints.web.address=:80** – *Define an entrypoint for port :80 named web*
- **entrypoints.web.http.redirections.entryPoint.to=websecure** – *Redirect all incoming requests to entrypoint websecure*
- **entrypoints.web.http.redirections.entryPoint.scheme=https** – *Redirection target scheme*
- **entrypoints.web.http.redirections.entrypoint.permanent=true** – *Apply a permanent redirection*
- **certificatesresolvers.esporesolver.acme.tlschallenge=true** – *Enable TLS-ALPN-01 to generate and renew ACME certificates*
- **certificatesresolvers.esporesolver.acme.email=`{EMAIL_ADDRESS}`** – *Setting email for certificates*
- **certificatesresolvers.esporesolver.acme.storage=/letsencrypt/acme.json** – *Defining acme.json file to store certificates information*

EspoCRM container commands explanation:

- **traefik.enable=true** – *Enable Traefik to proxy main EspoCRM container*                              
- **traefik.http.routers.espocrm-app.rule=Host(`{ESPOCRM_DOMAIN}`)** – *Your domain name goes here for the HTTP rule* 
- **traefik.http.routers.espocrm-app.entrypoints=websecure** – *Define entrypoint for HTTPS* 
- **traefik.http.routers.espocrm-app.tls=true** – *Make sure all routers tied to this entrypoint are using HTTPS by default* 
- **traefik.http.routers.espocrm-app.tls.certresolver=esporesolver** – *Define certificates resolvers for HTTPS* 

> The labels in the EspoCRM container for WebSocket works in exactly the same way, we only add a prefix to the host and open port 8080 for container.

----

Now, start containers with the CLI command `docker compose up -d`.

You can track the work of Traefik on the Dashboard at *your_server_IP:8080*.

EspoCRM will work with both HTTP and HTTPS on your domain.
