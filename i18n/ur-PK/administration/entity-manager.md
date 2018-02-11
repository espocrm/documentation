
Entity Manager
وجودی منتظم
Entity Manager is available in Administration panel. It provides an ability to highly customize your EspoCRM instance. You are able to do the following:
وجودی منتظم انتظامیہ کے پینل پر دستیاب ہوتا ہے۔ یہ آپ کے مثالی ایسپو سی آر ایم کو اعلیٰ درجے کا بنانے کی آپ کو اہلیت مہیا کرتا ہے۔ آپ درج ذیل کام کرنے کے قابل ہیں:
•	Add new types of entities.
•	Customize existing types of entities: change labels, default order in list view, enable or disable stream.
•	Configure fields: add new, customize existing ones.
•	Configure relationships: add new, change labels of existing ones.
نئی اقسام کی شناختوں کو شامل کریں
پہلے سے موجودہ وجودی چیزوں کی اقسام کو اپنی مرضی کے مطابق تبدیل کریں: عنوانات کو تبدیل کریں، دکھانے والی فہرست کو معیاری آپشن حکم پر رکھیں، سٹریم (برقی ندی) کو فعال یا غیر فعال کریں۔
شعبوں کو تشکیل دیں: نئے شامل کریں، پہلے سے موجودہ کو اپنی مرضی کے مطابق ڈھالیں
تعلقات کو تشکیل دیں: نئے شامل کریں، پہلے سے موجودہ کے عنوانات تبدیل کریں

Creating new entity
Click Create Entity button on Entity Manager page. Specify name, labels and type. If you select Person type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check Stream if you want your entity to have stream panel and users to be able to Follow entities of this type.
نئی شناخت کی چیز(وجود) کو بنانا
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
Relationships
تعلقات
You can create new relationships between both out-of-box and custom entities. There are 3 available relationship types:
آپ خانے سے باہر اور خود بنائی ہوئی وجودی شناختوں دونوں کے ساتھ نئے تعلقات بنا سکتے ہیں۔ تین قسم کے تعلقات مہیا ہوتے ہیں:
•	One-to-Many: after you have created this relationship you can put a link field to the detail layout of the right entity and add relationship panel to the left entity;
•	Many-to-One: the same as One-to-Many but vice versa;
•	Many-to-Many: relationship panels on both sides.
•	ایک-سے-زیادہ: جب آپ نے تعلقات بنے لیے تو آپ دائیں وجود کی لے آؤٹ تفصیلات میں ایک ربط فیلڈ ڈال سکتے ہیں اور بائیں وجود کےلیے تعلقات پینل شامل کر سکتے ہیں۔
•	بہت-سے-ایک: بالکل ایک-سے-بہت جیسا مگر اس کے الٹ ؛
•	بہت-سے-بہت: دونوں طرف سے تعلقات پینلز۔
Parameter 'Link Multiple Field' implies that the field of linkMultiple type will be created along with relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of detail view screen.
If parameter 'Audited' is checked then updates of the relationship will be logged in Stream.
'بہت سے شعبوں کا ربط' کی متعین مقدار یہ دلالت کرتی ہے کہ linkMultiple کی قسم تعلقات کے ہمراہ بنائی جائے گی۔ آپ ایسا شعبہ لے آؤٹ پر بھی ڈال سکتے ہیں۔ یہ متعلقہ ریکارڈس کو جلدی سے اٹھانے کےلیے آرام دہ ہے۔ یہ اچھا اختیار نہیں اگر آپ کا تعلق بہت سے مربوط ریکارڈ سے اس لیے ہے کہ وہ تفصیل کے منظر کی تختی کی لوڈنگ کو آہستہ کر دے۔
اگر متعین مقدار 'Audited' ہے (پڑتال کیا ہوا) منتخب کردہ ہے تو تعلقات کی تجدیدات سٹریم (برقی ندی) میں داخل کر دی جائیں گی۔
