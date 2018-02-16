# การกำหนดค่าเซิร์ฟเวอร์ Nginx สำหรับ EspoCRM

คำแนะนำเหล่านี้เป็นส่วนเสริมของ [Server Configuration](server-configuration.md) ข้อแนะนำ โปรดทราบว่าการตั้งค่าทั้งหมดที่ระบุไว้ในที่นี้ สามารถทำได้บนเซิร์ฟเวอร์ Ubuntu 

## ข้อกำหนด PHP 

การติดตั้งไลบรารีที่จำเป็นทั้งหมด, เรียกใช้คำสั่งเหล่านี้ใน terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## การแก้ไขปัญหา "ข้อผิดพลาด API: EspoCRM API ที่ไม่พร้อมใช้งาน”:

ใช้ขั้นตอนที่จำเป็นเท่านั้น หลังจากแต่ละขั้นตอนให้ตรวจสอบว่าปัญหาได้รับการแก้ไขแล้วหรือยัง

### 1. การเปิดใช้งานกฎการเขียนใหม่ในเซิร์ฟเวอร์ Nginx

ให้เพิ่มรหัสนี้ลงในไฟล์ config ของเซิร์ฟเวอร์ Nginx (/etc/nginx/sites-available/YOUR_SITE) ภายใน “server” บล็อก:

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

หากคุณไม่มีไฟล์นี้ คุณต้องสร้างไฟล์ สำหรับการเปิด terminal นี้และเรียกใช้คำสั่ง:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

และเพิ่มรหัสที่ระบุข้างต้น สำหรับข้อมูลเพิ่มเติมเกี่ยวกับวิธีการกำหนดค่า Virtual Host ใหม่บน Nginx, โปรดอ่านที่นี้ [ guideline](nginx-virtual-host.md).

เรียกใช้คำสั่งนี้ใน terminal เพื่อตรวจสอบว่าทุกอย่างเรียบร้อยดีหรือไม่:

```
sudo nginx -t
```

ถ้าใช่ ให้เรียกใช้คำสั่งเพื่อรีสตาร์ทเซิร์ฟเวอร์ nginx:

```
sudo service nginx restart
```

### 2. เพิ่ม RewriteBase path

เปิดไฟล์ /ESPOCRM_DIRECTORY/api/v1/.htaccess และแทนที่ด้วยบรรทัดต่อไปนี้:
```
# RewriteBase /
```
กับ 

```
RewriteBase /REQUEST_URI/api/v1/
```

ที่ REQUEST_URI เป็นส่วนหนึ่งของ URL เช่น สำหรับ “http://example.com/espocrm/”, REQUEST_URI คือ “espocrm”.
