# การสำรองข้อมูล และการคืนค่า

## วิธี การสำรองข้อมูล EspoCRM ด้วยตนเอง

EspoCRM ประกอบด้วย แฟ้มข้อมูลและฐานข้อมูล จำเป็นต้องมีข้อมูลทั้งหมด เพื่อสร้างการสำรองข้อมูลเต็มรูปแบบของ EspoCRM นี่คือคำแนะนำเกี่ยวกับวิธีการทำบนเซิร์ฟเวอร์ Ubuntu กับ MySQL

### ขั้นตอน ที่ 1. การสำรองข้อมูลไฟล์

สร้างที่เก็บถาวรของเนื้อหา directory ของ EspoCRM ที่ติดตั้งไว้ สำหรับ Ubuntu เส้นทางเริ่มต้นคือ `/ var / www / html` คุณสามารถใช้คำสั่งนี้:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### ขั้นตอน ที่ 2. การสำรองข้อมูล ฐานข้อมูล

เพื่อที่จะสำรองข้อมูลทั้งหมดของคุณ คูณต้องรู้ชื่อของ ฐานข้อมูล และ ข้อมูล ที่รับรองการเข้าถึง คุณสามารถค้นหาชื่อของ ฐานข้อมูลในการตั้งค่าไฟล์
`/ESPOCRM_DIRECTORY/data/config.php` ภายใต้หัวข้อ `database`คุณสามารถใช้คำสั่งนี้ เพื่อสำรองฐานข้อมูล ของคุณ:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### ขั้นตอน ที่ 3. คัดลอกการสำรองข้อมูล

นั่นคือทั้งหมด ตอนนี้ คุณต้องคัดลอก การสำรองข้อมูล เพื่อสร้างไว้ในที่ปลอดภัย

## วิธีการสำรองข้อมูล EspoCRM ด้วยต้นฉบับ

คุณสามารถใช้ต้นฉบับ เพื่อสำรองข้อมูลทั้งหมด ที่คุณต้องการ เข้าสู่ระบบ ผ่านทาง SSH และ รันคำสั่ง (ทดสอบบนเซิร์ฟเวอร์ Ubuntu)
### ดาวน์โหลดต้นฉบับ

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### เรียกใช้ต้นฉบับ

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
ที่ไหน
 * `PATH_TO_ESPOCRM` เป็นเส้นทาง ไปถึงการติดตั้ง EspoCRM director 
 * `BACKUP_PATH` เป็นเส้นทางไปถึง การสำรองข้อมูล directory

สำหรับ เซิร์ฟเวอร์ Ubuntu มันคือ :

```bash
bash ./backup.sh /var/www/html /opt/backups
```

หมายเหตุ: ถ้าหากผู้ใช้ MySQL ไม่จำเป็นต้องถ่ายโอนข้อมูลฐานข้อมูลของคุณ คุณจะได้รับพร้อมท์ ให้ใส่ข้อมูลรับรองของผู้ใช้ MySQL รายอื่น

หลังจาก สร้างเสร็จเรียบร้อยแล้ว คุณจะได้เส้นทาง เพื่อไปยังการสำรองข้อมูลที่สร้างไว้

## การ คืนค่า EspoCRM จาก การสำรองข้อมูล

คุณสามารถคืนค่า EspoCRM จาก การสำรองข้อมูล ที่สร้างไว้ ตามที่ได้ อธิบายไว้ข้างต้น

### ขั้นตอน ที่ 1. ยกเลิกการเก็บสำรองข้อมูล

เพื่อยกเลิกการเก็บไฟล์ข้อมูล คุณสามารถใช้ Archive Manager หรือเรียกใช้ คำสั่งด้านล่างได้ ไฟล์ต้องอยู่ใน เว็บเซิร์ฟเวอร์ directory

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
ที่ไหน:
 * `/var/www/html` ในเว็บเซิร์ฟเวอร์ directory

### ขั้นตอน ที่ 2. ตั้งค่าสิทธิ์ที่จำเป็น

ไฟล์ ควรเป็นของผู้ใช้ เว็บเซิร์ฟเวอร์ และมีสิทธิ์ที่ถูกต้อง โปรดตั้งค่าสิทธิ์ที่จำเป็น โดยปฏิบัติตาม คำแนะนำนี้:
[www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### ขั้นตอน ที่ 3 การนำเข้า ถ่ายโอนฐานข้อมูล

การถ่ายโอนฐานข้อมูล ควร ถ่ายโอนมา ยัง ฐานข้อมูล เดียวกัน ด้วยข้อมูล รับรองผู้ใช้ เดียวกัน มิฉะนั้น จะต้องมีการแก้ไข ในการตั้งค่าไฟล์ 
`ESPOCRM_DIRECTORY/data/config.php` เมื่อ ต้องการนำเข้า ฐานข้อมูลของคุณจาก การถ่ายโอน ให้เรียกใช้คำสั่ง ด้านล่างใน terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### ขั้นตอน ที่ 4. การตรวจสอบ / การ กำหนดค่า crontab

Check if your crontab is configured properly. Run the command below and check if a path to EspoCRM is correct:
ตรวจสอบว่า crontab ของคุณ ได้รับการกำหนดค่าอย่างถูกต้องหรือไม่ เรียกใช้ ตามคำสั่งด้านล่างและตรวจสอบเส้นทางไปยัง EspoCRM ว่าถูกต้องหรือไม่:

```bash
sudo crontab -l -u www-data
```
ที่ไหน:
 * `www-data` คือ ผู้ใช้เว็บเซิร์ฟเวอร์ของคุณ

ถ้าคุณต้องทำการเปลี่ยนแปลง อื่น ๆ ให้ใช้คำสั่ง ดังนี้:

```bash
sudo crontab -l -u www-data
```
รายละเอียด เพิ่มเติม เกี่ยวกับการกำหนดค่า crontab สำหรับ EspoCRM ได้อธิบายไว้ ที่นี้[www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
