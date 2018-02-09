Business Process Management
کاروباری عمل کا انتظام
Business Process Management (BPM) tool provides the ability to model and automate business processes in EspoCRM. It's an engine executing business processes described in BPMN 2.0 standard. BPM tool is available in Advanced Pack extension.
کاروباری عمل کے انتظام کا آلہ ایسپو سی آر ایم (انتظام برائے تعلقاتِ صارف) کاروباری عمل کو خودکار اور نمونہ بنانے کی اہلیت مہیا کرتا ہے۔ معیاری بی پی ایم این BPMN 2.0  میں بیان کردہ کاروباری اعمال کے مطابق یہ انجن عمل کرتا ہے۔ 

BPM example
Difference from Workflows tool
بی ایم پی(کاروباری عمل کے انتظام
کے آلے) کی مثال
کام کے بہاؤ(شرح ترقی) کے آلے سے فرق

Workflows tool is intended for automation of simple business rules, w/o sequential flow items, when there is no need to display the flow graphically.
کام کے بہاؤ کا آلہ سادہ کاروباری اصولوں کی خودکاری کےلیے  ہے کہ جبترتیب وار چیزوں (کاموں) کے  ترسیمی عمل کو ظاہر کرنے کی ضرورت نہ ہو۔

BPM tool is intended for more complex business flows, where there can be diverging and converging flows, execution delays, user interactions. A flowchart view makes the business process more comprehensible for a human, a log allows to see how the process was held.
Process Flowcharts
بی پی ایم آلہ مطلوب ہے مزید پیچیدہ کاروباری افعال کےلیے جہاں پر کہ افعال کا میلان و انتشار ہو، عملدرآمد کا التواء، استعمال کنندوں کا باہمی تعلق ہو۔ کام کا لائحہ عمل کاروباری عمل کو انسان کےلیے مزید قابل فہم بناتا ہے، ایسا لاگ جو یہ بتاتا ہے کہ یہ عمل کیسے کیا گیا تھا۔
پراسیس (عمل) کا گراف چارٹ

The link to process flowcharts is available from administration panel. It also can be added as a tab on the navigation panel.
عمل کے گراف چارٹوں کا ربط انتظامی پینل پر دستیاب ہوتا ہے۔ یہ نیوی گیشن پینل پر ایک ٹیب کی صورت میں شامل کیا جاسکتا ہے۔.

Flowcharts are intended for business processes modeling. Administrator can create and edit flowcharts. Regular users can only view flowcharts.
گراف چارٹ کاروباری عمل کا نمونہ پیش کرنے کےلیے مطلوب ہوتے ہیں۔ منتظم گراف چارٹوں کو بنانے کے ساتھ ان کی ترمیم کر سکتا ہے۔ باقاعدہ استعمال کنندے ان چارٹوں کو صرف دیکھ سکتے ہیں۔

Every flowchart has its specific entity type (Target Type field). The flowchart determines execution of future process instances. It comprises flowchart elements and connections between elements.
ہر گراف چارٹ خصوصی شعبوں کے اہداف کےلیے اپنا ایک خاص قسم کا وجود رکھتا ہے۔ گراف چارٹ مستقبل کے مثالی کام کے عملدرآمد کو بتاتا ہے۔  یہ اپنے ذیلی عناصر اور ان کے درمیان روابط پر مشتمل ہوتا ہے۔  

If process flowchart has the unchecked 'Is Active' field then it won't initiate process instances.
اگر گراف چارٹ کے عمل میں 'Is Active' کا شعبہ غیر منتخب ہے تو یہ مثالی عمل کو شروع نہیں کرے گا۔

To show details and parameters of a certain flowchart element you need to click on it. In edit mode you will be able to edit parameters.
کسی خاص گراف چارٹ کے عناصر کی تفصیلات اور متعین مقداروں کو ظاہر کرنے کےلیے آپ کو اس پر کلک کرنا ہوگا۔ ترمیمی طرز میں آپ ان متعین مقداروں کی ترمیم کرسکیں گے۔

