# Configuração do servidor Nginx para EspoCRM

Estas instruções são suplementares às orientações [Configuração do Servidor](server-configuration.md). Por favor, nota que todas as configurações listadas aqui são feitas no servidor Ubuntu.

## Requerimentos de PHP

Para instalar todas as bibliotecas necessárias, executa estes comandos num terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Reparar o erro “API Error: EspoCRM API is unavailable”:

Segue apenas os passos necessários. Após cada passo, verifica se o problema foi resolvido.

### 1. Habilita sobrescrever regras no servidor Nginx

Adiciona este código para o arquivo de configuração do bloco do teu servidor Nginx (/etc/nginx/sites-available/SEU_SITE) dentro do bloco “server”:

```
server {   
    # ...
    
    client_max_body_size 50M;
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }
    
    location /portal/ {
        try_files $uri $uri/ /portal/index.php?$query_string;
    }

    location /api/v1/portal-access {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/portal-access/index.php last; break;
        }
    }
 
    location ~ /reset/?$ {
        try_files /reset.html =404;
    }
 
    location ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    location ^~ /data/logs/ {
        deny all;
    }
    location ^~ /data/\.backup/ {
        deny all;
    }
    location ^~ /data/config.php {
        deny all;
    }
    location ^~ /data/cache/ {
        deny all;
    }
    location ^~ /data/upload/ {
        deny all;
    }
    location ^~ /application/ {
        deny all;
    }
    location ^~ /custom/ {
        deny all;
    }
    location ^~ /vendor/ {
        deny all;
    }
    location ~ /\.ht {
        deny all;
    }
}
```

Se não possuis este arquivo, deves criá-lo. Para isso, abre um terminal e executa o comando:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Adiciona o código listado acima. Para mais informações em como configurar um novo Virtual Host em Nginx, por favor, lê este [guia](nginx-virtual-host.md).

Executa este comando num terminal para verificar se tudo está bem:

```
sudo nginx -t
```

Se estiver, executa o comando para reinicializar o servidor Nginx:

```
sudo service nginx restart
```

### 2. Adicionar o caminho RewriteBase

Abrir um arquivo /ESPOCRM_DIRECTORY/api/v1/.htaccess e substituir a seguinte linha:

```
# RewriteBase /
```
por 

```
RewriteBase /REQUEST_URI/api/v1/
```

onde, REQUEST_URI é uma parte de uma URL, por exemplo, para “http://exemplo.com/espocrm/”, REQUEST_URI é “espocrm”.
