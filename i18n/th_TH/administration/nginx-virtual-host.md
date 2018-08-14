# การกำหนดค่า Virtual Host บน Nginx สำหรับ EspoCRM

ในคู่มือนี้เราจะแสดงวิธีตั้งค่า virtual host บน Nginx สำหรับ EspoCRM บนเซิร์ฟเวอร์ Ubuntu

## สร้างไฟล์บล็อกเซิร์ฟเวอร์

ในการสร้างไฟล์นี้ ให้เปิด terminal และรันคำสั่ง: 

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

ตอนนี้ เปิดไฟล์นี้ (/etc/nginx/sites-available/espocrm.conf) และแก้ไขรหัสตามรูปแบบที่พิมพ์ด้านล่าง (การตั้งค่าบางอย่างอาจแตกต่างกันขึ้นอยู่กับการกำหนดค่าของคุณ):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Replace espocrm.local to your domain name
    root /var/www/html/espocrm; # Specify your EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL configuration
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    
 
    # Specify your PHP (php-cgi or php-fpm) based on your configuration
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # With php7.0-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Add rewrite rules
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

## การเปิดใช้งานบล็อกเซิร์ฟเวอร์นี้

สร้างสัญลักษณ์ลิงค์:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

เรียกใช้คำสั่งนี้ เพื่อที่จะตรวจสอบว่าทุกอย่างเรียบร้อยดีหรือไม่:

```
sudo nginx -t
```

และรีสตาร์ทเซิร์ฟเวอร์ Nginx:

```
sudo service nginx restart
```

## กำหนดค่าโฮสต์ ภายในเครื่องของคุณ (ไม่บังคับ, สำหรับโดเมนท้องถิ่นเท่านั้น)

ถ้าคุณเพิ่มโดเมนท้องถิ่น, คุณต้องกำหนดค่าในคอมพิวเตอร์ของคุณด้วย (ไม่ไช่บนเซิร์ฟเวอร์). สำหรับ Ubuntu, ให้เปิดไฟล์ `/etc/hosts` และเพิ่มบรรทัดนี้ลงไป:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

สำหรับ Windows, โปรดทำตามขั้นตอนเหล่านี้ [instructions](http://support.microsoft.com/kb/923947).
