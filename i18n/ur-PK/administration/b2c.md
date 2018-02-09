

#Configuring EspoCRM for B2C (Business-to-Client)
#ایسپو سی آر ایم (نظام برائے تعلقاتِ صارف) کو بزنس-ٹو-کلائنٹ (کاروبار-سے-صارف) کے مطابق تشکیل دینا

By default EspoCRM is configured to use for B2B business. But you can easily setup it for B2C.
ڈیفالٹ میں ایسپو سی آر ایم  کاروبار-سے-کاروبار طرز پر استعمال کےلیے تشکیل دیا گیا ہوتا ہے، مگر آپ اسے آسانی سے کاروبار-سے-صارف کے مطابق ترتیب دے سکتے ہیں۔ 

    Change b2cMode to true in your config file data/config.php. Since version 4.3.0 it can be configured at Administration > Seetings.
    Remove Account tab from the navigation menu (Administration > User Interface).
    Remove Account fields from your layouts (Administation > Layout Manager).
    Disable an access to Account scope for all your roles (Administration > Roles).
    Remove Account from picklists of all parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).

b2cMode کو اپنی تشکیلی فائل data/config.php. میں ‘true” کیجئے۔ تاہم 4.3.0 ورژن سے یہ Administration > Seetings. میں بھی ترتیب دی جاسکتی ہے۔
•	Account  ٹیب کو نیوی گیشن مینو سے ہٹائیے (Administration > User Interface).
•	Account  شعبے کو اپنی لے آؤٹ تتیبات سے ہٹائیے (Administation > Layout Manager).
•	 اپنے رولز کےلیےAccount  تک رسائی کو منقطع کیجئے (Administration > Roles).
•	Account کوپیرنٹ شعبوں کی تمام مخصوص فہرستوں سے ہٹائیے (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).