Processes
Processes are available from administration panel. The link also can be added as a tab on the navigation panel.
پراسسز(عمل)
منتظم پینل سے طریقہ کار دستیاب ہوتے ہیں۔ نیوی گیشن ٹیب میں اس کا ربط شامل کیا جا سکتا ہے۔

Process represents business process instance. When it's initiated it gets the status 'Started'. When process is finished it gets the status 'Ended'. The process can also be stopped manually by a user who has an access to edit the process. If it's stopped manually it gets status the 'Stopped'.
طریقہ عمل مثالی کاروباری عمل کو پیش کرتا ہے۔ جب اس کی ابتداء ہوتی ہے تو اسے 'Started' کا مقام (سٹیٹس) مل جاتا ہے۔ جب یہ پراسیس ختم ہوتا ہے تو اس کو 'Ended' کا سٹیٹس (مقام) ملتا ہے۔ وہ استعمال کنندہ بھی اس پراسیس کو مینوئلی روک سکتا ہے جسے اس عمل کی ترمیم تک رسائی حاصل ہو۔ اگر اسے مینوئل روکا جائے تو یہ  'Stopped' کا سٹیٹس حاصل ہوجاتا ہے۔

The process is executed according the flowchart. Flowchart of process can't be changed after process is started.
اس کا عملدرآمد گراف چارٹ کے مطابق ہوتا ہے۔ گراف چارٹ پراسیس (عمل) کے شروع ہونے کے بعد تبدیل نہیں کیا جا سکتا۔

The process obligatorily is related to single target record.
یہ عمل لازمی طور پر ایک ہی ہدف کے ریکارڈ سے متعلق ہوتا ہے۔

Processes can be started automatically (upon specific conditions or by scheduling) or manually (where there is at least one Start Event in the flowchart). To start process manually the user needs to click 'Start Process' button on the list view of processes.
پراسسز( خاص حالات میں یا پہلے سے ترتیب شدہ ہونے پر) خودکار طور پر بھی شروع ہو سکتے ہیں یا مینوئلی (جب گراف چارٹ میں کم از کم ایک ابتدائی مرحلہ موجود ہو)۔ اس عمل کو مینوئل شروع کرنے کےلیے استعمال کنندہ کو پراسیسز کی فہرست میں 'Start Process' بٹن پر کلک کرنے کی ضرورت ہوتی ہے۔

Flowchart Elements
Events
گراف چارٹ کے عناصر
مراحل

Events are displayed on a flowchart as circles.
Start Event
گراف چارٹ پر مراحل دائروں کی صورت میں ظاہر ہوتے ہیں۔

Doesn't have parameters. It's a starting point of the process. Start Event can be initiated manually by a user who has an access to create processes. The user needs to click 'Start Process' button on the list view of processes.
ابتدائی مرحلہ کی کوئی متعین مقداریں نہیں ہوتیں۔ یہ اس عمل کا ابتدائی نقطہ ہے۔ ابتدائی مرحلہ ایسے استعمال کنندہ کی طرف سے مینوئل شروع کیا جاسکتا ہے کہ جسے پراسیسز کو بنانے تک رسائی ہوتی ہے۔ پھر استعمال کنندہ کو پراسسز والی فہرست پر 'Start Process' کے بٹن پر کلک کرنے کی ضرورت ہوتی ہے۔

Conditional Start Event
مشروط شروع کرنے والا مرحلہ۔

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two types of trigger: 'After record created', 'After record saved'.
عمل (پراسس) کا ایک ابتدائی نقطہ ہے۔ جب خاص حالات ہوں تو یہ خودکار طور پر متحرک ہو جاتا ہے۔ اس ٹرگر کی دو اقسام ہیں: 'After record created', 'After record saved'.

Timer Start Event
ابتدائی مرحلے کا ٹائمر۔

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records for initiating processes and scheduling in crontab notation.
یہ عمل کا ابتدائی نقطہ ہے۔۔ یہ پراسسز کو ترتیب سے شروع کرتا ہے۔  آپ کو رپورٹ کی فہرست مخصوص کرنے کی ضرورت ہے کہ جو ابتدائی پراسسز اور ترتیبات کے ریکارڈز کو ‘crontab’ نوٹیشن میں لوٹاتاہے۔

