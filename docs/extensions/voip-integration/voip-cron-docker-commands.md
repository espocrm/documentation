# Setting up cron for VoIP Docker

To display pop-up windows for calls and correct working of the Asterisk and Starface VoIP extensions in the [Docker](https://docs.espocrm.com/administration/installation-by-script) instance, you need to insert an additional line into the [crontab](https://docs.espocrm.com/administration/server-configuration/#setting-up-crontab), depending on which VoIP extension you are using.

WEBSERVER_USER can be one of the following: “www”, “www-data”, “apache”, etc (depends on your webserver).

## Docker Asterisk line for crontab

```
* * * * * /usr/bin/docker exec --user WEBSERVER_USER -i docker-container-name-for-espocrm /bin/bash -c "cd /var/www/html; php -f command.php voip Asterisk" > /dev/null 2>&1
```

## Docker Starface line for crontab

```
* * * * * /usr/bin/docker exec --user WEBSERVER_USER -i docker-container-name-for-espocrm /bin/bash -c "cd /var/www/html; php -f command.php voip Starface" > /dev/null 2>&1
```
