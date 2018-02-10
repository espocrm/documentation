Portal
پورٹل
Portal provides an ability to access specific crm data and functions for your customers and partners. Administrator can create multiple portals. Each portal can have its own settings, dashlboard, user list, access control settings.
پورٹل مخصوص سی آر ایم (انتظام برائے تعلقاتِ صارف) مواد اور آپ کے صارفین اور حصہ داروں کی خصوصیات تک رسائی کی اہلیت مہیا کرتا ہے۔ منتظمم ایک سے زائدہ پورٹلز بنا سکتا ہے۔ ہر پورٹل کی اپنی ترتیباتت، ڈیش بورڈ، فہرستِ استعمال کنندہ، اور تشکیلی ترتیبات تک رسائی ہوتی ہے۔
To create portal follow Administration > Portals, click Create Portal button.
پورٹل کو بنانے کے لیے انتظامیہ سے پورٹل میں جائیں اور "پورٹل بٹن بنائیے" پر کلک کریں۔
•	Is Active. If not check portal won't be available for anybody.
•	Is Default. Means that portal will be available by shorter url: http(s)://YOUR_ESPO_URL/portal.
•	Roles. Specify one or multiple portal roles that will be applied to users logged into portal. More information about portal roles is below.
•	Tab List. Tabs which will be shown in navigation bar.
•	Dashboard Layout. Specify dashlets that will be displayed on the home page of the portal. Note that portal users can't configure their dashboard.
•	URL. Read only field that displays the link you can access the portal with.
Is Active اگر منتخب نہ ہو تو پورٹل کسی آدمی کےلیے میسر نہیں ہوگا۔
Is Default. کا مطلب یہ ہے کہ پورٹل اس چھوٹے ربط میں مہیا ہوگا: http(s)://YOUR_ESPO_URL/portal.
Roles. یہ ایسے ایک یا زیادہ پورٹل رولز کی تخصیص کرتا ہے جو پورٹل میں لاگ ان استعمال کنندوں پر لاگو ہوں گے۔ پورٹل رولز سے متعلق مزید معلومات نیچے درج ہیں۔۔
Tab List ٹیب جو ک نیوی گیشن بار پر نظر آئے گی۔
Dashboard Layout پورٹل کے مرکزی صفحے پر مخصوص ڈیش لٹس نظر آئیں گی۔یہ نوٹ کر لیجئے کہ پورٹل کے استعمال کنندے ڈیش بورڈ کو تشکیل نہیں دے سکیں گے۔
URL پورٹل پر رسائی حاصل کرنے کےلیے ایسے عبے کو جو ربط دکھائے صرف اسے پڑھیں۔ 
Portal Users
پورٹل کے استعمال کنندے
Administrators can create portal users.
1.	Administration > Users.
2.	Click right dropdown next to Create User.
3.	Click Create Portal User.
4.	Select Contact the portal user will be linked with.
5.	Fill the form and click save.
منتظم پورٹل کے استعمال کنندے بنا سکتا ہے۔
1۔ انتظامیہ سے استعمال کنندے میں جائیں
2۔ استعمال کنندہ بنانے کے بٹن کے سامنے ڈراپ ڈاؤن پر (ماؤس کا رائٹ) دائیں کلک کریں
3۔ پورٹل کا استعمال کنندہ بنانے پر کلک کریں
4۔ رابطے کو منتخب کرنے سے پورٹل کا استعمال کنندہ اس سے مربوط ہوجائے گا
5۔ فارم کو بھر کر پھر محفوظ کر دیجئے
Portal user should be linked to Portal record to be able to access that portal.
پورٹل کا استعمال کنندہ پورٹل ریکارڈ سے منسلک ہونا چاہیے تاکہ وہ پورٹل تک رسائی حاصل کرسکے۔
Portal Roles
Portal roles are similar to regular roles in EspoCRM but with a few distinctions.
پورٹل کے کردار
پورٹل کے کردار (کام) ایسپو سی آر ایم کے باقاودہ کردار کے مشابہ مگر تھوڑے سے فرق کے ساتھہوتا ہے۔
•	Not-set level denies an access.
•	own level means that the record is created by the user. E.g. portal user cased some case and this case is owned by this user.
•	account level means that the record is related to the account the portal user is related to.
•	contact level means that the record is related to the contact the portal user is related to.
Assigned User and Teams fields are read only for portal users.
Not-set کا مرحلہ رسائی سے انکار کرتا ہے۔
Own کے مرحلے کا مطلب یہ ہے کہ ریکارڈ استعمال کنندے کی طرف سے بنایا گیا ہے۔ جیسا کہ پورٹل کا استعمال کنندہ چند معاملات میں مقدمہ قائم کرتا ہے اور یہ مقدمہ استعمال کنندے کی ملکیت ہوتا ہے۔
Account کے مرحلے کا مطلب یہ ہے کہ ریکارڈ اس اکاؤنٹ (کھوتے) سے منسلک ہے جو پورٹل استعمال کنندے سے منسلک ہے۔
Contact کے مرحلے کا مطلب یہ ہے کہ ریکارڈ اس کانٹیکٹ (رابطے) سے منسلک ہے جو پورٹل استعمال کنندے سے منسلک ہے۔
تفویض کردہ استعمال کنندے اور ٹیم کے شعبے صرف پورٹل کے استعمال کنندے کو ہی پڑھ سکتے ہیں۔

