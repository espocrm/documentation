# Configuracion del servidor Apache para EspoCRM

Estas instrucciones son complementarias a la guia de [Configuration de servidor](server-configuration.md). Por favor tome en cuenta que toda configuracion listada aqui esta hecha en un servidor Ubuntu.

## Requerimientos PHP

Para instalar todas las librerias necesarias, ejecute estos comandos en el terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Arreglando el problema “API Error: EspoCRM API is unavailable”:

Tome solo los pasos necesarios. Despues de cada paso, verifique si el error ha sido resuelto.

### 1. Habilitar el soporte "mod_rewrite" en Apache

Para habilitar "mod_rewrite", ejecute estos comandos en el terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Habilitar el soporte .htaccess

Para habilitar el soporte .htaccess, agregue/edite la configuracion de Servidor /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf o /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Después, ejecute este comando en el terminal:

```
sudo service apache2 restart
```

### 3. Agregue la ruta RewriteBase

Abra el archivo /ESPOCRM_DIRECTORY/api/v1/.htaccess y reemplace la siguiente linea:

```
# RewriteBase /
```

con

```
RewriteBase /REQUEST_URI/api/v1/
```

Donde REQUEST_URI es la parte del URL, Es decir, para “http://example.com/espocrm/”, REQUEST_URI es “espocrm”.


## Habilitar el soporte de Autorizacion HTTP (solo para FastCGI).

FastCGI no suporta la autorizacion HTTP por defecto. Si tu usas FastCGI, tu tienes que habilitarlo en tu VirtualHost o /etc/apache2/apache2.conf (httpd.conf) agregando el siguiente codigo:

Para el módulo Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Para el módulo FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Para verificar que modulo esta siendo usado actualmente, ejecute este comando y encuentre el modulo:

```
apache2ctl -M
```
