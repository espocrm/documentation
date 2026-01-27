# VoIP configuration for Docker containers

## Setting up cron

To display pop-up windows for calls and correct working of the Asterisk and Starface VoIP extensions in the [Docker](../../administration/installation-by-script.md) instance, you need to insert an additional line into the [crontab](../../administration/server-configuration.md#setting-up-crontab) or use container in the Docker Compose environment. Keep in mind that you need to choose one thing (crontab line or container). 

### Asterisk crontab line

This line should be added under `root` or other docker user.

```
* * * * * /usr/bin/docker exec --user WEBSERVER_USER -i ESPOCRM_DOCKER-CONTAINER /bin/bash -c "cd /var/www/html; php -f command.php voip Asterisk" > /dev/null 2>&1
```

WEBSERVER_USER can be one of the following: “www”, “www-data”, “apache”, etc (depends on your web-server).

### Asterisk daemon container

When using EspoCRM in a Docker Compose environment, add the following container to the `docker-compose.yml` file (the previous line for crontab is not needed in this case):

```
  espocrm-daemon-voip:
    image: espocrm/espocrm:latest
    container_name: espocrm-daemon-voip
    volumes:
      - espocrm:/var/www/html
    restart: always
    command: ["php", "/var/www/html/command.php", "voip", "Asterisk"]
```