Example
Portal users should be able to create cases, view cases related to their account; they should be able to view knowledge base.
1.	Open Create Portal Role form (Administration > Portal Roles > Create Role).
2.	Enable access to Cases, set: create - yes, read - account, edit - no, delete - no, stream - account.
3.	Enable access to Knowledge Base, set create - no, read - account, edit - no, delete - no.
4.	Edit your portal record (Administration > Portals). Select your portal role in Roles field and then save.
مثال
پورٹل کے استعمال کنندے مقدمے کو بنانے کے قابل ہونے چاہیں، کھاتے سے متعلق مقدموں کو دیکھیں؛ وہ علمی بنیاد کو دیکھنے کے قابل ہونے چاہییں۔
1۔ پورٹل کا کردار فارم بنائیے کو کھولیے (Administration > Portal Roles > Create Role).
2۔ مقدمہ جات تک رسائی کو فعال کیجئے، سیٹ کریں: : create - yes, read - account, edit - no, delete - no, stream - account.
3۔ علمی بنیاد تک رسائی کو فعال کیجئے، سیٹ کریں: create - no, read - account, edit - no, delete - no.
4۔ پورٹل ریکارڈ کی ترمیم کیجئے (Administration > Portals). کردار کے شعبے میں اپنے پورٹل کا کردار منتخب کیجئے اور محفوظ کر دیجئے۔
Access to Portal
You can find the url for your portal in 'URL' field of the portal record. Also it's possible to use server configuration tools (such mod_rewrite) to be able to access by different url. For this case you need to fill in 'Custom URL' field.
پورٹل تک رسائی
آپ اپنے پورٹل کےلیے ربط پورٹل ریکارڈ کے 'URL' شعبے میں تلاش کرسکتے ہیں۔ مختلف روابط تک رسائی حاصل کرنے کےلیے سرور کے تشکیلی آلے(جسا کہ ری رائٹ موڈ) استعمال کرنا بھی ممکن ہے۔ اس مقدمے کےلیے آپ کو 'Custom URL' کے شعبے میں لکھنے کی ضرورت ہے۔
Access portal by Custom URL for Apache server
Custom URL: my-portal-host-name.com.
crm.portal.conf
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
پورٹل تک رسائی اپاچی سرور کےلیے اپنی مرضی کے ربط کے ذریعے حاصل کیجئے۔
اپنی مرضی کا ربط: میرا-پورٹل-ہوسٹ-نام ڈاٹ کام
crm.portal.conf
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

 ServerAlias  میرا-پورٹل-ہوسٹ-نام ڈاٹ کام 


Mod rewrite rules
Specify portal record ID instead of {PORTAL_ID}. Portal record ID can is avaialble in address bar of your web browser when you open detail view of the portal record. Like: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 is a portal record id.
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
 ری رائٹ (دوبارہ لکھنے کے) موڈ کے اصول
{PORTAL_ID}. کی بجائے پورٹل کے ریکارڈ کی شناخت کو مخصوص کریں۔ جب ہم پورٹل ریکارڈ کی تفصیلات کو دیکھنے کےلیے کھولتے ہیں تب پورٹل ریکارڈ کی شناخت ہمارے ویب براؤز کے پتے والے خانے میں موجود ہوتی ہے۔ ربط: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24 16b9hm41c069e6j24 یہ پورٹل کے ریکارڈ کی شناخت ہے۔

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
