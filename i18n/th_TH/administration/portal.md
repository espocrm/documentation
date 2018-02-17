# Portal

Portal ให้ความสามารถในการเข้าถึงข้อมูลเฉพาะเจาะจงและฟังก์ชัน crm สำหรับลูกค้าและคู่ค้าของคุณ ผู้ดูแลระบบสามารถสร้าง portal ได้หลายแบบ  แต่ละ portal สามารถตั้งค่าได้เอง, dashlboard, รายชื่อผู้ใช้, การตั้งค่าควบคุมการเข้าใช้งาน

เพื่อสร้าง portal ผู้ดูแลระบบ > Portals, คลิกที่ปุ่มสร้าง Portal 

* `Is Active`. ถ้าไม่ตรวจสอบ Portal จะไม่สามารถใช้ได้สำหรับทุกคน
* `Is Default`.หมายความว่า portal จะพร้อมใช้งานโดยที่ URL สั้นกว่า: http (s): // YOUR_ESPO_URL / portal.
* `Roles`. ระบุบทบาทหนึ่ง หรือ portal หลายบทบาท  ที่จะใช้กับผู้ใช้ที่ล็อกอินเข้าสู่ portal  ข้อมูลเพิ่มเติมเกี่ยวกับบทบาทของ portal อยู่ด้านล่าง
* `Tab List`. แท็บที่จะปรากฏในแถบ navigation 
* `Dashboard Layout`. ระบุ dashlets ที่จะแสดงในโฮมเพจของ portal. โปรดทราบว่าผู้ใช้ portal ไม่สามารถกำหนดค่า dashboard ได้
* `URL`. อ่านแค่ field อย่างเดียว ที่จะแสดงลิงก์ที่คุณสามารถเข้าถึงด้วย portal 

## ผู้ใช้ Portal 

ผู้ดูแลระบบสามารถสร้างผู้ใช้ portal ได้

1. ผู้ดูแลระบบ > ผู้ใช้.
2. คลิกเมนูแบบเลื่อนลงด้านขวาถัดจากสร้างผู้ใช้.
3. คลิกสร้างผู้ใช้ Portal
4. เลือกติดต่อผู้ใช้ portal จะเชื่อมโยงด้วย
5. กรอกแบบฟอร์มและคลิกบันทึก

 ผู้ใช้ Portal ควรเชื่อมโยงกับบันทึก Portal เพื่อให้สามารถเข้าถึง Portal ดังกล่าวได้

## บทบาท Portal 

บทบาทของ Portal คล้ายคลึงกับบทบาทปกติใน EspoCRM แต่มีความแตกต่างเล็กน้อย

* `not-set` ระดับปฏิเสธการเข้าถึง
* `own` ระดับหมายความว่าบันทึกถูกสร้างขึ้นโดยผู้ใช้ เช่น  ผู้ใช้ portal ได้ระบุบางกรณีและกรณีนี้เป็นของผู้ใช้รายนี้
* `account` ระดับหมายความว่าบันทึกเกี่ยวข้องกับบัญชีและผู้ใช้ portal รายนี้ เกี่ยวข้องกับบัญชีเหมือนกัน
* `contact` ระดับหมายความว่าบันทึกเกี่ยวข้องกับรายชื่อผู้ติดต่อ portal ที่เกี่ยวข้อง

 fields ผู้ใช้และทีม ที่ได้รับมอบหมายจะอ่านเฉพาะสำหรับผู้ใช้ portal เท่านั้น

### ตัวอย่าง

`Portal users should be able to create cases, view cases related to their account; they should be able to view knowledge base.`

1. เปิดแบบฟอร์มบทบาท Portal (ผู้ดูแล > บทบาท Portal  > สร้างบทบาท).
2.เปิดใช้งานการเข้าถึง Cases, การตั้งค่า: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. เปิดใช้งานการเข้าถึงฐานความรู้,การตั้งค่า `create - no, read - account, edit - no, delete - no`.
4. แก้ไขบันทึก Portal ของคุณ (ผู้ดูแล > Portals)เลือกบทบาท Portal ของคุณ ในช่องบทบาทแล้วเลือกบันทึก

## การเข้าถึง Portal

คุณสามารถค้นหา url สำหรับ portal ของคุณได้ในฟิลด์ 'URL' บันทึกของ portal นอกจากนี้คุณยังสามารถใช้เครื่องมือในกำหนดค่าเซิร์ฟเวอร์ (เช่น mod_rewrite) เพื่อให้สามารถเข้าถึงได้โดยใช้ URL อื่นๆ ในกรณีนี้คุณต้องกรอกข้อมูลในฟิลด์ 'URL ที่กำหนดเอง'

### การเข้าถึง portal โดย URL ที่กำหนดเอง สำหรับ Apache server

Custom URL: my-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName my-portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias my-portal-host-name.com

```

#### Mod rewrite rules

ระบุรหัส portal record แทนที่ `{PORTAL_ID}` รหัส Portal record สามารถใช้ได้ในแถบที่อยู่เว็บของคุณเมื่อคุณเปิดมุมมองรายละเอียดของ portal record เช่น: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 คือรหัส portal record 

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
