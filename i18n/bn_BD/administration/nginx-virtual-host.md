# EspoCRM- এর জন্য Nginx- এ একটি ভার্চুয়াল হোস্ট কনফিগার

এই গাইডে আমরা উবুন্টু সার্ভারে EspoCRM জন্য Nginx একটি ভার্চুয়াল হোস্ট কনফিগার কিভাবে দেখাতে হবে।

## একটি সার্ভার ব্লক ফাইল তৈরি করুন

এই ফাইল তৈরি করতে, একটি টার্মিনাল খুলুন এবং কমান্ডটি চালান:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

এখন, এই ফাইলটি খুলুন (/etc/nginx/sites-available/espocrm.conf) এবং নীচের মুদ্রিত বিন্যাস অনুসরণ কোড সংশোধন করুন (কিছু সেটিংস আপনার কনফিগারেশন উপর ভিত্তি করে পৃথক হতে পারে):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Replace espocrm.local to your domain name
    root /var/www/html/espocrm; # Specify your EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL configuration
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    
 
    # Specify your PHP (php-cgi or php-fpm) based on your configuration
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # With php7.0-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Add rewrite rules
    location / {
        try_files $uri $uri/ =404;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
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

## এই সার্ভার ব্লক সক্ষম করুন

একটি সাংকেতিক লিঙ্ক তৈরি করুন:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

সবকিছু ঠিক আছে কিনা তা পরীক্ষা করতে এই কমান্ডটি চালান:

```
sudo nginx -t
```

এবং Nginx সার্ভার পুনরায় আরম্ভ করুন:

```
sudo service nginx restart
```

## আপনার স্থানীয় হোস্ট কনফিগার করুন (ঐচ্ছিক, শুধুমাত্র একটি স্থানীয় ডোমেইনের জন্য)

আপনি যদি একটি স্থানীয় ডোমেন যোগ করেন, তাহলে আপনাকে এটি আপনার স্থানীয় কম্পিউটারে (সার্ভারে নয়) কনফিগার করতে হবে। উবুন্টুর জন্য, ফাইলটি খুলুন `/etc/hosts` এবং লাইন যোগ করুন:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

উইন্ডোজের জন্য, এইগুলি অনুসরণ করুন [নির্দেশাবলী](http://support.microsoft.com/kb/923947)।
