# การติดตั้ง

### ข้อกำหนด
EspoCRM ทำงานกับ ผู้ให้บริการโฮสติ้งที่มากที่สุด โดยมี ข้อกำหนดรวม ๆ ดังต่อ ไปนี้:

* PHP 5.6 หรือ เวอร์ชั่น รุ่นล่าสุด ของ PHP กับ pdo ที่เปิดใช้งาน, json, GD library, mcrypt extensions (โดยปกติ มักจะเปิดใช้งานตาม ค่าเริ่มต้น);
* MySQL 5.5.3 หรือ สูงกว่า.

ดู [Server Configuration](server-configuration.md) บทความสำหรับข้อมูลเพิ่มเติม

### 1. ดาวน์โหลดแพ็คเกจการติดตั้ง EspoCRM
เพื่อ รับเวอร์ชันล่าสุดของ EspoCRM ติตาม [download page](http://www.espocrm.com/download/) ลิงค์.

### 2. อัปโหลดไฟล์ EspoCRM ไปยัง เซิร์ฟเวอร์ของคุณ

เมื่อ การดาวน์โหลดเสร็จสิ้น ให้อัพโหลดแพคเกจไปยัง เว็บเซิร์ฟเวอร์ของคุณ 
หากต้องการอัพโหลด คุณสามารถใช้ SSH, FTP หรือ โฮสติ้งของแผงการบริหาร
แยกเก็บข้อมูล ไปยังเว็บเซิร์ฟเวอร์ สาธารณะของคุณ (เช่น, `public_html`, `www`, etc.).

_หมายเหตุ: สำหรับ FTP คุณต้องแยกที่เก็บข้อมูลก่อน ที่จะอัปโหลดไปยัง เว็บเซิร์ฟเวอร์ของคุณ._

### 3. สร้างฐานข้อมูล MySQL สำหรับ EspoCRM เพื่อใช้งาน

ไปที่ แผงการดูแล ระบบโฮสติ้งของคุณ, หรือ ไปที่ SSH, และ สร้างฐานข้อมูลใหม่ และ ผู้ใช้ สำหรับ EspoCRM (เช่น, `MySQL Databases` ใน cPanel).

### 4. เรียกใช้กระบวนการติดตั้ง EspoCRM

ตอนนี้, เปิดเว็บเบราเซอร์ของคุณ, และ ไปที่ URL กับ EspoCRM ไฟล์ (เช่น, `http://yourdomain.com/espo`).

หาก คุณเห็นหน้าจอนี้ คุณมี "Permission denied" ผิดพลาด. 
ดังนั้น, คุณต้องดำเนินการตาม คำสั่งที่แสดงใน terminal โดยผ่านทาง SSH, หรือ ติดตั้ง permission ที่ถูกต้อง  
มันควรจะเป็น 755 สำหรับ directories, 644 สำหรับ ไฟล์, และ 775 สำหรับ `data` directory. 
และตรวจสอบให้แน่ใจว่าคุณมีข้อมูลถูกต้อง _owner_ and _group_.

![1](../_static/images/administration/installation/1.png)

หากคุณเห็นหน้าจอต่อไปนี้, สิทธิ์ permission ถูกต้องและคุณสามารถเริ่มติดตั้ง EspoCRM ได้

![2](../_static/images/administration/installation/2.png)

ในหน้านี้คุณสามารถอ่านและยอมรับข้อตกลงในใบอนุญาต

![3](../_static/images/administration/installation/3.png)

ระบุรายละเอียดสำหรับฐานข้อมูล MySQL ที่จะสร้างขึ้นใหม่

![4](../_static/images/administration/installation/4.png)

ระบุชื่อผู้ใช้และรหัสผ่านของผู้ดูแล EspoCRM

![5](../_static/images/administration/installation/5.png)

ในหน้านี้คุณสามารถตั้งค่าเริ่มต้นของ EspoCRM, เช่น รูปแบบ วันที่ และ เวลา , เขตเวลา , สกุลเงิน และอื่น ๆ 

![6](../_static/images/administration/installation/6.png)

ระบุ การตั้งค่า SMTP สำหรับอีเมลขาออก, ถ้าคุณต้องการมีความสามารถในการส่งอีเมล

ขั้นตอนนี้ สามารถข้ามได้ด้วย การคลิกที่ปุ่ม _Next_  
ตัวเลือกทั้งหมด เหล่านี้สามารถเพิ่ม / แลกเปลี่ยนใน EspoCRM หลังจาก ทำการติดตั้งแล้วได้ด้วย

![7](../_static/images/administration/installation/7.png)

การแสดงความยินดี! การติดตั้งเสร็จสมบูรณ์แล้ว
สิ่งสุดท้ายที่จะตั้งค่า Scheduled Tasks ให้ระบบ ของคุณดำเนินการ สามารถ ทำได้ โดยการเรียกใช้`crontab -e` ใน linux cli และ ใน _Windows Tasks Scheduler_ ใน ระบบ Windows 

![8](../_static/images/administration/installation/8.png)

เราหวังว่าคุณจะสนุกกับการทำงานใน EspoCRM.







