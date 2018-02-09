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
مشروط ابتدائی مرحلہ

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two types of trigger: 'After record created', 'After record saved'.
عمل (پراسس) کا ایک ابتدائی نقطہ ہے۔ جب خاص حالات ہوں تو یہ خودکار طور پر متحرک ہو جاتا ہے۔ اس ٹرگر کی دو اقسام ہیں: 'After record created', 'After record saved'.

Timer Start Event
ابتدائی مرحلے کا ٹائمر

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records for initiating processes and scheduling in crontab notation.
یہ عمل کا ابتدائی نقطہ ہے۔۔ یہ پراسسز کو ترتیب سے شروع کرتا ہے۔  آپ کو رپورٹ کی فہرست مخصوص کرنے کی ضرورت ہے کہ جو ابتدائی پراسسز اور ترتیبات کے ریکارڈز کو ‘crontab’ نوٹیشن میں لوٹاتاہے۔

Conditional Intermediate Event
مشروط درمیانی مرحلہ

This event stops the flow until specified criteria is met.
یہ مرحلہ کام کے بہاؤ کو تب تک روک دیتا ہے جب تک کہ مخصوص معیار پورا نہیں ہو جاتا۔

Timer Intermediate Event
درمیانی مرحلے کا ٹائمر

This event stops the flow and waits as long as is specified by event's parameters.

For more complex timer settings you can utilize formula. Formula scripts should return Date-Time value (in UTC timezone). Once this time comes the flow will be proceeded to the next element.

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.
End Event

Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there is no anything running in parallel then process ends.
Terminate End Event

Ends all flows. Process is subsequently ended.
Gateways

Gateways are displayed as diamonds.
Exclusive Gateway

Can diverge or converge flows.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.

exclusive gateway divergent

exclusive gateway convergent
Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.

inclusive gateway

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.
Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

parallel gateway

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.
Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

event based gateway
Activities

Activities are displayed as rounded rectangles.
Task

Task can execute following the actions:

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

Actions available for task are almost the same as in Workflow feature. See more details about workflow's actions.
Send Message Task

Sends email message to specific recipient.
User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

    Approve type requires the user to chose between 'Approved' and 'Declined'.
    Review type gives only one option: 'Reviewed'.
    Accomplish type has two options: 'Completed' and 'Failed'.

The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.
Script Task

Executes the script in espo-formula language. All set variables ($variableName) will be stored and available within the process.
Flows
Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.
Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

    Target record;
    Records related to the target through many-to-one and children-to-parent relationships;
    Records created by the process via tasks;
    User task records, which allows checking the resolution.

It's also possible to define conditions in Espo-formula language.

Conditions in BPM tool are the same as in Workflow feature. See more details about workflow's conditions.
Examples
Example 1

Example 1
Example 2

Example 2
Example 3

Example 3
