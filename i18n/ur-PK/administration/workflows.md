Workflows
کام کے بہاؤ
Workflows feature is available in Advanced Pack.
کام کا بہاؤ فیچر اعلٰی درجے کے پیک میں مہیا دستیاب ہوتا ہے۔
Workflows automate your business process an easy way. You can find it in the Administration panel. To create a workflow rule you need to define:
کام کا بہاؤ آپ کے کاروباری عمل کو ایک آسان طریقے سے خودکار بناتا ہے۔ آپ اس کو انتظامیہ کے پینل میں حاصل پا سکتے ہیں۔ کام کے بہاؤ کے اصول کو بنانے کےلیے آپ کو ان چیزوں کی وضاحت کی ضرورت ہے:
•	Target Entity - what entity type workflow is applied to;
•	Trigger Type - when workflow will be triggered;
•	Conditions - conditions need to be met to trigger workflow;
•	Actions - what to do if workflow is triggered.
•	ہدفی وجود – کس وجودی قسم کے کام کے بہاؤ پر لاگو ہے؛
•	محرک قسم – کام کے بہاؤ کب تحریک پائے گا( شرعو ہوگا)؛
•	شرائط – کام کے بہاؤ کو شروع کرنے کےلیے شرائط کا پورا ہونا ضروری ہے؛
•	اعمال – کام کا بہاؤ شروع ہوجائے تو کیا کرنا ہے۔
Trigger Types
محرک کی اقسام
After record created
ریکارڈ بن جانے کے بعد
Triggered only when a new record is created. If specified conditions are met then actions will be executed.
جب نیا ریکارڈ بن جائے تو اس وقت تحریک دیتا ہے۔ اگر مخصوص شرائط پوری ہو جائیں تب اعمال کی تنصیب کی جائے۔
After record saved
ریکارڈ کے  محفوظ ہونے کے بعد
Triggered when a new record is created or an existing record is updated. If specified conditions are met then actions will be executed.
جب نیا ریکارڈ بنایا جائے یا موجودہ ریکارڈ کی تجدید کی جائے تو اس وقت یہ تحریک دیتا ہے۔ اگر مخصوص شرائط پوری ہو جائیں تب اعمال کی تنصیب کی جائے۔
For workflow rules with this type of trigger it's a common practice to have a condition that checks whether some field was 'changed'. E.g. If Case's status is changed then execute some actions.
اس قسم کے محرک کے ساتھ کام کے بہاؤ کے اصولوں کےلیے یہ ایک عام مشق ہے جو ایسی شرط رکھتی ہے جو جانچتی ہے کہ آیا کچھ شعبے تبدیل ہوئے تھے۔ مثال کے طور پر اگر مقدمے کا معیار تبدیل ہوا ہے تب کچھ اعمال کی تنصیب کرتا ہے۔
Scheduled
شیڈول دیا ہوا (ترتیب دیا ہوا)
Triggered according to the defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by a specified list report. So you need also to create a list report.
توضیح کی ہوئی ترتیب کے مطابق تحریک دیتا ہے۔ آپ اسے اس طرح ترتیب دے سکتے ہیں کہ یہ ہر روز ، ہر ہفتے وغیرہ چلے۔ اعمال ایسے ریکارڈز کےلیے نصب ہوں گے جو کہ خاص رپورٹ فہرست کے ذریعے لوٹائے گئے ہوں۔ اس لیے آپ کو ایک رپورٹ فہرست کو بنانے کی ضرورت بھی ہوتی ہے۔
Scheduling is specified in a crontab notation.
یہ شیڈول ( ترتیب) کرون ٹیب کی تشریح کے ساتھ مخصوص ہے
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)

سال   (حد: 1900-3000)
ہفتے کے دن (حد: 1-7، 1 سوموار کےلیے)
سال کے مہینے (حد: 1-12)
مہینے کے دن (حد: 1-31)
گھنٹے (0-23)
منٹ (0-59)

