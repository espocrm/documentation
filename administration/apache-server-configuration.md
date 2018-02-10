# EspoCRM এর জন্য Apache সার্ভার কনফিগারেশন

এই নির্দেশাবলী থেকে সম্পূরক Server Configuration](server-configuration.md) গাইডলাইন। দয়া করে মনে রাখবেন এখানে তালিকাভুক্ত সমস্ত কনফিগারেশন সেটিংস উবুন্টু সার্ভারে তৈরি করা হয়েছে।

## পিএইচপির প্রয়োজনীয়তা

সমস্ত প্রয়োজনীয় লাইব্রেরিগুলি ইনস্টল করতে, এই কমান্ডগুলি একটি টার্মিনালে চালান:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## সমস্যাটি সমাধান করা “API Error: EspoCRM API is unavailable”:

প্রয়োজনীয় পদক্ষেপ নিন। সমস্যাটি সমাধান করা হলে প্রতিটি পদক্ষেপের পরে পরীক্ষা করুন।

### 1. Apache- তে "mod_rewrite" সমর্থন সক্ষম করুন

"Mod_rewrite" সক্ষম করতে, টার্মিনালে এই কমান্ডগুলি চালনা করুন:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. সমর্থন সক্ষম করুন .htaccess

.htaccess সমর্থন সক্ষম করতে, সার্ভার কনফিগারেশন যোগ/সম্পাদনা করুন Settings /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf বা /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

পরে, এই কমান্ডটি একটি টার্মিনালে চালান:

```
sudo service apache2 restart
```

### 3. RewriteBase পাথ যোগ করুন

একটি ফাইল /ESPOCRM_DIRECTORY/api/v1/.htaccess খুলুন এবং নিম্নলিখিত লাইন প্রতিস্থাপন করুন:

```
# RewriteBase /
```

সাথে

```
RewriteBase /REQUEST_URI/api/v1/
```

যেখানে REQUEST_URI URL এর একটি অংশ, যেমন "http://example.com/espocrm/" এর জন্য, REQUEST_URI "espocrm"


## HTTP AUTHORIZATION সমর্থন সক্ষম করুন (শুধুমাত্র FastCGI এর জন্য)।

FastCGI ডিফল্ট হিসাবে HTTP AUTHORIZATION সমর্থন করে না যদি আপনি FastCGI ব্যবহার করেন তবে নিম্নলিখিত কোডগুলি যুক্ত করে আপনার VirtualHost অথবা /etc/apache2/apache2.conf (httpd.conf) এ এটি সক্রিয় করতে হবে:

Fcgid মডিউল জন্য:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Fcgid মডিউল জন্য:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

বর্তমানে যে মডিউলটি ব্যবহৃত হচ্ছে তা পরীক্ষা করতে, এই কমান্ডটি চালান এবং মডিউল খুঁজুন:

```
apache2ctl -M
```
