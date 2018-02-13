# Configurar um Host Virtual em Nginx para EspoCRM

Neste guia, nós vamos mostrar como configurar um host virtual em Nginx para EspoCRM no servidor Ubuntu.

## Cria um arquivo de bloco do servidor

Para criares este arquivo, abre o terminal e executa o comando:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Agora, abre este arquivo (/etc/nginx/sites-available/espocrm.conf) e modifica o código seguindo o formato mostrado abaixo (algumas configurações podem ser diferentes baseadas na configuração do teu servidor):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Substitui espocrm.local pelo nome do teu domínio
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

## Habilitar o bloco deste servidor

Cria uma ligação simbólica:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Executa este comando para verificar se está tudo certo:

```
sudo nginx -t
```

E reinicializa o servidor Nginx:

```
sudo service nginx restart
```

## Configura os teus hosts locais (opcional, somente para um domínio local)

Se adicionaste um domínio local, deves configurá-lo no teu computador local (não no servidor). Para Ubuntu, abre o arquivo `/etc/hosts` e adiciona esta linha:

```
192.168.1.1 espocrm.local  # especifica o endereço de IP do teu servidor Nginx
```

Para Windows, por favor, siga essas [instruções](http://support.microsoft.com/kb/923947).
