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
Entity Manager
شناختی منتظم
Entity Manager is available in Administration panel. It provides an ability to highly customize your EspoCRM instance. You are able to do the following:
شناختی منتظم انتظامیہ کے پینل پر دستیاب ہوتا ہے۔ یہ آپ کے مثالی ایسپو سی آر ایم کو اعلیٰ درجے کا بنانے کی آپ کو اہلیت مہیا کرتا ہے۔ آپ درج ذیل کام کرنے کے قابل ہیں:
•	Add new types of entities.
•	Customize existing types of entities: change labels, default order in list view, enable or disable stream.
•	Configure fields: add new, customize existing ones.
•	Configure relationships: add new, change labels of existing ones.
نئی اقسام کی شناختوں کو شامل کریں
پہلے سے موجودہ شناختوں کی اقسام کو اپنی مرضی کے مطابق تبدیل کریں: عنوانات کو تبدیل کریں، دکھانے والی فہرست کو معیاری آپشن حکم پر رکھیں، سٹریم (برقی ندی) کو فعال یا غیر فعال کریں۔
شعبوں کو تشکیل دیں: نئے شامل کریں، پہلے سے موجودہ کو اپنی مرضی کے مطابق ڈھالیں
تعلقات کو تشکیل دیں: نئے شامل کریں، پہلے سے موجودہ کے عنوانات تبدیل کریں

Creating new entity
Click Create Entity button on Entity Manager page. Specify name, labels and type. If you select Person type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check Stream if you want your entity to have stream panel and users to be able to Follow entities of this type.
نئی شناخت کی چیز کو بنانا
شناخت کے منتظم صفحے پر Create Entity بٹن پر کلک کریں۔ نام ، عنوانات اور قسم کو مخصوص کریں۔ اگر آپ Person کی قسم کو منتخب کیا تو آپ کی بنائی ہوئی شناختی چیز کے پاس ای میل ، فون ، پہلا نام ، آخری نام اور رسمی شعبے ہوں گے۔اگر آپ چاہتے ہیں کہ آپ کی بنائی گئی شناختی چیز کے پاس سٹریم پینل اور استعمال کنندے ہونے چاہییں تاکہ وہ اپنی طرح کی دوسرے چیزوں کی پیروی کرسکے تو آپ Stream کو منتخب کیجئے۔ 
Types:
اقسام:
•	Base - empty entity only with basic fields like Name, Assigned User, Teams, Description.
•	Base Plus - like Base but with Activities, History, Tasks panels (available since 4.3.0).
•	Event - Date Start, Date End, Duration, Parent, Status fields. Available in Calendar and Activities panel (since 4.3.0, must be enabled at Administration > Settings).
•	Person - Email, Phone, First Name, Last Name, Salutation, Address fields. Activities, History, Tasks panels.
•	Company - Email, Phone, Billing Address, Shipping Address fields. Activities, History, Tasks panels.
•	بنیاد – خالی شناختی چیزیں صرف بنیادی شعبے جیسے نام، تفویض کردہ استعمال کنندہ، گروہ، تفصیل۔
•	بنیاد سے اضافی – جیسے بنیادی مگر سرگرمیوں، تاریخ، مقررہ کام کے پینل کے ساتھ (4.3.0 ورژن سے مہیا ہے)
•	مرحلہ – تاریخ ابتداء، تاریخ اختتام، دورانیہ، بنیاد، شعبوں کا مقام۔ تاریخ نامے اور سرگرمیوں کے پینل میں مہیا ہیں (4.3.0 ورژن کے بعد سے انتظامیہ میں ترتیبات کے اندر فعال ہونا ضروری ہے)
•	ذات – ای میل، فون، پہلا نام، آخری نام، رسم ، پتے کے شعبے، سرگرمیاں، تاریخ اور مقررہ کام کے پینلز۔
•	کمپنی – ای میل، فون ، بل کا پتا ، پہنچانے کے پتے کے شعبے۔ سرگرمیاں، تاریخ، مقررہ کام کے پینلز۔
Update existing entity
If you click Edit link on a certain entity you will be able to change some parameters of that entity.
پہلے سے موجودہ شناختی وجودہ کی تجدید کریں
اگر آپ نے کسی خاص شناختی وجود پر Edit ربط پر کلک کیا تو آپ اس شناختی وجود کی کچھ متعین مقداروں کو تبدیل کرنے کے قابل ہوں گے۔
•	Labels - singular and plural name of the entity.
•	Default order records are sorted by in list views.
•	Stream - whether Stream feature is enabled for this entity.
•	Disabled - check if you don't need this entity in your system.
•	Text Filter Fields - what fields to search in for the main text filter and global search.
•	عنوانات – شناختی وجود کے واحد اور جمع نام
•	معیاری ریکارڈز کے احکام دیکھنے کی فہرست میں چھانٹے جائیں 
•	سٹریم – کیا اس شناختی وجود کے لیے سٹریم کا فیچر فعال ہے
•	غیرفعالیت – اگر آپ اس شناختی وجود کو اپنے نظام میں نہیں چاہتے تو اسے منتخب کیجئے۔
•	عبارت کو چھاننے والے شعبے – مرکزی عبارت فلٹر اور عالمی تلاش خانے میں کن شعبوں کو تلاش کرنا ہے۔

