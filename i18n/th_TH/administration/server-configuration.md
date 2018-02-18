# การกำหนดค่าเซิร์ฟเวอร์สำหรับ EspoCRM

EspoCRM สามารถติดตั้งได้ที่ Apache ([instructions](apache-server-configuration.md)), Nginx ([instructions](nginx-server-configuration.md)), หรือเซิร์ฟเวอร์ IIS ที่สนับสนุน PHP เวอร์ชัน 5.6 หรือสูงกว่าและ MySQL เวอร์ชัน 5.1 หรือสูงกว่า

## คำแนะนำการกำหนดค่า

### PHP Requirements

EspoCRM ต้องใช้ PHP 5.6 หรือสูงกว่าโดยเปิดใช้งานส่วนขยายดังต่อไปนี้:

* [PDO](http://php.net/manual/en/book.pdo.php) – การเข้าถึง MySQL ใน PHP;
* [JSON](http://php.net/manual/en/book.json.php) – แหล่งข้อมูลใช้รูปแบบนี้ (metadata, รูปแบบ, ภาษา, และอื่นๆ);
* [GD](http://php.net/manual/en/book.image.php) – เพื่อจัดการรูปภาพ;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – เพื่อให้แน่ใจว่าการป้องกันสูงสุด;
* [Zip](http://php.net/manual/en/book.zip.php) – เพื่อให้สามารถอัพเกรด EspoCRM และติดตั้งส่วนขยายได้;
* [IMAP](http://php.net/manual/en/book.imap.php) – การตรวจสอบกล่องจดหมายใน EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

นอกจากนี้ยังแนะนำให้มี [mailparse](https://pecl.php.net/package/mailparse)การติดตั้งส่วนขยาย pecl จำเป็นสำหรับการทำงานของคุณลักษณะการเรียกดูอีเมลได้อย่างราบรื่น

php.ini settings:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### MySQL Requirements

EspoCRM สนับสนุน MySQL เวอร์ชั่น 5.1 หรือสูงกว่า
สิ่งเหล่านี้ไม่มีลักษณะพิเศษ การตั้งค่าเริ่มต้นทั้งหมดเหมาะสำหรับ EspoCRM

## สิทธิ์ที่จำเป็นสำหรับ Unix-based Systems

ไฟล์และ directories ควรมีสิทธิ์ดังต่อไปนี้  

* `/data`, `/custom`, `/client/custom` – ควรเป็นไฟล์ที่สามารถเขียนได้ทั้งหมด, directories และ subdirectories (664 สำหรับไฟล์, 775 สำหรับ directories, รวมทั้ง subdirectories และไฟล์ทั้งหมด);
* `/application/Espo/Modules`, `/client/modules` – ควรจะเขียน directory ปัจจุบัน (775 สำหรับ directory ปัจจุบัน, 644 สำหรับไฟล์, 755 สำหรับ directories และ subdirectories);
* ไฟล์และ directories อื่น ๆ ทั้งหมดควรอ่านได้ (644 สำหรับไฟล์, 755 สำหรับ directories).

ในการตั้งค่าสิทธิ์ ให้เรียกใช้คำสั่งเหล่านี้ใน terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

ไฟล์ทั้งหมดควรเป็นเจ้าของและเป็นเจ้าของกลุ่มโดยผ่านกระบวนการของเว็บเซิร์ฟเวอร์ ควรจะเป็น “www-data”, “daemon”, “apache”, “www”, อื่นๆ.  
หมายเหตุ: เมื่อใช้ Bitnami Stack, ไฟล์ควรเป็นเจ้าของและเป็นเจ้าของกลุ่มโดยผู้ใช้ "daemon"
หมายเหตุ: ในโฮสต์ที่ใช้ร่วมกัน ไฟล์ควรเป็นของเจ้าของและเป็นของกลุ่ม โดยบัญชีผู้ใช้ของคุณ

ในการตั้งค่าเจ้าของและเจ้าของกลุ่มทให้ดำเนินการคำสั่งเหล่านี้ใน terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## การตั้งค่า crontab

การติดตั้ง crontab บน UNIX system, สามารถทำตามขั้นตอนดังต่อไปนี้:

* 1. เข้าสู่ระบบในฐานะผู้ดูแลระบบใน EspoCRM instance ของคุณ
* 2. ไปที่ส่วนกำหนดงานในส่วนการจัดการระบบของคุณ (เมนู> การจักการ> งานที่กำหนดเวลาไว้ และคัดลอกสตริงสำหรับ crontab มีลักษณะดังนี้:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. เปิด terminal และเรียกใช้คำสั่งนี้:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER can be one of the following “www”, “www-data”, “apache”, etc (depends on your webserver).
* 4. วางสตริงที่คัดลอกไว้ (จากขั้นตอนที่  2) และบันทึกไฟล์ crontab (Ctrl+O, then Ctrl+X สำหรับ nano editor).

## คำแนะนำในการกำหนดค่าตามเซิร์ฟเวอร์ของคุณ:

* [Apache server configuration](apache-server-configuration.md).
* [Nginx server configuration](nginx-server-configuration.md).
