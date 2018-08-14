# Configurando um Host Virtual em Nginx para EspoCRM

Nesse guia, nós vamos mostrar como configurar um host virtual em Nginx para EspoCRM em servidor Ubuntu.

## Crie um arquivo de bloco do servidor

Para criar esse arquivo, abra o terminal e execute o comando:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Agora, abra esse arquivo (/etc/nginx/sites-available/espocrm.conf) e modifique o código seguindo o formato mostrado abaixo (algumas configurações podem ser diferentes baseadas na configuração do seu servidor):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Substitua espocrm.local pelo nome de seu domínio
    root /var/www/html/espocrm; # Especifique a raiz do documento de seu EspoCRM
 
    index index.php index.html index.htm;
 
    # Configuração SSL
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    
 
    # Especificar seu PHP (php-cgi or php-fpm) baseado em suas configurações
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # Com apenas o php7.0-cgi:
        # fastcgi_pass 127.0.0.1:9000;
 
        # Com o php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Adicionar sobrescrever regras
    location / {
        try_files $uri $uri/ =404;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
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

## Habilitar o bloco desse servidor

Crie uma ligação simbólica:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Execute esse comando para verificar se tudo está certo:

```
sudo nginx -t
```

E reinicialize o servidor Nginx:

```
sudo service nginx restart
```

## Configure seus hosts locais (opcional, somente para um domínio local)

Se você adicionou um domínio local, você deve configurá-lo em seu computador local (não no servidor). Para Ubuntu, abra o arquivo `/etc/hosts` e adicione essa linha:

```
192.168.1.1 espocrm.local  # especifique o endereço de IP do seu servidor Nginx
```

Para Windows, por favor, siga essas [instruções](http://support.microsoft.com/kb/923947).
