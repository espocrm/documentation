# Configuração do servidor Apache para EspoCRM

Estas instruções são suplementares às orientações [Configuração do Servidor](server-configuration.md). Por favor, nota que todas as configurações listadas aqui são feitas num servidor Ubuntu.

## Requerimentos de PHP

Para instalar todas as bibliotecas necessárias, executa estes comandos num terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Reparando o erro “API Error: EspoCRM API is unavailable”:

Segue apenas os passos necessários. Após cada passo, verifica se o problema foi resolvido.

### 1. Habilitar o suporte “mod_rewrite” em Apache

Para habilitar “mod_rewrite,” executa estes comandos no terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Habilitar o suporte .htaccess

Para habilitar o suporte .htaccess, adiciona/edita as Configurações do Servidor /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf ou /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Em seguida, executa este comando num terminal:

```
sudo service apache2 restart
```

### 3. Adicionar o caminho RewriteBase

Abrir um arquivo /ESPOCRM_DIRECTORY/api/v1/.htaccess e substituir a seguinte linha:

```
# RewriteBase /
```

por

```
RewriteBase /REQUEST_URI/api/v1/
```

onde, REQUEST_URI é uma parte de uma URL, por exemplo, para “http://example.com/espocrm/”, REQUEST_URI é “espocrm”.


## Habilitar o suporte HTTP AUTHORIZATION (somente para FastCGI).

FastCGI não suporta HTTP AUTHORIZATION por padrão. Se tu usas FastCGI, tens que habilitar o teu VirtualHost ou /etc/apache2/apache2.conf (httpd.conf) adicionando o código:

Para o módulo Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Para o módulo FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Para verificar qual módulo está ser usado, executa este comando e encontre o módulo:

```
apache2ctl -M
```
