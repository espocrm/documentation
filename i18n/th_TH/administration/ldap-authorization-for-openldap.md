# LDAP อนุมัติ สำหรับ OpenLDAP

ตัวอย่าง ของการกำหนดค่า LDAP อนุมัติ สำหรับ เซิร์ฟเวอร์ OpenLDAP  คำอธิบายฉบับเต็มของการกำหนดค่า LDAP การกำหนดค่าจะได้รับการอธิบาย [ที่นี้](ldap-authorization.md).

```
Host: espo.local
Port: 389
Full User DN: cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
รหัสผ่าน : ******
Username Attribute: uid
User ObjectClass: inetOrgPerson
Account Canonical Form: Dn
Bind Requires DN: ใช่
ฐานข้อมูล DN: cn=espo-users,ou=users,dc=espo,dc=local
สร้างผู้ใช้ใน EspoCRM: ใช่
คุณลักษณะ ชื่อจริง ของผู้ใช้: ชื่อจริง
คุณลักษณะ นามสกุล ของผู้ใช้ : นามสกุล
คุณลักษณะ หัวข้อ ของผู้ใช้: หัวข้อ
คุณลักษณะ อีเมล ของผู้ใช้: อีเมล
คุณลักษณะ หมายเลขโทรศัพท์ของผู้ใช้ : เบอร์โทรศัพท์
```

![1](../_static/images/administration/ldap-authorization/ldap-configuration-for-openldap.png)
