Backup and Restore
بیک اپ اور بحالی (ری سٹور)
How to backup EspoCRM manually
ایسپو سی آر ایم (انتظام برائے تعلقاتِ صارف) کو خود بیک اپ کیسے کیا جائے؟
EspoCRM consists of files and database data. All these data are needed in order to create a full backup of EspoCRM. Here are instructions on how to do it on Ubuntu server with MySQL.
ایسپو سی آر ایم ڈیٹابیس کے مواد اور فائلوں پر مشتمل ہوتا ہے۔ یہ سب مواد ایسپو سی آر ایم کے مکمل بیک اپ کے بنانے کےلیے ضروری ہوتا ہے۔ MySQL کے ساتھ ابنٹو سرور پر یہ سب کرنے کےلیے ہدایات نیچے درج ہیں۔ 
Step 1. Backup files
Create an archive of the directory content of installed EspoCRM. For Ubuntu the default path is /var/www/html. You may use this command:
پہلا مرحلہ۔ بیک اپ فائلیں
ایسپو سی آر ایم کے لیے ڈائریکٹری مواد کا آرکائیو بنائیے۔ ابنٹو کےلیے معیاری پاتھ (رستہ) یہ ہوتا ہے /var/www/html۔آپ یہ کمانڈ بھی استعمال کر سکتے ہیں:
tar -czf "files.tar.gz" -C /var/www/html .
Step 2. Backup database
To backup all your data, you have to know the database name and access credentials. You can find the database name in the configuration file /ESPOCRM_DIRECTORY/data/config.php under section database. You can use this command to backup your database:
دوسرا مرحلہ۔ بیک اپ ڈیٹا بیس
 اپنے تمام مواد کا بیک اپ کرنے کےلیے، آپ کو ڈیٹا بیس کا نام اور اسناد تک رسائی کا معلوم ہونا چاہیے۔ آپ ڈیٹابیس کا نام تشکیلی فائل  /ESPOCRM_DIRECTORY/data/config.php میں database سیکشن کے نیچے تلاش کر سکتے ہیں۔ آپ اپنے ڈیٹا بیس کے بیک اپ کےلیے اس کمانڈ کو استعمال کر سکتے ہیں:
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"

Step 3. Copy the backup
That's all. Now, you have to copy the created backup to a safe place.
تیسرا مرحلہ۔ بیک اپ کو نقل کیجئے
یہی کچھ، آپ کو بنائے گئے بیک اپ کو محفوظ جگہ پر نقل کرنا ہوگا۔
How to backup EspoCRM with a script
You can use a script to backup all needed data. Login via SSH and run the commands (tested on Ubuntu server).
ایسپو سی آر ایم کو ایک سکرپٹ کے ساتھ کیسے بیک اپ کیا جائے
آپ تمام ضروری مواد کو ایک سکرپٹ استعمال کرکے بیک اپ کرسکتے ہیں۔ ایس ایس ایچ کے ذریعے لاگ ان ہوں اور کمانڈز کو چلائیے ( ابنٹو سرور پر جائزہ شدہ)۔
Download a script
ایک سکرپٹ اتاریے
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
Run the script
سکرپٹ چلائیے
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
where
جہاں
•	PATH_TO_ESPOCRM is a path to installed EspoCRM directory.
•	BACKUP_PATH is a path to backup directory.
PATH_TO_ESPOCRM ایسپو سی آر ایم ڈائریکٹری کو انسٹال کرنے کا ذریعہ ہے۔
BACKUP_PATH ڈائیریکٹری کو بیک اپ کرنے کا راستہ ہے۔
For Ubuntu server it is:
ابنٹو سرور کےلیے یہ ہے:
bash ./backup.sh /var/www/html /opt/backups
Note: If your MySQL user doesn't have needed rights to dump your database, you will be promted to enter credentials of another MySQL user.
After successful creation, you will get a path to the created backup.
نوٹ: اگر آپ کے MySQL استعمال کنندے کے پاس آپ کا ڈیٹابیس تلف (ختم) کرنے کے ضروری حقوق نہیں ہیں، تو آپ دوسرے MySQL استعمال کنندے کے اسناد میں داخل ہونے کےلیے ترقی کر جائیں گے۔
کامیابی کے ساتھ بنانے کے بعد، آپ بنائے ہوئے بیک اپ بنانے  کا راستہ حاصل کر لیں گے۔
Restore EspoCRM from a backup
You can restore EspoCRM from the backup created as described above.
ایسپو سی آر ایم کو کسی بیک اپ سے بحال کریں
آپ ایسپو سی آر ایم کو بنائے ہو بیک اپ سے اوپر دیئے گئے طریقے کے مطابق بحال کرسکتے ہیں۔
Step 1. Unarchive backup files
To unarchive files, you can use Archive Manager or run the below command. Files need to be placed in the web-server directory.
پہلا مرحلہ۔ بیک اپ فائلیں کو غیر منظم کریں
غیرمنظم کرنے کےلیے، آپ منظم(آرکائیو) مینیجر استعمال کرسکتے ہیں یا نیچے والی کمانڈز استعمال کرسکتے ہیں۔ فائلوں کو ویب سرور کی ڈائریکٹری میں رکھنا ہوگا۔

