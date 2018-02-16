# การย้าย EspoCRM ไปยังเซิร์ฟเวอร์เครื่องอื่นๆ

ทำตามขั้นตอนต่อไปนี้เพื่อย้าย EspoCRM ไปยังเซิร์ฟเวอร์เครื่องอื่น:

### ขั้นตอนที่ 1. สำรองข้อมูลไฟล์

เปิดตัวจัดการไฟล์หรือเข้าสู่ระบบผ่าน SSH เพื่อเก็บไฟล์ทั้งหมดที่มีอยู่จาก directory EspoCRM รายละเอียดเพิ่มเติม: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### ขั้นตอนที่ 2. สำรองฐานข้อมูลของคุณ

ข้อมูลที่จัดเก็บในฐานข้อมูล (MySQL, MariaDB) ควรได้รับการสำรองข้อมูล โปรดปฏิบัติตามคำแนะนำดังนี้:https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### ขั้นตอนที่ 3. คัดลอกไฟล์และการสำรองฐานข้อมูลไปยังเซิร์ฟเวอร์เครื่องอื่น

คัดลอกการสำรองข้อมูลของไฟล์และฐานข้อมูลของคุณไปยังเซิร์ฟเวอร์ใหม่

### ขั้นตอนที่ 4 ยกเลิกการเก็บสำรองข้อมูล

หากต้องการยกเลิกการเก็บไฟล์สำรองข้อมูล คุณสามารถใช้ Archive Manager หรือตามคำแนะนำดังนี้ได้: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
หมายเหตุ: ไฟล์ต้องอยู่ใน directory เว็บเซิร์ฟเวอร์ 

### ขั้นตอนที่ 5. การกำหนดค่าเซิร์ฟเวอร์

กำหนดค่าเซิร์ฟเวอร์ใหม่ตามคำแนะนำ ที่นี่: https://www.espocrm.com/documentation/administration/server-configuration/.

### ขั้นตอนที่ 6 สิทธิ์ที่ถูกต้อง

การตั้งค่าสิทธิ์และเจ้าของไฟล์, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### ขั้นตอนที่ 7 การนำเข้าการสำรองฐานข้อมูลของคุณ

เริ่มต้น, คุณต้องสร้างฐานข้อมูลใหม่กับผู้ใช้ใน MySQL เมื่อต้องการนำเข้าฐานข้อมูลของคุณจากข้อมูลสำรองให้ทำตามคำแนะนำดังนี้: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### ขั้นตอนที่ 8 การกำหนดค่า EspoCRM ที่ถูกต้อง

หลังจากประสบความสำเร็จในการนำเข้าและกำหนดค่าเซิร์ฟเวอร์ โปรดแก้ไขการกำหนดค่า EspoCRM ในไฟล์ `ESPOCRM_DIRECTORY/data/config.php`:

 * การตั้งค่าการเชื่อมต่อฐานข้อมูล:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - ถ้าชื่อโดเมนของคุณ (URL) มีการเปลี่ยนแปลง:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * เจ้าของไฟล์เริ่มต้น (เฉพาะในกรณีที่ต่างกัน):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  โดยที่ `www-data` เป็นผู้ใช้เว็บเซิร์ฟเวอร์ของคุณ

### ขั้นตอนที่ 9. ตั้งค่า crontab

ตั้งค่า crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
หมายเหตุ: ควรกำหนดค่าภายใต้ผู้ใช้เว็บเซิร์ฟเวอร์ของคุณ

นั่นคือทั้งหมด ตอนนี้ EspoCRM instance  ของคุณกำลังทำงานบนเซิร์ฟเวอร์เครื่องใหม่ 
