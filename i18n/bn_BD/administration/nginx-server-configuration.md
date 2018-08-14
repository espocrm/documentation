# EspoCRM এর জন্য Nginx সার্ভার কনফিগারেশন

এই নির্দেশাবলী থেকে সম্পূরক [সার্ভার কনফিগারেশন](server-configuration.md) গাইডলাইন। দয়া করে মনে রাখবেন এখানে তালিকাভুক্ত সমস্ত কনফিগারেশন সেটিংস উবুন্টু সার্ভারে তৈরি করা হয়েছে।

## PHP প্রয়োজনীয়তা

সমস্ত প্রয়োজনীয় লাইব্রেরিগুলি ইনস্টল করতে, এই কমান্ডগুলি একটি টার্মিনালে চালান:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## সমস্যাটি সমাধান করা "API ত্রুটি: EspoCRM API অনুপলব্ধ":

প্রয়োজনীয় পদক্ষেপ নিন। সমস্যাটি সমাধান করা হলে প্রতিটি পদক্ষেপের পরে পরীক্ষা করুন।

### 1. Nginx সার্ভারে পুনরায় লেখা নিয়মগুলি সক্ষম করুন

আপনার Nginx সার্ভার ব্লক কনফিগার ফাইল এই কোডটি যোগ করুন (/etc/nginx/sites-available/YOUR_SITE) ভিতরে “server” ব্লক:

```
server {   
    # ...
    
    client_max_body_size 50M;
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }
    
    location /portal/ {
        try_files $uri $uri/ /portal/index.php?$query_string;
    }

    location /api/v1/portal-access {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/portal-access/index.php last; break;
        }
    }
 
    location ~ /reset/?$ {
        try_files /reset.html =404;
    }
 
    location ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    location ^~ /data/logs/ {
        deny all;
    }
    location ^~ /data/\.backup/ {
        deny all;
    }
    location ^~ /data/config.php {
        deny all;
    }
    location ^~ /data/cache/ {
        deny all;
    }
    location ^~ /data/upload/ {
        deny all;
    }
    location ^~ /application/ {
        deny all;
    }
    location ^~ /custom/ {
        deny all;
    }
    location ^~ /vendor/ {
        deny all;
    }
    location ~ /\.ht {
        deny all;
    }
}
```

আপনার যদি এই ফাইল না থাকে, তবে আপনাকে এটি তৈরি করতে হবে। এই জন্য একটি টার্মিনাল খুলুন এবং কমান্ডটি চালান:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

এবং উপরে তালিকাভুক্ত কোড যোগ করুন। Nginx- এ নতুন ভার্চুয়াল হোস্ট কনফিগার করার বিষয়ে আরো তথ্যের জন্য, দয়া করে এটি পড়ুন [ গাইডলাইন](nginx-virtual-host.md).

সবকিছু ঠিক আছে কিনা তা পরীক্ষা করতে টার্মিনালে এই কমান্ডটি চালান:

```
sudo nginx -t
```

যদি তাই হয়, nginx সার্ভার পুনরায় আরম্ভ করার জন্য কমান্ডটি চালান:

```
sudo service nginx restart
```

### 2. RewriteBase পাথ যোগ করুন

একটি ফাইল খুলুন /ESPOCRM_DIRECTORY/api/v1/.htaccess এবং নিম্নলিখিত লাইন প্রতিস্থাপন করুন:

```
# RewriteBase /
```
সাথে 

```
RewriteBase /REQUEST_URI/api/v1/
```

যেখানে  REQUEST_URI এর একটি URL অংশ, যেমন “http://example.com/espocrm/” জন্য, REQUEST_URI হয় “espocrm”.
