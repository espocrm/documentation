# VoIP configuration for Docker containers

## Setting up cron

To display pop-up windows for calls and correct working of the Asterisk and Starface VoIP extensions in the [Docker](../../administration/installation-by-script.md) instance, you need to insert an additional line into the [crontab](../../administration/server-configuration.md#setting-up-crontab), depending on which VoIP extension you are using.

WEBSERVER_USER can be one of the following: “www”, “www-data”, “apache”, etc (depends on your web-server).

### Asterisk crontab line

This line should be added under `root` or other docker user.

```
* * * * * /usr/bin/docker exec --user WEBSERVER_USER -i ESPOCRM_DOCKER-CONTAINER /bin/bash -c "cd /var/www/html; php -f command.php voip Asterisk" > /dev/null 2>&1
```