Conditional Intermediate Event
مشروط درمیانی مرحلہ۔

This event stops the flow until specified criteria is met.
یہ مرحلہ کام کے بہاؤ کو تب تک روک دیتا ہے جب تک کہ مخصوص معیار پورا نہیں ہو جاتا۔

Timer Intermediate Event
درمیانی مرحلے کا ٹائمر

This event stops the flow and waits as long as is specified by event's parameters.
یہ مرحلہ بہاؤ کو روک دیتا ہے اور انتظار کرتا ہے جب تک مرحلے کی متعین مقداروں کی جانب سے مخصوص ہوتا ہے۔
For more complex timer settings you can utilize formula. Formula scripts should return Date-Time value (in UTC timezone). Once this time comes the flow will be proceeded to the next element.
مزید پیچیدہ ٹائمر ترتیبات کےلیے آپ کلیے (فارمولے) کا استعمال کرسکتے ہیں۔ فارمولہ سکرپٹ  کو تاریخ-وقت کی قدر (آفاقی مربوط وقت کے ٹائم زون کے مطابق) لوٹانی چاہیے۔ ایک دفعہ جب وہ وقت آجائے تو کام اگلے عنصر کی طرف بڑھ جائے گا۔

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.
تاریخ-وقت/قریب-ترین کلیے کا استعمال کرتے ہوئے یہ ممکن ہے کہ ٹائمر کو مستقبل کے ایک خاص وقت کےلیے سیٹ کر دیا جائے، مثال کے طور پر نئے کام کے دن کی ابتداء۔
End Event
Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there is no anything running in parallel then process ends.
آخری مرحلہ موجودہ بہاؤ کو ختم کرتا ہے۔ یہ متوازی چلتے ہوئے بہاؤ کو ختم نہیں کرتا۔ جب کام کا بہاؤ آخری مرحلے پر پہنچتا ہے اور اگر اس کے متوازی کوئی کام نہ چل رہا ہو تو پراسیس ختم ہوجاتا ہے۔

Terminate End Event
Ends all flows. Process is subsequently ended.
ختم کرنے والا آخری مرحلہ کام کے ہر بہاؤ کو ختم کر دیتا ہے۔ پراسیس (عمل) بعد میں ختم ہو جاتا ہے۔

Gateways
Gateways are displayed as diamonds.
گیٹ ویز (دروازے)
یہ دروازے ہیروں کی مانند دکھائی دیتے ہیں۔

Exclusive Gateway
Can diverge or converge flows.
خصوصی دروازے بہاؤ کو منتشر اور ملا سکتے ہیں۔

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.
انتشار کی صورت میں یہ ایک ہی بہاؤ (راستے) کی وضاحت کرتا ہے جو کہ مخصوص معیار کے مطابق چنا جائے گا۔ پہلی پوری ہونے والی شرط بہاؤ کا تعین کرتی ہے، اگلی شرائط نکال دی جاتی ہیں۔ یہ ایک صلاحیت ہوتی ہے جو معیاری بہاؤ کو مخصوص کرتی ہے۔ معیاری بہاؤ چنا جاتا ہے جب کوئی شرط پوری نہ ہو۔ معیاری بہاؤ کا سلیش کی علامت سے نشان لگا ہوتا ہے۔
In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.
بہاؤ کے میلان کی صورت میں یہ صرف بہاؤ کو باہر جاتے ہوئے عنصر کی طرف رخ دیتا ہے۔  جب بہاؤ وہاں آتے ہیں تو یہ رکتا نہیں، اس لیے متوازی بہاؤ ایک ہی بہاؤ میں ضم نہیں ہوتے۔
exclusive gateway divergent
خصوصی انتشار کا گیٹ وے (دروازہ)
exclusive gateway convergent
خصوصی میلان کا گیٹ وے (دروازہ)

