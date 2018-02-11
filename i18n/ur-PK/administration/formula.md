Calculated Fields (Formula)
حسابی شعبے (کلیہ)
In entity manager it's possible to define script (formula) for specific entity type. This script will be executed every time before record is saved. It provides an ability to automatically set specific fields (attributes) with values derived from calculation.
وجودی منتظم میں یہ ممکن ہے کہ کسی خاص وجودی قسم کےلیے سکرپٹ (کلیے) کی توضیح کی جائے۔ اس سکرپٹ کی ہر وقت ریکارڈ کے محفوظ ہونے سے پہلے تنصیب ہو جائے گی۔ یہ حساب سے حاصل کی گئی قدروں کے ساتھ مخصوص شعبوں (خاصیتوں) کو خودبخود سیٹ کرنے کی صلاحیت فراہم کرتا ہے۔
To edit formula follow Administration > Entity Manager > dropdown menu at the right on the row of needed entity > Formula.
کلیے کی ترمیم کےلیے ہمیں انتظامیہ میں جاکر وجودی منتظم کے اندر ڈراپ مینو کے دائیں طرف والی قطار میں ضروری وجود کے آگے کلیے کی پیروی کرنی ہوگی۔
You also might need to set fields, that are supposed to be calculated, Read-only via Entity Manager.
ہوسکتا ہے آپ کو ایسے شعبوں کو ترتیب دینا پڑے، جو کہ فرض کرلیے جائیں کہ حساب کیے ہوئے ہیں، صرف پڑھے جانے والے وجودی منتظم کے ذریعے۔
Syntax
ترکیب کلام
EspoCRM formula is written in the simple language designed specifically for this feature.
ایسپو سی آر ایم کلیہ ایسی آسان زبان میں لکھا ہوا ہے جو خصوصی طور پر اس فیچر کےلیے ترتیب دی گئی ہے۔
There are operators, functions attributes and values that can be used in formula. Separated expressions must be delimited by character ;.
ایسے عاملین ، خاصیتی افعال اور قدریں ہوتی ہیں جو کلیے میں استعمال کی جاسکتی ہیں۔ جدا اظہار کو ؛ کی علامت سے محدود کرنا ضروری ہے۔
Operators
عاملین
•	= - assignment.
•	|| - logical OR,
•	&& - logical AND,
•	! - logical NOT,
•	+- numeric summation,
•	- - numeric subtraction,
•	* - numeric multiplication,
•	/ - numeric division,
•	% - numeric modulo,
•	== - comparison equals,
•	!= - comparison not equals,
•	> - comparison greater than,
•	< - comparison less than,
•	>= - comparison greater than or equals,
•	<= - comparison less than or equals.

•	= - سپردکردہ کام.
•	|| - منطقی اور,
•	&& - منطقی اینڈ,
•	! – منطقی ناٹ,
•	+- عددی جمع,
•	- - عددی نفی,
•	* - عددی ضرب,
•	/ - عددی تقسیم,
•	% - عددی ماڈیول,
•	== - مقابل مساوات,
•	!= - غیرمقابل مساوات,
•	> - موازنہ اس سے بڑا,
•	< - موازنہ اس سے چھوٹا,
•	>= - موازنہ برائے اسے بڑا یا برابر,
•	<= - موازنہ برائے اس سے چھوٹا یا برابر.

Priority of operators:
عاملین کی ترجیح:
•	=;
•	||, &&;
•	==, !=, >, <, >=, <=;
•	+, -;
•	*, /, %.
Attributes
خاصیتیں
Attributes represent field values of the target entity. You can insert available attributes by clicking on the plus button.
خاصیتیں ہدفی وجود کے شعبے کی قدروں کو ظاہر کرتی ہیں۔ آپ مہیا خاصیتوں کو جمع والے بٹن پر کلک کرکے ڈال سکتے ہیں۔
It's possible to access attributes of related entities with the following format 
یہ ممکن ہے کہ آپ متعلقہ وجود کی خاصیتوں تک آگے دیے گئے فارمیٹ کے مطابق رسائی حاصل کر لیں۔
linkName.attributeName.
ربط کانام.خاصیت کا نام.

Functions
افعال
Format of function use: groupName\functionName(argument1, argument2, ..., argumentN).

مستعمل افعال کا فارمیٹ: گروہ کانم\فعل کا نام(دلیل 1, دلیل 2, ..., دلیل نمبر).

Out-of-the-box functions are listed below.
خانے کے باہر کے افعال نیچے درج ہیں۔
ifThenElse
اگرتب کبھی
ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE) If CONDITION is met then do CONSEQUENT. If not -- then do ALTERNATIVE.
اگر تب کبھی(شرط, نتیجہ, متبادل) اگر شرط پوری ہو جائے تو نتیجے کو اختیار کیجئے اور اگر نہ ہو تو متبادل کو اختیار کیجئے۔