Fields
شعبہ جات
By clicking Fields link you will be moved to a separate page. There you will be able to create new fields or update existing ones. The following types of fields are available in Entity Manager:
Fields کے ربط پر کلک کرنے سے آپ ایک علیحدہ صفحے پر منتقل ہو جائیں گے۔ وہاں آپ نئے شعبوں کو بنانے اور پہلے سے موجودہ کی تجدید کرنے کے قابل ہو جائیں گے۔ شناختی وجود کے منتظم میں درج کردہ شعبے موجود ہیں: 
•	Address - address with street, city, state, postal code and country;
•	Array - list of values, with the ability to select multiple values (not a good option if you need to search by this field); users can add their own values if options are not specified.
•	Attachment Multiple - multiple file attachments;
•	Auto-increment - read only generated number;
•	Boolean - checkbox, true or false;
•	Currency - for currency values;
•	Date;
•	DateTime;
•	Enum - selectbox, with the ability to select only one value;
•	File - uploading one file;
•	Float - number with a decimal part;
•	Foreign - a field of related entity;
•	Image - uploading image file with a preview;
•	Integer - whole number;
•	Number - auto-incrementing number of string type with a possible prefix and a specific length;
•	Multi-enum - list of values, with the ability to select multiple values (not a good option if you need to search by this field), similar to Array but nicer.
•	Text - text area, for long multiline texts;
•	Url - for links;
•	Varchar - short text;
•	Wysiwyg - similar to Text field, with the ability to format text.
•	
•	پتہ – گلی، شہر، ریاست، ڈاک خانے کے کوڈ، اور ملک کے کوڈ کے پتے کے ساتھ؛
•	رینج – قدروں کی فہرست، ایک سے زائد قدروں کو منتخب کرنے کی صلاحیت کے ساتھ ( اگر آپ شعبوں کے حساب سے تلاش کرنا چاہتے ہیں تو یہ اچھا آپشن نہیں ہے)؛ استعمال کنندے اپنی قدریں شامل کر سکتے ہیں اگر اختیارت مخصوص نہیں ہیں۔
•	ایک سے زائد کے ساتھ نتھی کرنا – ایک سے زائد فائلوں کو نتھی کرنا؛
•	خود بخود-اضافہ یہ صرف بنائے ہوئے نمبروں کو پڑھتا ہے؛
•	بولین – چیک باکس صحیح یا غلط؛
•	کرنسی – کرنسی کی قدروں کےلیے؛
•	تاریخ؛
•	تاریخ وقت؛
•	اینم – منتخب کرنے والا بکس کسی ایک قدر کو منتخب کرنے کی صلاحیت کے ساتھ؛
•	فائل – ایک فائل کو چڑھانا (اپلوڈ کرنا)؛
•	فلوٹ – نمبر کسی ہندسے کے حصے کے ساتھ؛
•	باہر کا – متعلقہ شناختی وجود کا شعبہ؛
•	تصویر – تصویر کو پیش منظر کے ساتھ اپلوڈ کرنا؛
•	ملانے والا – پورے نمبر کو:
•	نمبر – مخصوص لمبائی اور ممکنہ سابقے کے ساتھ کسی لڑی کے نمبر کا خود بخود اضافہ؛
•	ملٹی-اینم – قدروں کی فہرست، ایک سے زائد قدروں کو منتخب کرنے کی صلاحیت کے ساتھ ( اگر آپ شعبوں کے حساب سے تلاش کرنا چاہتے ہیں تو یہ اچھا آپشن نہیں ہے)، رینج کے مشابہ مگر اس سے اچھا۔
•	عبارت – عبارت کا احاطہ، زیادہ لائنوں والی لمبی عبارت کےلیے؛
•	یو آر ایل – ربط کےلیے؛
•	وارچر – چھوٹی عبارت؛
•	ویسیوگ – احاطہِ عبارت کے مشابہ، عبارت کو فارمیٹ کرنے کی صلاحیت کے ساتھ؛
•	
Parameters:
متعین مقداریں:
•	Required - whether filling in of the field is mandatory.
•	Default Value - Value of the field set upon creating new record.
•	Audited - updates of the field will be logged in Stream.
•	ضرورت ہے – آیا شعبے کو بھرنے کا کام ضروری ہے۔
•	معیاری قدر – شعبے کی قدر جو نئے ریکارڈ بنانے پر ترتیب ہوتی ہے۔
•	جانچ پڑتال – شعبے کی تجدید سٹریم میں داخل کر دی جائے گی۔
Note: After you have added the new field you need to put this field on layouts (Administration > Layout Manager).
نوٹ: جب آپ نئے شعبے کو شامل کرلیتے ہیں تو آپ کو اس شعبے کو لے آؤٹس میں ڈالنا چاہیے (انتظامیہ میں لے آؤٹ ممنتظم)
Dynamic Logic
متحرک منطق
Provides an ability to make forms dynamic. It's possible to define conditions making certain fields visible, required or read-only. Conditions will be checked automatically when data in the form is changed.
یہ اقسام کو متحرک بنانے کی اہلیت مہیا کرتا ہے۔ یہ ممکن ہے کہ ضروری یا صرف پڑھنے والے مخصوص شعبہ جات کو واضح بنانے کےلیے شرائط کی وضاحت کی جائے۔ جب اقسام میں مواد تبدل ہو جائے تو شرائط خود بخود منتخب ہو جائیں گی۔
For Enum, Array and Multi Enum fields it's possible to define different sets of options that will be available for the field depending on which condition is met.
اینم کےلیے، رینج اور زیادہ اینم والے شعبہ جات۔ یہ ممکن ہے کہ مختلف اختیارات کے جوڑوں کی وضاحت کی جائے کہ جو ایسے شعبے کےلیے مہیا ہوں گے جو کہ شرائط کے پورا ہونے پر منحصر ہے۔