tar -xzf "files.tar.gz" -C /var/www/html
where:
جہاں:
•	/var/www/html is a web-server directory.
Step 2. Set required permissions
The files should be owned by a web-server user and have correct permissions. Please set required permissions by following this instruction: 
دوسرا مرحلہ۔ ضرورت کے مطابق اجازتیں سیٹ کیجئے
فائلیں ویب سرور کے استعمال کنندے کی ملکیت ہونی چاہییں اور صحیح اجازت ہونی چاہیے۔ برائے مہربانی ضرورت کے مطابق اجازتوں کو درج ذیل ہدایات کے مطابق سیٹ کریں:
www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.
Step 3. Import database dump
Database dump should be imported to the same database with the same user credentials, otherwise the correction should be made in the configuration file ESPOCRM_DIRECTORY/data/config.php. To import your database from the dump, run the command below in a terminal:
تیسرا مرحلہ۔ ڈیٹابیس کے فالتو مواد کو درآمد کریں
ڈیٹابیس کے فالتو مواد کو ایک ہی جیسے استعمال کنندے کے اسناد والے ڈٰیٹا بیس میں درآمد کرنا چاہیے ورنہ درستگی تشکیلی فائل میں کرنی چاہیے ESPOCRM_DIRECTORY/data/config.php. فالتو مواد سے ڈیٹابیس کو درآمد کرنے کےلیے مندرجہ ذیل کمانڈز کو کسی ٹرمینل میں چلائیے:
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
Step 4. Check/configure crontab
Check if your crontab is configured properly. Run the command below and check if a path to EspoCRM is correct:
چوتھا مرحلہ۔ جانچیے/تشکیل دیجئے کرونٹیب کو
جانچیے کہ اگر آپ کی کرون ٹیب صحیح طرح سے تشکیل دی گئی ہے۔ اگر ایسپو سی آر ایم کی طرف کا راستہ صحیح ہے تو نیچے دی گی کمانڈ چلائیے اور جائزہ لیجئے:
sudo crontab -l -u www-data
where:
جہاں:
•	www-data is your web-server user.
If you have to make any changes, use this command:
www-data آپ کا ویب سرور استعمال کنندہ ہے۔
اگر آپ کو کوئی تبدیلیاں کرنی ہیں تو اس کمانڈ کو استعمال کیجئے:
sudo crontab -l -u www-data
More details about configuring crontab for EspoCRM is described here 
ایسپو سی آر ایم کی کرون ٹیب کی تشکیل سے متعلق مزید ہدایات یہاں بیان کی گئی ہیں
www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
