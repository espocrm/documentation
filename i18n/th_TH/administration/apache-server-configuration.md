# การตั้งค่าเซิร์ฟเวอร์ Apache สำหรับ EspoCRM

คำแนะนำเหล่านี้ เป็นคำแนะนำเพิ่มเติมสำหรับ [Server Configuration] (server-configuration.md) โปรดทราบว่าการตั้งค่าทั้งหมดที่ระบุไว้ในที่นี้จะสร้างบนเซิร์ฟเวอร์ Ubuntu

## ข้อกำหนดของ PHP

เมื่อต้องการติดตั้งไลบรารีที่จำเป็นทั้งหมด ให้เรียกใช้คำสั่งเหล่านี้ใน terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## การแก้ไขปัญหา "API Error: EspoCRM API ที่ไม่พร้อมใช้งาน”:

ใช้เฉพาะขั้นตอนที่จำเป็นเท่านั้น หลังจากแต่ละขั้นตอนตรวจสอบว่าปัญหาได้รับการแก้ไขแล้ว

### 1. เปิดใช้งาน "mod_rewrite" ใน Apache

เพื่อเปิดใช้งาน “mod_rewrite,” ให้เรียกใช้คำสั่งเหล่านี้ใน terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. การเปิดใช้ การสนับสนุน . htaccess 

เพื่อเปิดใช้งาน การสนับสนุน .htaccess, เพิ่ม/แก้ไขการตั้งค่าการกำหนดค่าเซิร์ฟเวอร์/อื่นๆ/apache2/sites-available/ESPO_VIRTUAL_HOST.conf หรือ /อื่นๆ/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

หลังจากนั้น ให้เรียกใช้คำสั่งนี้ใน terminal:

```
sudo service apache2 restart
```

### 3. เพิ่มเส้นทาง RewriteBase

เปิดแฟ้มข้อมูล /ESPOCRM_DIRECTORY/api/v1/.htaccess และแทนที่ด้วยบรรทัดต่อไปนี้:

```
# RewriteBase /
```

กับ

```
RewriteBase /REQUEST_URI/api/v1/
```
REQUEST_URI เป็นส่วนหนึ่งของ URL เช่น สำหรับ "http://example.com/espocrm/" REQUEST_URI คือ "espocrm"

## การเปิดใช้งาน การสนับสนุน HTTP AUTHORISATION (เฉพาะ FastCGI)

FastCGI ไม่ได้สนับสนุน HTTP AUTHORIZATION โดยค่าเริ่มต้น ถ้าคุณใช้ FastCGI คุณต้องเปิดใช้งาน VirtualHost หรือ /etc/apache2/apache2.conf (httpd.conf) โดยการเพิ่มโค้ดต่อไปนี้:

สำหรับโมดูล Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

สำหรับโมดูล FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

หากต้องการตรวจสอบว่าโมดูลใด กำลังใช้งานอยู่ให้เรียกใช้คำสั่งนี้และค้นหาโมดูล:

```
apache2ctl -M
```
