# การให้สิทธิ์ Ldap

ในคู่มือนี้จะแสดงวิธีตั้งค่าการให้สิทธิ์ LDAP สำหรับ EspoCRM ไปกันเลย.

ไปที่ LDAP server ของคุณ และสร้างฐานของ DN สำหรับเชื่อมโยงผู้ใช้ EspoCRM เช่น
```
cn=espo-users,ou=users,dc=espo,dc=local
```

เราต้องสร้างระบบผู้ใช้ซึ่งจะมีสิทธิ์ในการเข้าถึง DN ของผู้ใช้ (“cn=espo-users,ou=users,dc=espo,dc=local”) ดังนั้น DN แบบเต็มรูปแบบ สำหรับผู้ใช้ระบบนี้จะเป็น
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
ตอนนี้, เราสามารถเพิ่มผู้ใช้ LDAP เพื่อเข้าถึง EspoCRM ได้ เช่น Espo Tester กับชื่อผู้ใช้ "tester" ภายใน “cn=espo-users,ou=users,dc=espo,dc=local” DN. โปรดทราบ: เพื่อให้สามารถใช้รูปแบบการเข้าสู่ระบบนี้สำหรับ EspoCRM คุณต้องระบุตัวเลือก "User Attribute" และ "Base DN"

หลังจากนั้น, ไปที่ EspoCRM  การตั้งค่าการตรวจสอบความถูกต้องในแผงผู้ดูแลระบบ, เลือก `LDAP` วิธีการและกรอกรายละเอียด LDAP:

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP หรือ ชื่อ host 
* Port – การเชื่อมต่อ port.
* Auth – เข้าถึงข้อมูลประจำตัวสำหรับเซิร์ฟเวอร์ LDAP :
 * Full User DN – DN ผู้ใช้ระบบเต็มรูปแบบซึ่งสามารถค้นหาผู้ใช้รายอื่นได้
 * Password – รหัสผ่านเพื่อเข้าใช้งานเซิร์ฟเวอร์ LDAP
* Security – SSL หรือ TSL protocol.
* Username Attribute –  attribute เพื่อระบุผู้ใช้ สำหรับ Active Directory อาจเป็น "userPrincipalName" หรือ "sAMAccountName"
* Account Canonical Form – ประเภทบัญชีของบัญชีของคุณ มี 4 ตัวเลือกดังต่อไปนี้
 * Dn – แบบฟอร์มในรูปแบบ `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – แบบฟอร์ม `tester`.
 * Backslash – แบบฟอร์ม `COMPANY\tester`.
 * Principal – แบบฟอร์ม `tester@company.com`.
* Bind Requires Dn – หากต้องการจัดรูปแบบชื่อผู้ใช้ในรูปแบบ DN
* Base Dn – ฐาน DN เริ่มต้นซึ่งใช้สำหรับค้นหาผู้ใช้
* User Login Filter – ตัวกรองซึ่งอนุญาตให้ จำกัดผู้ใช้ที่สามารถใช้ EspoCRM ได้ เช่น. `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – โดเมนที่ใช้สำหรับการให้สิทธิ์เซิร์ฟเวอร์ LDAP
* Account Domain Name Short – โดเมนสั้น ๆ ที่ใช้สำหรับการให้สิทธิ์เซิร์ฟเวอร์ LDAP
* Try Username Split – ตัวเลือกในการแบ่งชื่อระหว่างผู้ใช้กับโดเมน
* Opt Referrals – ถ้าการแนะนำผลิตภัณฑ์ควรปฏิบัติตาม
   LDAP client
* Create User in EspoCRM – ตัวเลือกนี้อนุญาตให้ EspoCRM สร้างผู้ใช้จาก LDAP
 * User First Name Attribute – LDAP attribute ที่ใช้เพื่อระบุชื่อผู้ใช้
 * User Last Name Attribute – LDAP attribute ที่ใช้เพื่อระบุนามสกุลผู้ใช้
 * User Title Attribute – LDAP attribute ซึ่งใช้เพื่อระบุหัวข้อของผู้ใช้
 * User Email Address Attribute – LDAP attribute ซึ่งใช้เพื่อระบุที่อยู่อีเมลของผู้ใช้
 * User Phone Number Attribute – LDAP attribute ซึ่งใช้เพื่อระบุเบอร์โทรศัพท์ของผู้ใช้

ตอนนี้, ไปที่หน้าเข้าสู่ระบบและระบุข้อมูลรับรองผู้ใช้

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-login.png)

ผู้ใช้ได้รับการตรวจสอบสิทธิ์และสร้างขึ้นโดยอัตโนมัติใน EspoCRM

## คำแนะนำการตั้งค่าตามเซิร์ฟเวอร์ของคุณ:
* [Active Directory server](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

ข้อมูลเพิ่มเติมเกี่ยวกับการกำหนดค่า LDAP คุณสามารถอ่านได้ที่ [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/) เนื่องจาก EspoCRM ใช้ห้องสมุดนี้




