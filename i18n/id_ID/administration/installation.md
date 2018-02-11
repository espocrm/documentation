# Installation

### Requirements
EspoCRM runs on the most hosting providers. Requirements include the following:

* PHP 5.6 or latest version of PHP with enabled pdo, json, GD library, mcrypt extensions (usually enabled by default);
* MySQL 5.5.3 or higher.

See [Server Configuration](server-configuration.md) article for more information.

### 1. Download the EspoCRM installation package
To get the latest version of EspoCRM follow [download page](http://www.espocrm.com/download/) link.

### 2. Upload the EspoCRM Files to Your Server

Once the download is complete, upload the package to your web server. 
To upload it you can use SSH, FTP or the hosting administration panel.
Extract the archive to your public web server directory (e.g., `public_html`, `www`, etc.).

_Note: For FTP, you need to extract the archive before uploading to your web server._

### 3. Create a MySQL Database for EspoCRM to use

Go to your hosting administration panel, or to SSH, and create a new database and user for EspoCRM (e.g., `MySQL Databases` in cPanel).

### 4. Run EspoCRM installation process

Now, open your web browser, and go to the URL with EspoCRM files (e.g., `http://yourdomain.com/espo`).

If you see this screen, you have a "Permission denied" error. 
So, you need to execute the displayed command in the terminal via SSH, or set the correct permission. 
It should be 755 for directories, 644 for files, and 775 for `data` directory. 
Also make sure that you have the correct _owner_ and _group_.

![1](../_static/images/administration/installation/1.png)

If you see the following screen, the permission is correct and you can start installing EspoCRM.

![2](../_static/images/administration/installation/2.png)

On this page, you can read and accept the License Agreement.