Sequential
ترتیب وار
Used rarely. Supposed to be run by another workflow. Provides an ability to make a complex logic.
بہت کم استعمال ہوتا ہے۔دوسرے کام کے بہاؤ کے ذریعے اس کا چلنا قیاس ہوتا ہے۔ یہ ایک پیچیدہ منطق بنانے کی صلاحیت مہیا کرتا ہے۔
Note: For sequential workflows it's recommended to utilize BPM tool rather than a Workflows feature.
نوٹ: ترتیب وار کام کے بہاؤ کےلیے اس کی سفارش کی جاتی ہے کہ کام کے بہاؤ کے فیچر کی بجائے بی ایم پی آلے کو استعمال کیا جائے۔
Conditions
شرائط
You can specify conditions that must be met to trigger the workflow. There are two ways how conditions can be specified: with the UI condition builder and with formula.
آپ ایسی شرائط کو مخصوص کر سکتے ہیں جو کام کے بہاؤ کو تحریک دینے (شروع کرنے) کےلیے ضروری ہوں۔ دو طریقے ہیں کہ شرائط کو کس طرح مخصوص کیا جا سکتا ہے: استعمال کنندے کے انٹرفیس کے شرائط بنانے والے کے ساتھ اور کلیے کے ساتھ۔
UI condition builder
استعمال کنندے کے انٹرفیس کی شرائط بنانے
Some available condition types:
کچھ مہیا شرائط کی اقسام:
•	equals - the field equals to a specific value or a value of another field;
•	was equal - the field was equal to a specific value before the workflow was triggered;
•	not equals - the field does not equal to a specific value or a value of another field;
•	was not equal - the field was not equal to specific value before the workflow was triggered;
•	empty - the field value is empty;
•	not empty - the field value is not empty;
•	changed - the field was changed;
•	not changed - the field was not changed.
•	برابر ہے- برابری کے شعبے کو مخصوص قدر یا دوسرے شعبے کی قدر کے ساتھ برابر ہے
•	برابر تھا- یہ شعبہ مخصوص مقدار سے پہلے کام کے بہاؤ کو حرکت دیتا ہے؛
•	برابر نہیں – یہ شعبہ مخصوص قدر یا دوسرے شعبے کی قدر کے برابر نہیں ہوتا۔
•	برابر نہیں تھا – یہ شعبہ کام کے بہاؤ کے شروع ہونے سے پہلے مخصوص قدر کے برابر نہیں تھا؛
•	خالی –شععبے کی قدر خالی ہے؛
•	خالی نہیں – شعبے کی قدر خالی نہیں ہے؛
•	تبدیلی – شعبہ تبدیل ہو گیا تھا؛
•	تبدیل نہیں ہوا – شعبہ تبدیل نہیں ہوا تھا۔
Formula conditions
کلیے کی شرائط
Formula provides an ability to define conditions of any complexity. To read about formula syntax follow this article.
کلیہ کسی بھی پیچیدگی کی شرائط کی وضاحت کرنے کی صلاحیت مہیا کرتا ہے۔ کلیے کی ترکیب کلام کو پڑھنے کےلیے اس مضمون کی پیروی کریں۔
Note: There should not be any ; delimiter used in formula code when it determines a condition.
نوٹ جب یہ کلیہ کسی شرط کا فیصلہ کرتا ہے تو اس وقت کلیے کے کوڈ میں حدبندی کےلیے ؛ کی علامت نہیں ہونی چاہیے۔
Actions
اعمال
Send Email
ای میل کو بھیجیں
System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. Email can be sent immediately or delayed for a specific interval.
نظام ایک خاص ای میل سانچے کو استعمال کرتے ہوئے ایک ای میل بھیجے گا۔ ایک وصول کنندے کا ای میل ایڈریس ہدفی ریکارڈ، کسی متعلقہ ریکارڈ، موجودہ استعمال کنندے، پیروکاروں، جماعتی استعمال کنندوں یا مخصوص کیے ہوئے سے حاصل کیا جا سکتا ہے۔ ای میل کو فوراً یا ایک مخصوص وقفے کےلیے دیر سے بھیجا جا سکتا ہے۔
Create Record
ریکارڈ بنائیے
System will create the new record of any entity type. If there is a relationship between the target record and creating record it's possible to relate records.
نظام کسی بھی وجودی قسم میں نیا ریکارڈ بنائے گا۔ اگر ہدفی ریکارڈ اور بنائے جانے والے ریکارڈ میں کوئی تعلق ہوا تو ان ریکارڈز کو آپس میں منسلک کرنا ممکن ہے۔
There is an ability to define formula to calculate fields.
شعبوں کے حساب کےلیے کلیے کی وضاحت کےلیے ایک اہلیت ہوتی ہے۔
Create Related Record
متعلقہ ریکارڈ بنائیے
System will create the record related to the target record. It's possible to define formula to calculate fields.
نظام ہدفی ریکارڈ سے متعلق ریکارڈ بنائے گا۔ یہ ممکن ہے کہ شعبوں کے حساب کےلیے کلیے کی وضاحت کی جائے۔

