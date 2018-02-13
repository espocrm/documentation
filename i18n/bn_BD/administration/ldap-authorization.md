# Ldap অনুমোদন

এই গাইডে, আমরা EspoCRM এর জন্য LDAP অনুমোদন কীভাবে কনফিগার করব তা দেখাবো। চলো যাই।
আপনার LDAP সার্ভারে যান এবং EspoCRM ব্যবহারকারীদের জন্য বেস DN তৈরি করুন

```
cn=espo-users,ou=users,dc=espo,dc=local
```

ব্যবহারকারীদের DN এ অ্যাক্সেস থাকতে হবে এমন একটি সিস্টেম ব্যবহারকারী তৈরি করতে হবে (“cn=espo-users,ou=users,dc=espo,dc=local”)। সুতরাং, এই সিস্টেম ব্যবহারকারীর জন্য পূর্ণ DN হবে।
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
এখন, আমরা EspoCRM অ্যাক্সেস করতে LDAP ব্যবহারকারীকে যুক্ত করতে পারি। উদাহরণস্বরূপ ব্যবহারকারী নাম দিয়ে Espo পরীক্ষক “tester” ভিতরে “cn=espo-users,ou=users,dc=espo,dc=local” DN. দয়া করে মনে রাখবেন: EspoCRM এর জন্য এই লগইন ফরম্যাটটি ব্যবহার করতে সক্ষম হওয়ার জন্য, আপনাকে "Username Attribute" এবং "Base DN" বিকল্পগুলি নির্দিষ্ট করতে হবে।

তারপর, অ্যাডমিনিস্ট্রেটর প্যানেলে EspoCRM প্রমাণীকরণ সেটিংসে যান, নির্বাচন করুন `LDAP` পদ্ধতি এবং এলডিএপি বিস্তারিত পূরণ করুন:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP আইপি বা হোস্ট নাম।
* Port – সংযোগ পোর্ট।
* Auth – LDAP সার্ভারের জন্য প্রমাণপত্রাদি অ্যাক্সেস করুন:
* Full User DN – সম্পূর্ণ সিস্টেম ব্যবহারকারী DN যা অন্যান্য ব্যবহারকারীদের অনুসন্ধান করতে পারবেন।
* Password – LDAP সার্ভার অ্যাক্সেস পাসওয়ার্ড।
* Security – SSL বা TLS প্রোটোকল।
* Username Attribute – ব্যবহারকারীর সনাক্তকরণের বৈশিষ্ট্য সক্রিয় ডিরেক্টরি জন্য এটি হতে পারে “userPrincipalName” বা “sAMAccountName”।
* Account Canonical Form – আপনার অ্যাকাউন্ট ক্যানোনিকাল ফর্ম টাইপ 4 বিকল্প আছে:
* Dn – বিন্যাসে ফর্ম `CN=tester,CN=Espocrm,DC=company,DC=com`.
* Username – the form `tester`.
* Backslash – the form `COMPANY\tester`.
* Principal – the form `tester@company.com`.
* Bind Requires Dn – যদি ডিএন ফর্মের ইউজারনেম ফর্ম্যাট করার প্রয়োজন হয়
* Base Dn – ডিফল্ট বেস DN যা ব্যবহারকারীদের অনুসন্ধানের জন্য ব্যবহৃত হয়।
* User Login Filter – ফিল্টার যা ব্যবহারকারীদের EspoCRM ব্যবহার করতে সক্ষম সীমাবদ্ধ করতে পারবেন। উদাহরণস্বরূপ `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – ডোমেন যা অনুমোদন LDAP সার্ভারের জন্য ব্যবহৃত হয়।
* Account Domain Name Short – LDAP সার্ভার অনুমোদনের জন্য ব্যবহৃত ছোট ডোমেন।
* Try Username Split – ডোমেনের সাথে একটি ইউজারনেম বিভক্ত করার বিকল্প।
* Opt Referrals – যদি রেফারেলগুলি LDAP ক্লায়েন্টের সাথে অনুসরণ করা উচিত।
* Create User in EspoCRM – এই বিকল্পটি EspoCRM LDAP থেকে একটি ব্যবহারকারী তৈরি করতে সক্ষম করে।
* User First Name Attribute – LDAP অ্যাট্রিবিউট যা ব্যবহারকারী প্রথম নামটি নির্ধারণ করতে ব্যবহৃত হয়।
* User Last Name Attribute – LDAP অ্যাট্রিবিউট যা ব্যবহারকারীর নামটি নির্ধারণ করতে ব্যবহৃত হয়।
* User Title Attribute – LDAP অ্যাট্রিবিউট যা ব্যবহারকারীর শিরোনাম নির্ধারণ করতে ব্যবহৃত হয়
* User Email Address Attribute – LDAP অ্যাট্রিবিউট যা ব্যবহারকারীর ইমেইল অ্যাড্রেস নির্ধারণ করতে ব্যবহৃত হয়।
* User Phone Number Attribute – LDAP অ্যাট্রিবিউট যা ব্যবহারকারীর ফোন নম্বর নির্ধারণ করতে ব্যবহৃত হয়।
 
এখন, লগইন পৃষ্ঠাতে যান এবং ব্যবহারকারীর শংসাপত্রগুলি প্রবেশ করুন।

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

ব্যবহারকারী প্রমাণিত হয়েছে এবং স্বয়ংক্রিয়ভাবে EspoCRM এ তৈরি করা হয়েছে।

##আপনার সার্ভারের উপর ভিত্তি করে কনফিগারেশন নির্দেশাবলী:
* [Active Directory server](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

LDAP কনফিগার করার বিষয়ে আরো তথ্য আপনি এগুলি পড়তে পারেন [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/) পৃষ্ঠা, EspoCRM এই লাইব্রেরি ব্যবহার করে।
