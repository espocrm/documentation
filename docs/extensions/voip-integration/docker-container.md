# VoIP configuration for Docker containers

## Asterisk

To display call pop-up windows and ensure the Asterisk provider works correctly in the [Docker](../../administration/installation-by-script.md) instance, you need to use either a daemon in the Docker Compose environment or add a line to the [crontab](../../administration/server-configuration.md#setting-up-crontab). Choose one of these approaches (either the daemon or the crontab line).

### Daemon (recommended)

!!! note

    This configuration is displayed for the [official EspoCRM container](../../administration/docker/installation.md#install-espocrm-with-docker-compose).

Add the following container to your `docker-compose.yml` file:

```yml
espocrm-daemon-voip:
  image: espocrm/espocrm:latest
  container_name: espocrm-daemon-voip
  volumes:
    - espocrm:/var/www/html
  restart: always
  entrypoint: []
  command: ["php", "/var/www/html/command.php", "voip", "Asterisk"]
```

### Crontab line

!!! important

    This line should be added under `root` or other docker user.

```bash
* * * * * /usr/bin/docker exec --user WEBSERVER_USER -i ESPOCRM_DOCKER-CONTAINER /bin/bash -c "cd /var/www/html; php -f command.php voip Asterisk" > /dev/null 2>&1
```

Replace `WEBSERVER_USER` with one of the following values: `www-data`, `www`, `apache`, etc., depending on your web server.