ifThen
اگر تب
ifThen(CONDITION, CONSEQUENT) If CONDITION is met then do CONSEQUENT. If not -- do nothing.
اگر تب(شرط, نتیجہ) اگر شرط مل جائے تو نتیجے کو اختیار کیجئے ورنہ کچھ نہ کیجئے۔

string\concatenate(
لڑی/سلسلہ بندی
string\concatenate(STRING_1, STRING_2) Concatenates two or more strings.
لڑی\سلسلہ بندی(پہلی لڑی, دوسری لڑیدو یا زیادہ لڑیوں کی سلسلہ بندی.
string\substring
لڑی/ذیلی لڑی
string\substring(STRING, START, LENGTH) Extracts the characters from a STRING by START position and LENGTH.
لڑی\ذیلی لڑی(لڑی, ابتداء, لمبائی) ابتدائی حالت اور لمبای کے ذریعے کسی لڑی کے کرداروں کو نکالیے۔
If LENGTH is omitted, the substring starting from START until the end of the STRING will be returned.
اگر لمبائی کو چھوڑ دیا جائے تو ابتداء سے شروع ہو کر لڑی کے اختتام تک جانے والی ذیلی لڑی لوٹا دی جائے گی۔ 
If LENGTH is negative, then that many characters will be omitted from the end of STRING.
اگر لمبائی نفی میں ہے تو لڑی کے آخر سے بہت سے کردار چھوڑ دیے جائیں گے۔
string\trim
لڑی/تراشنا
string\trim(STRING) Strips whitespace from the beginning and end of STRING.
لڑی\تراشنا(لڑی) لڑی کے شروع اور آخر سے سفید جگہ کو اتار دیتا ہے۔

How to upgrade EspoCRM
ایسپو سی آر ایم (انتظام براے تعلقات صارف) کی تجدید کیسے کی جائے
EspoCRM can be upgraded to the latest version by the following steps:
ایسپو سی آر ایم (انتظام برائے تعلقات صارف) کی آگے آنے والے مراحل کے ذریعے نئے ورژن میں تجدید کی جاسکتی ہے:
Step 1. Check your current version
پہلا مرحلہ۔ اپنے موجودہ ورژن کا جائزہ لیجئے
To check your current version go to Administration > Upgrade page.
اپنے موجودہ ورژن کا جائزہ لینے کےلیے انتظامیہ میں تجدیدی صفحے پر جائیے۔
Step 2. Download needed upgrade packages
دوسرا مرحلہ، ضروری تجدیدی پیکج کو اتاریے
Go to the upgrade page https://www.espocrm.com/download/upgrades/ and based on your currect version download needed packages.
تجدیدی صفحے یعنی https://www.espocrm.com/download/upgrades/ پر جائیے اوراپنے موجودہ ورژن کی بنیاد پر مناسب پیکج کو اتاریے۔
Step 3. Create a backup (optional)
تیسرا مرحلہ۔ بیک اپ بنائیے (اختیاری)
Create a backup of your EspoCRM files and data before upgrading. Follow these instructions to get it done.
اپنی ایسپو سی آر ایم کی فائلوں اور مواد کی تجدید کرنے سے پہے ان کا بیک اپ بنائیے۔ کام مکمل کرنے کےلیے ان ہدایات کی پیروی کیجئے۔
Step 4. Upgrade process
چوتھا مرحلہ، تجدیدی عمل
Go to Administration > Upgrade. Upload and install one by one upgrade packages.
انتظامیہ میں تجدید پر جائیے۔ ایک ایک کرکے تجدیدی پیکج اپلوڈ (چڑھائیے) اور انسٹال کیجئے۔
You can check whether you have the latest version at Menu > About.
آپ مینو میں متعلقہ صفحے پر جا کر یہ جانچ سکتے ہیں کہ آیا آپ کے پاس جدید ورژن تو نہیں۔
Upgrade via CLI
تجدید بذریعہ سی ایل آئی
You can also run upgrade via command line interface. You need to execute the following command from EspoCRM root directory:
آپ کمانڈ لائن کے مرکزی صفحے کے ذریعے بھی تجدید کرسکتے ہیں۔ آپ کو اس کی تنصیب کے لیے ایسپو سی آر ایم کی روٹ ڈائریکٹری کی اس کمانڈ کی ضرورت ہو گی۔
php upgrade.php /path/to/upgrade/package.zip

string\lowerCase
string\lowerCase(STRING) Converts letters to lower case. (since version 5.0.0)
لڑی/چھوٹے حروف
لڑی/چھوٹے حروف/(لڑی) یہ حروف کو چھوٹے حروف میں تبدیل کرتا ہے (پانچویں ورژن سے)
string\upperCase
string\upperCase(STRING) Converts letters to upper case. (since version 5.0.0)
لڑی/بڑے حروف
لڑی/بڑے حروف/(لڑی) یہ حروف کو بڑے حروف میں تبدیل کرتا ہے (پانچویں ورژن سے)

datetime\today
datetime\today() Returns today's date.
تاریخ وقت/آج
تاریخ وقت/آج() آج کی تاریخ پر لوٹاتا ہے۔
datetime\now
datetime\now() Returns current datetime.
تاریخ، وقت/ابھی
تاریخ، وقت/ابھی() موجودہ تاریخ اور وقت پر لوٹاتا ہے۔

datetime\format
تاریخ کا وقت/فارمیٹ
datetime\format(VALUE, [TIMEZONE], [FORMAT]) Converts date or datetime VALUE into string formatted according to application settings. TIMEZONE and FORMAT can be omitted. If TIMEZONE is omitted then default time zone will be used. If FORMAT is omitted then default format will be used.
تاریخ، وقت/فارمیٹ(قدر, [ٹائم زون], [فارمیٹ]) تاریخ یا تاریخ کے وقت کی قدر کو لڑی میں تبدیل کرتا ہے جو درخواست کی گئی ترتیبات کے مطابق ڈھلی ہوتی ہے۔ ٹائم زون اور فارمیٹ چھوڑے جاسکتے ہیں۔ اگر ٹائم زون کو چھوڑ دیا جائے تو معیاری ٹائم زون استعمال کیا جائے گا۔ اگر فارمیٹ کو چھوڑ دیا جائے تو معیاری فارمیٹ استعمال کیا جائے گا۔
datetime\date
تاریخ،وقت/تاریخ
datetime\date(VALUE, [TIMEZONE]) Returns date of the month (1-31). 0 if VALUE is empty. If TIMEZONE is omitted then system timezone is used. (since version 4.7.0)
تاریخ،وقت/مواد(قدر،ٹائمزون) اس ماہ کی تاریخ کو لوٹاتا ہے (ایک سے اکتیس تک)۔ 0 اگر قدر خالی ہو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\month
تاریخ،وقت/مہینہ
datetime\month(VALUE, [TIMEZONE]) Returns month (1-12). 0 if VALUE is empty. If TIMEZONE is omitted then system timezone is used. (since version 4.7.0)
تاریخ،وقت/مہینہ(قدر، ٹائم زون) مہینے کو لوٹاتا ہے (ایک سے بارہ تک)۔ صفر ہوگا اگر خالی قدر ہو تو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\year
تاریخ،وقت/سال
datetime\year(VALUE, [TIMEZONE]) Returns year. 0 if VALUE is empty. If TIMEZONE is omitted then system timezone is used. (since version 4.7.0)
تاریخ،وقت/سال(قدر،ٹائم زون) سال کو لوٹاتا ہے۔ صفر ہوگا اگر خالی قدر ہو تو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\hour
تاریخ،وقت/گھنٹہ
datetime\hour(VALUE, [TIMEZONE]) Returns hour (0-23). -1 if VALUE is empty. If TIMEZONE is omitted then system timezone is used. (since version 4.7.0)
تاریخ،وقت/گھنٹہ (قدر، ٹائم زون) گھنٹے کو لوٹاتا ہے (صفر سے تیئیس تک)۔ منفی ایک اگر قدر خالی ہو تو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\minute
datetime\minute(VALUE, [TIMEZONE]) Returns minute (0-59). -1 if VALUE is empty. If TIMEZONE is omitted then system timezone is used. (since version 4.7.0)
تاریخ،وقت/منٹ
تاریخ،وقت/منٹ (قدر، ٹائم زون) منٹوں کو لوٹاتا ہے (صفر سے انسٹھ تک) ۔ منفی ایک اگر قدر خالی ہو تو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\dayOfWeek
datetime\dayOfWeek(VALUE, [TIMEZONE]) Returns day of the week (0-6). -1 if VALUE is empty. 0 - for Sunday. If TIMEZONE is omitted then system timezone is used. (since version 4.7.3)
تاریخ،وقت/ہفتے کا دن
تاریخ،وقت/ہفتے کا دن (قدر، ٹائم زون) ہفتے کا دن لوٹاتا ہے (صفر سے چھے تک) منفی ایک اگر قدر خالی ہو تو۔ منفی صفر اگر اتوار کا دن ہو۔ اگر ٹائم زون کو چھوڑ دیا جائے تو نظام کا ٹائم زون استعمال کیا جاتا ہے۔ (چار عشاریہ سات زیرو ورژن سے)
datetime\diff
datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE) Returns difference between two dates or datetimes. INTERVAL_TYPE can be 'years', 'months', 'days', 'hours', 'minutes'. Returns null if failure. Result will be negative if VALUE_1 < VALUE_2.
تاریخ،وقت/فرق
تاریخ،وقت/فرق (پہلی قدر، دوسری قدر، وقفے کی قسم) دو تاریخو یا تاریخ کے اوقات میں فرق کو لوٹاتا ہے۔ وقفے کی قسم 'سال'،'مہینے'،'دن'،'گھنٹے'،منٹ' ہو سکتا ہے۔ اگر ناکامی ہو تو null لوٹتا ہے۔ نتیجہ نفی میں لوٹتا ہے اگر پہلی قدر دوسری سے چھوٹی ہو۔