Inclusive Gateway
Can diverge or converge flows.
مشمول گیٹ وے (دروازہ) بہاؤ کو منتشر یا ملا سکتا ہے۔

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.
انتشار کی صورت میں یہ ایک یا زیادہ متوازی بہاؤ (راستوں) میں سے ہر ایک کو ان کے معیار پر پورا اترنے کے حساب سے رخ دیتا ہے۔ معیاری بہاؤ اختیار کیا جاتا ہے اگر کوئی شرط پوری نہ ہو۔ معیاری بہاؤ کا سلیش کی علامت سے نشان لگا ہوتا ہے۔

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.
اگر مشمول گیٹ وے (دروازے) سے پیدا ہونے والے متوازی بہاؤ کو ضم کرنے کی ضرورت ہو تو آپ کو میلان والے مشمول گیٹ وے کے استعمال کی ضرورت ہوگی۔ یہ تمام آنے والے بہاؤ کا انتظار کرے گا اور پھر باہر جانے والے عنصر کی طرف جاری ہوجائے گا۔

inclusive gateway
مشمول گیٹ وے

Note: Diverging and converging gateways must be balanced.
نوٹ: انتتشار اور میلان والے دروازوں کا متوازن ہونا ضروری ہے۔

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.
نوٹ: اگر ایک متوازی بہاؤ کسی وجہ سے ختم ہو جائے تو انتشاری گیٹ وے کبھی نہیں تیار ہو سکے گا۔ یہ عمل رک جائے گا۔ ایسے گراف چارٹ سے بچیے جو اس طرح کی صورتحال پیدا کرسکتا ہے۔

Parallel Gateway
Can diverge or converge flows.
متوازی گیٹ وے بہاؤ کو منتشر اور ملا سکتا ہے۔

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.
انتشار کی صورت میں یہ بہاؤ کو زیادہ متوازی بہاؤ(راستوں) میں تقسیم کر دیتا ہے۔ اس طرح کے گیٹ وے کےلیے کوئی متعین مقداریں نہیں ہوتیں۔

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.
میلان کی صورت میں یہ انتظار کرتا ہے جب تک کہ تمام آمدہ بہاؤ آجائیں اور پھر یہ اگلے باہر جانے عنصر کی طرف جاری ہوجاتا ہے۔

parallel gateway
متوازی گیٹ وے

Note: Diverging and converging gateways must be balanced.
نوٹ: انتتشار اور میلان والے دروازوں کا متوازن ہونا ضروری ہے۔

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.
نوٹ: اگر ایک متوازی بہاؤ کسی وجہ سے ختم ہو جائے تو انتشاری گیٹ وے کبھی نہیں تیار ہو سکے گا۔ یہ عمل رک جائے گا۔ ایسے گراف چارٹ سے بچیے جو اس طرح کی صورتحال پیدا کرسکتا ہے۔

Event Based Gateway
Can only diverge flows.
مرحلے کی بنیاد پر گیٹ وے صرف بہاؤ کو منتشر کر سکتا ہے۔

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.
یہ باہر جانے والے مراحل کے شروع ہونے تک بہاؤ کو روک دیتا ہے۔ شروع ہونے والا مرحلہ  واحد بہاؤ کا تعین کرتا ہے۔ باقی باہر جانے والے مراحل مسترد ہوجاتے ہیں۔
Only intermediate events can be on the other end of outgoing sequence flows.
صرف درمیانی مراحل ہی باہر جانے والے ترتیبی بہاؤ کے آخری سرے پر ہوسکتے ہیں۔

event based gateway
مرحلے کی بنیاد پر گیٹ وے

Activities
سرگرمیاں

Activities are displayed as rounded rectangles.
سرگرمیاں دائروی مستطیلوں کی صورت میں دکھائی دیتی ہیں۔

Task
ٹاسک (کام)

Task can execute following the actions:
ٹاسک مندرجہ ذیل افعال سرانجام دے سکتا ہے۔

    Create Record - creates new record of any entity type;
    Create Related Record - creates new record related to the target record;
    Update Target Record;
    Update Related Record - updates the record or records related to the target record;
    Update Created Record - updates specific field of any record created in the current process;
    Update Process Record - can be used to assign the process to specific user or team;
    Link to Another Record - links the target record with a specified record;
    Unlink from Another Record - unlinks the target record from the specified record;
    Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
    Create Notification - creates in-app notification for specific users;
    Make Followed - makes specific users follow the target record, the process record or any record created by the process;
    Run Service Action - runs custom service actions implemented by developers.