Update Target Record
ہدفی ریکارڈ کی تجدید
Allows changing of specific fields of the target record. It's possible to define formula to calculate fields.
ہدفی ریکارڈ کے مخصوص شعبوں کی تبدیلی کی اجازت دیتا ہے۔ یہ ممکن ہے کہ شعبوں کے حساب کےلیے کلیے کی وضاحت کی جائے۔
If you need to add new items to the Link-Multiple field w/o loosing existing data (e.g. Teams) you need to utilize formula function entity\addLinkMultipleId. Example: entity\addLinkMultipleId('teams', 'teamId').
اگر آپ کو ایک سے زائد شعبے کے ربط سے نئی چیزوں کو پہلے سے موجودہ مواد کو ضائع کیے بغیر شامل کرنے کی ضرورت ہے (جسا کہ جماعتیں) تو آپ کو کلیے کے کام کے وجود کو استعمال کرنے کی ضرورت ہوگی۔ مثال کے طور پر:
entity\addLinkMultipleId('teams', 'teamId').
Update Related Record
متعلقہ ریکارڈ کی تجدید
Allows changing of specific fields of the related record or records. It's possible to define formula to calculate fields.
متعلق  ریکارڈ یا ریکارڈز کے مخصوص شعبوں کی تبدیلی کی اجازت دیتا ہے۔ یہ ممکن ہے کہ شعبوں کے حساب کےلیے کلیے کی وضاحت کی جائے۔

Link with Another Record
دوسرے ریکارڈ کے ساتھ ربط
Relates the target entity with another specific entity. E.g. adds specific team to the record.
ہدفی وجود کو کسی دوسرے مخصوص وجود سے منسلک کرتا ہے۔ مثال کے طور پر  ریکارڈ کے ساتھ مخصوص گروہ کو شامل کرتا ہے۔
Unlink with Another Record
دوسرے ریکارڈ کے ساتھ غیر منسلک کرنا

Unrelates the target entity from another specific entity. E.g. removes a specific team from the record.
ہدفی وجود کو کسی دوسرے مخصوص وجود سے غیر منسلک کرتا ہے۔ مثال کے طور پر  ریکارڈ کے ساتھ مخصوص گروہ کو حذف کرتا ہے۔

