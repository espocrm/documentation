# EspoCRM with Docker

In this article:

- [Install EspoCRM with Docker](#install-espocrm-with-docker)
- [Install EspoCRM with Docker Compose](#install-espocrm-with-docker-compose)
- [Install EspoCRM with Traefik](#install-espocrm-with-traefik)
- [Enter the EspoCRM container](#enter-the-espocrm-container)
- [Upgrading](#upgrading-espocrm-in-docker-compose-environment)
- [Shutdown and cleanup](#shutdown-and-cleanup-in-docker-compose-environment)

## Install EspoCRM with Docker

One of the ways to install EspoCRM is by using its official Docker Image. The EspoCRM Container Package contains the Docker image, which incorporates all the required files and dependencies to launch EspoCRM in development or production environments. You can use Docker to run EspoCRM in an isolated environment built with Docker containers. 

EspoCRM image requires to run MariaDB server:

```
$ docker run --detach --name mariadb --env MARIADB_ROOT_PASSWORD=password  mariadb:latest
```

- `mariadb` — name of MariaDB container,
- `MARIADB_ROOT_PASSWORD=password` — you can change `password` to any password you want,
- `mariadb:latest` — [MariaDB image](https://hub.docker.com/_/mariadb/tags) version.

Run EspoCRM container:

```
$ docker run --name my-espocrm --link mariadb:mariadb --env ESPOCRM_DATABASE_HOST=mariadb -d espocrm/espocrm
```

- `my-espocrm` — name of EspoCRM container,
- `mariadb:mariadb` — name (link) of MariaDB container,
- `espocrm/espocrm` — [EspoCRM image](https://hub.docker.com/r/espocrm/espocrm/tags) version.

#### Run EspoCRM container via a specific port:

```
$ docker run --name my-espocrm -p 8080:80 --link mariadb:mariadb -d espocrm/espocrm
```

Then, access it via `http://localhost:8080` with credentials admin and password.

#### Run EspoCRM via a specific IP or a domain with a port:

```
$ docker run --name my-espocrm -e ESPOCRM_SITE_URL=http://172.20.0.100:8080 -p 8080:80 --link mariadb:mariadb -d espocrm/espocrm
```

Then, access it via `http://172.20.0.100:8080` with credentials **admin** and **password**.

## Install EspoCRM with Docker Compose

You can use Docker Compose to run EspoCRM in an isolated environment built with Docker containers. Before starting, make sure you have [Compose](https://docs.docker.com/compose/install/) installed.

1\. Create an empty directory.

```
$ mkdir espocrm-docker
```

2\. Change into this directory.

```
$ cd espocrm-docker/
```

3\. Create a **`docker-compose.yml`** file:

```
version: '3.8'

services:

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
      ESPOCRM_DATABASE_HOST: espocrm-db
      ESPOCRM_DATABASE_USER: espocrm
      ESPOCRM_DATABASE_PASSWORD: database_password
      ESPOCRM_ADMIN_USERNAME: admin
      ESPOCRM_ADMIN_PASSWORD: password
      ESPOCRM_SITE_URL: "http://localhost:8080"
    volumes:
      - espocrm:/var/www/html
    restart: always
    depends_on:
      - espocrm-db
    ports:
      - 8080:80

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
      ESPOCRM_CONFIG_WEB_SOCKET_URL: "ws://localhost:8081"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBSCRIBER_DSN: "tcp://*:7777"
      ESPOCRM_CONFIG_WEB_SOCKET_ZERO_M_Q_SUBMISSION_DSN: "tcp://espocrm-websocket:7777"
    volumes:
      - espocrm:/var/www/html
    restart: always
    depends_on:
      - espocrm
    entrypoint: docker-websocket.sh
    ports:
      - 8081:8080

volumes:
  espocrm:
  espocrm-db:
```

More about *Installation Enviroments* you can find [here](#installation-environments).

4\. Build EspoCRM project from directory.

```
$ docker compose up -d
```

5\. Bring up EspoCRM in a web browser. You can use http://localhost as the IP address, and open http://localhost:8080 in a web browser.

### Install EspoCRM with Traefik

You can read the instructions for installing EspoCRM in conjunction with Traefik in the Docker Compose environment [here](https://docs.espocrm.com/administration/docker/traefik/).

### Upgrading EspoCRM in Docker Compose environment

In order to upgrade the container created by the `docker-compose.yml`:

1. Open your EspoCRM container directory.
2. Run the command:

  ```
  $ docker compose pull && docker compose up -d
  ```

Within a few minutes the container will be upgraded to the latest version.

### Shutdown and cleanup in Docker Compose environment

The `docker compose down` command removes the containers and default network, but preserves EspoCRM database.

The `docker compose down --volumes` removes the containers, default network, and the EspoCRM database.

### Enter the EspoCRM container

In order to enter the container and view the files, make a rebuild, etc., use the following command (`espocrm` is your container name):

```
$ docker exec -it espocrm bash
```

### Installation Environments 

This is one-time environment variables which are using only for the fresh installation. If you need to define configuration options on the container startup, see the Config Environments.

- `ESPOCRM_DATABASE_HOST`

Database host name for EspoCRM. The default value is `mysql`.

- `ESPOCRM_DATABASE_NAME`

Database name for EspoCRM. The default value is `espocrm`.

- `ESPOCRM_DATABASE_USER`

Database user for EspoCRM. The default value is `root`.

- `ESPOCRM_DATABASE_PASSWORD`

Database password for EspoCRM. The default value is `password`.

- `ESPOCRM_ADMIN_USERNAME`

User name for an administrator of EspoCRM. The default value is `admin`.

- `ESPOCRM_ADMIN_PASSWORD`

User password for an administrator of EspoCRM. The default value is `password`.

- `ESPOCRM_SITE_URL`

The URL of EspoCRM. This option is very important for normal operating of EspoCRM. Examples: `http://172.20.0.100:8080`, `http://my-crm.local`.
