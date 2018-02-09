این جی این آئی ایکس (Ngnix) سرور کی تشکیل برائے ایسپور سی آر ایم (نظام برائے تعلقاتِ صارف) 
یہ ہدایات سرور کی تشکیل کی راہنمائی کے ضمن میں ہیں۔ مہربانی فرما کر نوٹ کر لیجئے کہ یہاں دی گئی سب تشکیلی ترتیبات ابنٹو سرور پر بنائی گئی ہیں۔
پی ایچ پی کےلیے ضروریات
تمام ضروری لائبریریز کو انسٹال کرنے کےلیے، ان کمانڈز کو ٹرمینل پر چلائیے:
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
حل برائے مسئلہ” اے پی آئی ایرر: ایسپو سی آری ایم میں اے پی آئی کی عدم دستیابی“ :
صرف ضروری اقدامات اٹھائیے۔ ہر مرحلے کے بعد جائزہ لیجئے کہ شاید مسئلہ حل ہو گیا ہو۔ 
1.	این جی آئی این ایکس (Nginx) کے ضوابط میں "ری رائٹ-موڈ" کی فعالیت:
اس کوڈ کو اپنے این جی آئی این ایکس (Nginx) سرور کی تشکیلی بلاک فائل (/etc/nginx/sites-available/YOUR_SITE)  میں “server”  بلاک میں شامل کیجئے:
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
اگر آپ کے پاس یہ فائل نہیں ہے تو یہ آپ کو بنانی ہوگی، اس کےلیے آپ ایک ٹرمینل کھول کر یہ کمانڈ چلائیں گے:
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
اور اوپر درج کیے گئے کوڈ کو شامل کردیجئے۔ این جی آئی این ایکس پر نئے ورچوئل ہوسٹ کو تشکیل دینے کی مزید معلومات کےلیے، برائے مہربانی ان ہدایات کو پڑھیے۔ 
یہ جانچنے کےلیے کہ سب ٹھیک ہے، ان کمانڈز کو ایک ٹرمینل میں چلائیے:
sudo nginx -t
اگر ٹھیک ہے تو یہ کمانڈ چلا کر این جی آئی این ایکس سرور کو ری سٹارٹ (نئے سرے سے چلائیے) کیجئے۔ 
sudo service nginx restart
2.  ری رائٹ بیس پاتھ کا اضافہ
اس فائل کو کھول کر درج ذیل لائن سے تبدیل کر دیجئے: /ESPOCRM_DIRECTORY/api/v1/.htaccess 
# RewriteBase /
کو
RewriteBase /REQUEST_URI/api/v1/
جہاں کہیں بھی REQUEST_URI  کسی ربط کا حصہ ہو جیسا کہ مثلاۤ
“http://example.com/espocrm/”, REQUEST_URI میں“espocrm” ہے۔

