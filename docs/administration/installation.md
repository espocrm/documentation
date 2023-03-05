# Installation

### Requirements

EspoCRM can run on most hosting providers. Requirements are the following:

* PHP 8.0 and later,
* MySQL 5.7 (and later) or MariaDB 10.2 (and later).

See [server configuration](server-configuration.md) article for more information.

### 1. Download EspoCRM installation package

To get the latest version of EspoCRM, follow the [download page](http://www.espocrm.com/download/) link.

### 2. Upload EspoCRM files to your server

Once the download is complete, upload the package to your web server.
To upload it, you can use SSH, FTP or the hosting administration panel.
Extract the archive to your public web server directory (e.g. `public_html`, `www`).

_Note: If you have only FTP access, you need to extract the archive before uploading to your web server._

### 3. Create MySQL database for EspoCRM

Go to your hosting administration panel (e.g. *cPanel*), or use SSH, and create a new database and user for EspoCRM.

### 4. Run EspoCRM installation process

Now, open your web browser, and go to the URL that corresponds to the location where EspoCRM files were extracted (e.g. `http://yourdomain.com/espo` or `http://yourdomain.com` if you extracted to the root).

If you see the screen below, you have the *file permission* issue.
You need to execute the displayed command in the terminal via SSH to set the correct permissions.
It should be `755` for directories, `644` for files, and `775` for the `data` directory.
Also, make sure that you have the correct _owner_ and _group_. In most cases it's `www-data:www-data`. More info about permissions is available [here](server-configuration.md#required-permissions-for-unix-based-systems).

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/1.png)

If you see the following screen, the permission are correct and you can start installing EspoCRM.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/2.png)

Enter the details for your newly created MySQL database.

![4](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/4.png)

Enter a username and password for the admin user in EspoCRM.

![5](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/5.png)

Set the default system settings, such as date and time formats, timezone, currency and others.

![6](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/6.png)

Enter SMTP settings for outgoing emails.
This step **can be skipped** by clicking the _Next_ button.

![7](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/7.png)

!!! note

    All these parameters can be changed in the application after installation.

Installation is complete. The last thing is to setup cron (or daemon) in your system. It can be done by running `crontab -e` in linux cli and in _Windows Tasks Scheduler_ in Windows systems. More info about jobs is available [here](jobs.md).

![8](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/8.png)

We hope you will enjoy working with EspoCRM.