ریکارڈ بناتا ہے – کسی بھی شناخت کے نئے ریکارڈ بناتا ہے؛
متعلقہ ریکارڈ بناتا ہے – کسی بھی ہدف سے متعلقہ نئے ریکارڈ بناتا ہے؛
ہدفی ریکارڈ کی تجدید کرتا ہے؛
متعلقہ ریکارڈ کی تجدید کرتا ہے – ریکارڈ یا ہدفی ریکارڈ سے متعلق ریکارڈوں کی تجدید کرتا ہے؛
بنائے ہوئے ریکارڈ کی تجدید کرتا ہے – موجودہ عمل میں کسی بھی شعبے کے بنائے گئے ریکارڈ کی تجدید کرتا ہے؛
عمل کے ریکارڈ کی تجدید کرتا ہے – کسی مخصوص استعمال کنندہ یا ٹیم کی طرف عمل کو تفیض کرنے کےلیے استعمال ہوسکتا ہے؛
کسی دوسرے ریکارڈ سے مربوط کرتا ہے – ہدفی ریکارڈ کو کسی مخصوص ریکارڈ سے مربوط کرتا ہے؛
کسی دوسرے ریکارڈ سے غیر منسلک (منقطع) کرتا ہے- ہدفی ریکارڈ کو کسی مخصوص ریکارڈ سے غیر منسلک کرتا ہے؛
تفویضی کردار کو لاگو کرتا ہے – ہدفی کردار کو تفویض کرتا ہے، ریکارڈ کو تیار کرتا ہے یا کسی بھی ریکارڈ کو مخصوص اصول کے تحت بناتا ہے؛
اطلاعات کو بناتا ہے – ایپ کے اندر مخصوص استعمال کنندہ کےلیے اطلاعات کو بناتا ہے؛
پیروی ممکن بناتا ہے – مخصوص استعمال کنندوں کو ہدفی ریکارڈ کی پیروی کرواتا ہے، ریکارڈ کو یا پراسس میں بنے ہوئے ریکارڈ کو تیار (پراسس) کرتا ہے؛
سروس ایکشن (دیکھ بھال والے کام) کو چلاتا ہے – ڈویلپرز کی طرف سے لاگو کردہ سروس ایکشن (افعال) کو چلاتا ہے؛

Actions available for task are almost the same as in Workflow feature. See more details about workflow's actions.
کام کے بہاؤ والی خصوصیت میں ٹاسک کےلیے مہیا اکثر افعال ایک یسے ہوتے ہیں۔ کام کے بہاؤ کے افعال (ایکشنز) کے بارے میں مزید تفصیلات دیکھیے۔
Send Message Task
Sends email message to specific recipient.
سینڈ میسج ٹاسک (مقررہ کام کا پیغام بھیجنے والا) مخصوص وصول کنندے کو ایمیل پیغام بھیجتا ہے۔

User Task
Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.
یوزر ٹاسک (استعمال کنندے کا مقررہ کام) استعمال کنندے سے رابطے کےلیے لچکدار اہلیت فراہم کرتا ہے۔ یہ تنصیب روک دیتا ہے جب تک کہ استعمال کنندہ ( جو مخصوص کیا گیا ہو یا تفویض کردہ ہو) ٹاسک کو حل کرتا ہے۔ پراسس یوزر ٹاسک ریکارڈ (استعمال کنندے کے ٹاسک ریکارڈ کا عمل) سسٹم میں بنا دیا جائے گا۔ معیار کے مطابق ایکشنز کی تین اقسام ہیں: ایپروو (منظور کرنا) ، ریویو (جائزہ لینا) ، ایکامپلش (تکمیل کرنا)۔ 

    Approve type requires the user to chose between 'Approved' and 'Declined'.
    Review type gives only one option: 'Reviewed'.
    Accomplish type has two options: 'Completed' and 'Failed'.
