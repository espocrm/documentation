# Конфигурация сервера для EspoCRM

EspoCRM может быть установлен на сервер Apache ([инструкция](apache-server-configuration.md)), Nginx ([инструкция](nginx-server-configuration.md)) или IIS с поддержкой PHP версии 5.6 или выше и MySQL версии 5.5.3 или выше.


## Рекомендации по конфигурации

### Требования PHP

EspoCRM требует PHP 5.6 или выше со следующими включенными расширениями:

* [pdo](http://php.net/manual/en/book.pdo.php) – чтобы получить доступ к MySQL в PHP;
* [json](http://php.net/manual/en/book.json.php) – ресурсы используют этот формат (метаданные, макет, языки и другие);
* [gd](http://php.net/manual/en/book.image.php) – для манипуляций с изображениями;
* [openssl](http://php.net/manual/en/book.openssl.php) – для обеспечения максимальной защиты;
* [zip](http://php.net/manual/en/book.zip.php) – чтобы иметь возможность обновлять EspoCRM и устанавливать расширения;
* [imap](http://php.net/manual/en/book.imap.php) – чтобы контролировать почтовые ящики в EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [iconv](http://php.net/manual/en/book.iconv.php);
* [curl](http://php.net/manual/en/book.curl.php) – для интеграций;
* [xml](http://php.net/manual/en/book.xml.php) – для экспорта в Excel;
* [xmlwriter](http://php.net/manual/en/book.xmlwriter.php) – для экспорта в Excel;
* [exif](http://php.net/manual/en/book.exif.php) – для правильной ориентации загружаемых изображений.

Настройки php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```

### Требования к базе данных

EspoCRM поддерживает MySQL версии 5.5.3 или выше. MariaDB также поддерживается. Нет специфических особенностей. Все настройки по умолчанию подходят для EspoCRM. 

Для лучшей работы рекомендуется использовать MySQL 5.6 или выше.

### Поддержка MySQL 8

MySQL 8.0.4 изменил метод аутентификации по умолчанию на caching_sha2_password, который не поддерживается PHP (на момент написания). Для MySQL 8 его следует заменить на метод mysql_native_password. Для пользователя это можно сделать с помощью запроса:

```
CREATE USER username@localhost identified with mysql_native_password by 'password';
```
где username - ваш пользователь MySQL, password - ваш пароль пользователя MySQL.

## Требуемые разрешения для систем на основе Unix

Файлы и каталоги должны иметь следующие разрешения:

* `/data`, `/custom`, `/client/custom` – должны быть доступны для записи все файлы, каталоги и подкаталоги (664 для файлов, 775 для каталогов, включая все подкаталоги и файлы);
* `/application/Espo/Modules`, `/client/modules` – должен быть доступен для записи текущий каталог (775 для текущего каталога, 644 для файлов, 755 для каталогов и подкаталогов);
* Все остальные файлы и каталоги должны быть доступны для чтения (644 для файлов, 755 для каталогов).

Чтобы установить разрешения, выполните следующие команды в терминале:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom client/custom -type d -exec chmod 775 {} + && find data custom client/custom -type f -exec chmod 664 {} +;
chmod 775 application/Espo/Modules client/modules;
```

Все файлы должны принадлежать процессу веб-сервера и принадлежать группе процесса веб-сервера. Это могут быть «www-data», «daemon», «apache», «www» и т. д.

Примечание. В Bitnami Stack файлы должны принадлежать пользователю “daemon” и  принадлежать группе пользователя “daemon”. 

Примечание. На общих хостах файлы должны принадлежать вашей учетной записи и принадлежать группе вашей учетной записи.

Чтобы установить владельца и группу-владельца, выполните следующие команды в терминале:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Настройка crontab

*Информация о заданиях в EspoCRM доступна [здесь](jobs.md).*

### Unix-подобные системы

Чтобы настроить crontab в Unix-подобной системе, сделайте следующее:

1. Войдите как администратор в свой экземпляр EspoCRM.
2. Перейдите в раздел «Планировщик заданий» на панели администратора («Меню» > «Администрирование» > «Планировщик заданий») и скопируйте строку для crontab. Она выглядит так:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
3. Откройте терминал и выполните эту команду:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER может быть одним из следующих «www», «www-data», «apache» и т. Д. (Зависит от вашего веб-сервера).

4. Вставьте скопированную строку (из шага 2) и сохраните файл crontab (Ctrl+O, затем Ctrl+X для nano-редактора).

### Windows

Для серверов Windows вы можете использовать запланированные задачи.


## Инструкции по конфигурации на основе вашего сервера

* [Конфигурация сервера Apache](apache-server-configuration.md).
* [Конфигурация сервера Nginx](nginx-server-configuration.md).
