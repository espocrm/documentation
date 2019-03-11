# Конфигурация сервера Apache для EspoCRM

Эти инструкции являются дополнительными к руководству по  [Конфигурации сервера](server-configuration.md). Обратите внимание, что все перечисленные здесь параметры конфигурации выполняются на сервере Ubuntu.

## Требования PHP

Чтобы установить все необходимые библиотеки, выполните следующие команды в терминале:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-zip php-imap php-mbstring php-curl
sudo phpenmod imap mbstring
sudo service apache2 restart
```

## Исправление проблемы «Ошибка API: API EspoCRM недоступен»:

Принимайте только необходимые меры. После каждого шага проверяйте, решена ли проблема.

### 1. Включите поддержку «mod_rewrite» в Apache

Чтобы включить «mod_rewrite», выполните следующие команды в терминале:
```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Включите поддержку .htaccess

Чтобы включить поддержку .htaccess, добавьте/измените параметры конфигурации сервера /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf или /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Затем выполните эту команду в терминале:

```
sudo service apache2 restart
```

### 3. Добавьте путь RewriteBase

Откройте файл /ESPOCRM_DIRECTORY/api/v1/.htaccess и замените следующую строку:

```
# RewriteBase /
```

на

```
RewriteBase /REQUEST_URI/api/v1/
```

где REQUEST_URI является частью URL, например, для «http://example.com/espocrm/» REQUEST_URI - «espocrm».


## Включите поддержку HTTP AUTHORIZATION (только для FastCGI).

FastCGI по умолчанию не поддерживает HTTP AUTHORIZATION. Если вы используете FastCGI, вы должны включить её в VirtualHost или /etc/apache2/apache2.conf (httpd.conf), добавив следующий код:

Для модуля Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Для модуля FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Чтобы проверить, какой модуль используется в настоящее время, выполните эту команду и найдите модуль:

```
apache2ctl -M
```