ایپروو (منظوری) والی قسم میں استعمال کنندے کو 'Approved'  اور   'Declined'میں سے کسی ایک کو چننا ہوتا ہے۔
ریویو (جائزے) والی قسم صرف ایک آپشن دیتی ہے: 'Reviewed'
ایکامپلش (تکمیل) والی قسم میں دو آپشنز ہوتے ہیں: 'Completed'  اور  'Failed'

The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.
بنائے گئے استعمال کنندہ کے مقرر کردہ ریکارڈ کے عمل کی طرف تفویض کردہ استعمال کنندہ کو ایپ میں اطلاعات موصول ہوں گی۔ منتظم ای میل اطلاعات کو بھی فعال کر سکتا ہے۔ 

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.
استعمال کنندے پراسس یوزر ٹاسک ڈیشلٹ (یوزر کے مقررہ ڈیشلٹ کے عمل) کو حقیقی پراسیس یوزر ٹاسک دیکھنے کےلیے اپنے ڈیش بورڈ پر بھی شامل کرسکتے ہیں۔
It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.
یہ ممکن ہے کہ انتشاری گیٹ وےز (دروازوں) یا مشروط مراحل، جذباتی عمل کے بہاؤ میں دبائے ہوئے یوزر ٹاسک کی قرارداد پڑھی جائے۔

Script Task
Executes the script in espo-formula language. All set variables ($variableName) will be stored and available within the process.
سکرپٹ ٹاسک سکرپٹ کی ہسپانوی-فارمولے والی زبان میں سکرپٹ کی تنصیب کرتا ہے۔ تمام سیٹ کردہ متغیرات ($variableName) پراسیس کے اندر محفوظ اور مہیا ہوں گی۔
Flows
Sequence Flow
Represented as a solid arrow. Indicates the order in which process elements will be executed.
بہاؤ 
ترتیبی بہاؤ ٹھوس قطار کی نمائندگی کرتا ہے۔ یہ اس ترتیب کی طرف اشارہ کرتا ہے جس میں پراسس کے عناصر کی تنصیب کی جائے گی۔ 

Conditions
Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.
شرائط
مشروط مراحل، خصوصی یا مشمول انتشاری گیٹ ویز کی شرائط ہوتی ہیں جو پراسیس (عمل) کے بہاؤ کا تعین کرتی ہیں۔

Through UI there is an ability to check conditions for the following records:
یوزر انٹرفیس کے ذریعے ان شرائط کو مندرجہ ذیل ریکارڈز کےلیے جانچنے کی اہلیت ہوتی ہے۔

    Target record;
    Records related to the target through many-to-one and children-to-parent relationships;
    Records created by the process via tasks;
    User task records, which allows checking the resolution.
ہدفی ریکارڈ؛
ایسے ریکارڈ جو زیادہ-سے-ایک اور بچوں-سے-والدین کے تعلقات کے ذریعے ہدف سے جڑے (متعلقہ) ہوتے ہیں؛
مقررکردہ کاموں (ٹاسک) کے ذریعے پراسس سے بنے ہوئے ریکارڈز؛
یوزر ٹاسک ریکارڈز (استعمال کنندے کے مقررہ ریکارڈز)، جو قرارداد کو جانچنے کی اجازت دیتے ہیں۔

It's also possible to define conditions in Espo-formula language.
یہ بھی ممکن ہے کہ شرائط کی ہسپانوی-فارمولے والی زبان میں تعریف کی جائے۔

Conditions in BPM tool are the same as in Workflow feature. See more details about workflow's conditions.
بی ایم پی ٹول (کارباری عمل کے انتظام کے آلے) میں شرائط کام کے بہاؤ والے فیچر کی شرائط کی طرح ہیں۔ کام کے بہاؤ کی شرائط  سے متعلقہ مزید تفصیلات دیکھئے۔
Examples
مثالیں

Example 1
 پہلی مثال
https://github.com/espocrm/documentation/raw/master/_static/images/administration/bpm/example-1.png

Example 2
 دوسری مثال
https://github.com/espocrm/documentation/raw/master/_static/images/administration/bpm/example-2.png

Example 3
تیسری مثال
https://github.com/espocrm/documentation/raw/master/_static/images/administration/bpm/example-3.png
