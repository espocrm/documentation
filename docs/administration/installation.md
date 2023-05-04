# Installation

### Requirements

EspoCRM can run on most hosting providers. Requirements are the following:

* PHP 8.0 and later;
* MySQL 5.7 (and later) or MariaDB 10.2 (and later).

See the [server configuration](server-configuration.md) article for more information.

### 1. Download EspoCRM installation package

To get the latest version of EspoCRM, follow the [download page](http://www.espocrm.com/download/) link.

### 2. Upload EspoCRM files to your server

Once download is complete, upload the package to your web server.
To upload it, you can use SSH, FTP or the hosting administration panel.
Extract the archive to your public web server directory (e.g. `public_html`, `www`).

!!! note

    If you have only FTP access, you need to extract the archive before uploading to your web server.

### 3. Create MySQL database for EspoCRM

Go to your hosting administration panel (e.g. *cPanel*), or use CLI, and create a new database and database user.

### 4. Run EspoCRM installation wizard

In the browser, open an URL that corresponds to the location where EspoCRM files were extracted (e.g. `http://yourdomain.com/espo` or `http://yourdomain.com` if you extracted to the root).

If you see the screen below, you have the *file permission* issue.
You need to execute the displayed command in the terminal via SSH to set the correct permissions.
It should be `755` for directories, `644` for files, and `775` for the `data` directory.
Also, make sure that you have the correct _owner_ and _group_. In most cases it's `www-data:www-data`. More info about permissions is available [here](server-configuration.md#required-permissions-for-unix-based-systems).

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/1.png)

If you see the following screen, the permission are correct and you can start installation.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/2.png)

In the next step, enter details of your newly created database.

Further, you will be asked to specify a desired username and password for an admin user, some system settings (date formats, default timzone, currency, etc.). Optionally, you can configure SMTP credentials for system emails.

!!! note

    All these parameters can be changed in the application after installation.

In the end, the installation wizard will propose to configure cron in your system. It can be done with `crontab -e` command in Linux or _Windows Tasks Scheduler_ in Windows. See more about cron jobs [here](jobs.md).

We hope you enjoy EspoCRM.
