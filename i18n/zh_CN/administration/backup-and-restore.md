# 备份和恢复

## 如何对EspoCRM进行手动备份

EspoCRM系统由文件和数据库数据组成。所有的这两种数据对于创建一份完整的EspoCRM备份来说都是必要的。以下内容是在Ubuntu服务器上配合MySQL数据库创建备份的操作指南。

### 第一步，对文件进行备份

创建一个存档，它包含整个EspoCRM目录的内容。对于Ubuntu系统，默认路径是`/var/www/html`。以下是操作命令：

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### 第二步，对数据库进行备份

要进行备份操作，必须要知道数据库名称和访问凭证。数据库的名称在`database`部分的配置文件`/ESPOCRM_DIRECTORY/data/config.php`中。备份数据库的命令如下：

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### 第三步，对备份进行复制

就这样完成了。接下来需要把已创建的备份文件复制到安全的地方。


## 使用脚本对EspoCRM进行备份

可以使用脚本来备份所需的数据。使用SSH方式进行登录，然后运行相关命令（在Ubuntu上测试通过）。

### 下载脚本

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### 运行脚本

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
其中
* `PATH_TO_ESPOCRM`是EspoCRM的安装目录。
* `BACKUP_PATH`是备份目录。

对于Ubuntu系统的服务器，这个脚本是：

```bash
bash ./backup.sh /var/www/html /opt/backups
```

注：如果你的某位MySQL用户没有所需的转储数据库的权限，系统会提示你输入另外一位MySQL用户的凭据。

创建成功之后，你会知道刚建备份的路径。

## 使用备份文件还原EspoCRM

上文中创建的备份文件可用来还原EspoCRM。

### 第一步，解压备份文件

可以用“归档管理器”或运行以下命令对备份文件进行解压：事先要把文件放到Web服务器的某个目录下。

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
其中：
* `/var/www/html` 是Web服务器的目录。

### 第二步，设置必要的权限

文件须归Web服务器用户所有，并且权限设置妥当。请按以下说明对必要的权限进行设置：[www.espocrm.com/documentation/i18n/zh_CN/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/i18n/zh_CN/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems)。

### 第三步，导入数据库转储文件

应把数据库转储文件导入到用户凭据相同的数据库，否则需要对配置文件`ESPOCRM_DIRECTORY/data/config.php`进行更正。在终端运行以下命令可以导入你的数据库转储文件：

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### 第四步，查看或配置计划任务

检查一下你的计划任务是不是配置妥当。运行以下命令，检查指向EspoCRM的路径是否正确：

```bash
sudo crontab -l -u www-data
```
其中：
 * `www-data`是Web服务器的用户。

如果需要进行更改，请用以下命令：

```bash
sudo crontab -l -u www-data
```

有关EspoCRM计划任务配置的详情，请访问：[www.espocrm.com/documentation/i18n/zh_CN/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/i18n/zh_CN/administration/server-configuration/#user-content-setup-a-crontab)。

