Apache server configuration for EspoCRM
اپاچی سرور کی تشکیل برائے ایسپو سی آر ایم (نظام برائے تعلقاتِ صارف)
These instructions are supplementary to the Server Configuration guideline. Please note that all configuration settings listed here are made on Ubuntu server.
یہ ہدایات سرور کی تشکیل کی راہنمائی کے ضمن میں ہیں۔ مہربانی فرما کر نوٹ کر لیجئے کہ یہاں دی گئی سب تشکیلی ترتیبات ابنٹو سرور پر بنائی گئی ہیں۔
PHP requirements
پی ایچ پی کےلیے ضروریات
To install all necessary libraries, run these commands in a terminal:
تمام ضروری لائبریریز کو انسٹال کرنے کےلیے، ان کمانڈز کو ٹرمینل پر چلائیے:
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart

Fixing the issue “API Error: EspoCRM API is unavailable”:
حل برائے مسئلہ” اے پی آئی ایرر: ایسپو سی آری ایم میں اے پی آئی کی عدم دستیابی“ :
Take only necessary steps. After each step check if the issue is solved.
صرف ضروری اقدامات اٹھائیے۔ ہر مرحلے کے بعد جائزہ لیجئے کہ شاید مسئلہ حل ہو گیا ہو۔ 
1. Enable “mod_rewrite” support in Apache
1.	اپاچی میں "ری رائٹ-موڈ" سپورٹ کی فعالیت
To enable “mod_rewrite,” run these commands in a terminal:
"ری رائٹ- موڈ" کی فعالیت کےلیے ٹرمینل میں ان کمانڈز کو درج کیجئے:
sudo a2enmod rewrite
sudo service apache2 restart

2. Enable .htaccess support
2.	.htaccess سپورٹ کی فعالیت
To enable .htaccess support, add/edit the Server Configuration Settings /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf or /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):
.htaccess سپورٹ کی فعالیت کےلیے سرور کی ان تشکیلی ترتیبات میں ترمیم کیجئے
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>

Afterward, run this command in a terminal:
اس کے بعد ان کمانڈز کو ایک ٹرمینل میں چلائیے:
sudo service apache2 restart

3. Add RewriteBase path
3.	ری رائٹ بیس پاتھ کا اضافہ
Open a file /ESPOCRM_DIRECTORY/api/v1/.htaccess and replace the following line:
اس فائل کو کھول کر درج ذیل لائن سے تبدیل کر دیجئے: /ESPOCRM_DIRECTORY/api/v1/.htaccess 
# RewriteBase /

with
کو

RewriteBase /REQUEST_URI/api/v1/

where REQUEST_URI is a part of URL, e.g. for “http://example.com/espocrm/”, REQUEST_URI is “espocrm”.
جہاں کہیں بھی REQUEST_URI  کسی ربط کا حصہ ہو جیسا کہ مثلاۤ
“http://example.com/espocrm/”, REQUEST_URI میں“espocrm” ہے۔

Enable HTTP AUTHORIZATION support (only for FastCGI).
اختیار برائے ایچ ٹی ٹی پی سپورٹ کی فعالیت ( صرف FastCGI/ تیز سی جی آئی کےلیے) 

FastCGI does not support HTTP AUTHORIZATION by default. If you use FastCGI, you have to enable it in your VirtualHost or /etc/apache2/apache2.conf (httpd.conf) by adding the following code:
FastCGI اختیار برائے ایچ ٹی ٹی پی کو ڈیفالٹ میں سپورٹ نہیں کرتا۔ اگر آپ FastCGI استعمال کرتے ہیں تو آپ کو اپنے ورچوئل ہوسٹ یا /etc/apache2/apache2.conf (httpd.conf) میں اسے فعال کرنے کےلیے مندرجہ ذیل کوڈ درج کرنا ہوگا:
For Fcgid module:
Fcgid ماڈیول کےلیے: 
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>

For FastCgi module:
FastCgi ماڈیول کےلیے:

<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>

To check which module is currently being used, run this command and find the module:
یہ جانچنے کےلیے کہ آپ فی الوقت کون سا ماڈیول آپ کے زیرِ استعمال ہے، اس کمانڈ کو چلا کو چلا کر ماڈیول تلاش کیجئے:

apache2ctl -M