Apply Assignment Rule
تفویض کردہ اصول کو لاگو کریں
Assign the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.
ہدفی ریکارڈ کو تقسیمی اصول کے ذریعے استعمال کنندے کو تفویض کریں۔ یہاں دو مہیا قوانین ہیں: راؤنڈ رابن اور لیسٹ بزی۔
•	Round-Robin - users are choosen from the top to the bottom of a list (team) and then starting again.
•	Least-Busy - user who has fewer assigned records will be chosen for assignment.
•	راؤنڈ رابن – استعمال کنندے فہرست میں اوپر سے نیچے چنے جاتے ہیں اور پھر نئے سے سے شروع ہوتے ہیں۔
•	لیسٹ بزی – ایسا استعمال کنندہ جس کے چند تفویض کردہ ریکارڈ ہوں اس کو زمہ داری کےلیے چنا جائے گا۔
List Report - For Least-Busy distribution determines what records will be taken into account to calculate the number of assigned records. E.g. for Cases we need to take only records with active status.
رپورٹ کی فہرست – لیسٹ بزی کےلیے تقسیم فیصلہ کرتی ہے کہ کون سا ریکارڈ کھاتے میں لیا جائے گا تاکہ تفویض کردہ ریکارڈز کی تعداد کو معلوم کیا جاسکے۔ مثال کے طور پر ایسے مقدمات کےلیے جن کےلیے ہمیں صرف متحرک مقام والے ریکارڈز کو ہی لینے کی ضرورت ہوتی ہے۔
Create Notification
Notify specific users with the message. It's possible to use placeholders in message template: {entity} - target record, {user} - current user.
اطلاع کو بنائیے
استعمال کنندوں کو پیغام کے ذریعے اطلاع دیجئے۔ یہ ممکن ہے کہ جگہ گھھیرنے والوں کو پیغام کے سانچے میں استعمال کیا جائے: 
(وجود) – ہدفی ریکارڈ، (استعمال کنندہ) – موجودہ استعمال کنندہ۔
Make Followed
Forces specific users to follow the target entity or a specificied related entity.
پیروکار بنائیں
مخصوص استعمال کنندوں کو ہدفی وجود یا کسی خاص متعلقہ وجود کی پیروی کرنے پر ابھارتا ہے۔
Trigger Another Workflow
کسی دوسرے کام کے بہاؤ کا محرک
Allows to make sequential workflows. It's possible to branch workflow by condition: you can setup the workflow to trigger two workflows with different conditions defined in that workflows.
ترتیب وار کام کے بہاؤ کو بنانے کی اجازت دیتا ہے۔ شاخ دار کام کا بہاؤ شرائط کے ذریعے ممکن ہے:آپ کام کے بہاؤ کو اس طرح ترتیب دے سکتے ہیں کہ وہ دو ایسے کام کے بہاؤ جو کام کے بہاؤ میں مختلف شرائط کی توضیح کرتے ہوں انہیں متحرک کرسکے۔
It's possible to delay executing of sequential workflow. In the sequential wokflow you can define the condition that checks whether specifiec fields were changed since the parent workflow were triggered by using Changed and Was Equal condition types.
یہ ممکن ہے کہ ترتیب وار کام کے بہاؤ کی تنصیب کی تاخیر کی جائے۔ ترتیب وار کام کے بہاؤ میں آپ ایسی شرط کی وضاحت کر سکتے ہیں جو کہ جانچتی ہے کہ آیا مخصوص شعبے تب سے تبدیل ہوئے جب بنیادی کام کا بہاؤ "تبدیلی کی ہوئی" اور "برابر تھا" نامی شرائط کی اقسام کے ذریعے متحرک ہوا تھا۔
Note: For sequential workflows it's recommended to utilize BPM tool rather than a Workflows feature.
نوٹ: ترتیب وار کام کے بہاؤ کےلیے یہ سفارش کی جاتی ہے کہ کام کے بہاؤ کے فیچر کی بجائے بی ایم پی آلے کو استعمال کیا جائے۔
Run Service Action
سروس فعل کو چلائیے
Allows to run specific service scripts. By default there are following actions available:
خاص سروس نمونوں کو چلانے کی اجازت دیتا ہے۔ معیار کے مطابق اس میں درج ذیل افعال دستیاب ہوتے ہیں:
•	Send Invitations - for Meetings/Calls;
•	Add Quote Items - for Quotes.
•	دعوت نامے بھیجیں – مجالس/ دعوتوں کےلیے؛
•	حوالے کی چیزیں شامل کریں – حوالہ جات کےلیے۔
Developers can write their own service actions. See more detail.
سافٹ ویئر بنانے والے اپنے سروس افعال لکھ سکتے ہیں۔مزید تفصیل کےلیے دیکھیں۔
Using Formula in Actions
افعال میں کلیے کا استعمال
It's possible to define formula to calculate fields for Create Record, Update Target Record, Create Related Record, Update Related Record. For the last two, to access attributes of target entity you should use function targetEntity\attribute. To access attributes of target entity that was set before workflow was triggered use function targetEntity\attributeFetched.
یہ ممکن ہے کہ ریکارڈ بنانے، ہدفی ریکارڈ کی تجدید کرنے، متعلقہ ریکارڈ بنانے، متعلقہ ریکارڈ کی تجدید کرنے کےلیے شعبوں کے حساب کےلیے کلیے کی توضیح کی جائے۔ آخری دو کےلیے، ہدفی وجود  کی خاصیتوں تک رسائی کےلیے آپ کو یہ کام کرنا چاہیے ہدفی-وجود/خاصیت۔ ہدفی وجود کی ایسی خاصیتوں تک رسائی کےلیے کہ جو کام کے بہاؤ کے متحرک ہونے سے پہلے ترتیب دی گئی تھیں ان کےلیے اس کام کو کیجئے ہدفی وجود/نکالی ہوئی خاصیتیں۔

Example:
مثال
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
نام ٓ لڑی/ سلسلہ بندی ( ہدفی وجود/خاصیت('نام')،' ' تاریخ-وقت/آج)؛

