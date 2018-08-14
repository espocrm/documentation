# EspoCRM için Nginx sunucu yapılandırması

Bu talimatlar, [Sunucu Yapılandırması] (server-configuration.md) yönergesine tamamlayıcıdır. Lütfen Burada listelenen tüm yapılandırma ayarlarının Ubuntu sunucusunda yapıldığını unutmayınız.

## PHP Gereksinimleri

Gerekli tüm kütüphaneleri kurmak için bu komutları bir terminalde çalıştırınız:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## "API Hatası: EspoCRM API'sı kullanılamıyor" sorunu giderildi:

Gerekli adımları atınız. Her adımın ardından sorunun çözülüp çözülmediğini kontrol ediniz.

### 1. Nginx Sunucusunda yeniden yazma kurallarını etkinleştirin

Bu kodu, "sunucu" bloğundaki Nginx sunucu bloğu yapılandırma dosyanıza (/etc/nginx/sites-available/YOUR_SITE) ekleyiniz:

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

Bu dosyaya sahip değilseniz onu oluşturmanız gerekmektedir. Bunun için bir terminal açın ve aşağıdaki komutu çalıştırınız:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Ve yukarıda listelenmiş kodu ekleyiniz. Yeni bir Sanal Ana Makinayı Nginx'te nasıl yapılandıracağınız hakkında daha fazla bilgi için lütfen bu [yönerge] (nginx-virtual-host.md) dosyasını okuyunuz.

Her şeyin yolunda olup olmadığını kontrol etmek için bu komutu bir terminalde çalıştırınız:

```
sudo nginx -t
```

Eğer öyleyse, nginx sunucusunu başlatmak için komutu çalıştırınız:

```
sudo service nginx restart
```

### 2. Temel Yeniden yazma yolunu ekle

/ESPOCRM_DIRECTORY/api/v1/.htaccess dosyasını açınız ve aşağıdaki satırı değiştiriniz:

```
# RewriteBase /
```
ile 

```
RewriteBase /REQUEST_URI/api/v1/
```

Nerede REQUEST_URI, URL'nin bir parçasıdır; örneğin. "http://example.com/espocrm/" için REQUEST_URI "espocrm" dir.

