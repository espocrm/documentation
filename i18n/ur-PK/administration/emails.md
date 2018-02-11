Emails
ای میلز (برقی پیغامات)
Important. Cron should be configured in your system to make email fetching work. You can find the information in your EspoCRM at Administration > Scheduled Jobs.
اہم۔ ای میل کے کام کو نکالنے کےلیے کرون کو اپنے نظام میں تشکیل دینا چاہیے۔ ہم اپنے ایسپو سی آر ایم (نظام برائے تعلقات صارف) کی معلومات کو انتظامیہ میں ترتیب دیے ہوئے کام والے صفحے میں معلوم کر سکتے ہیں۔
Overview
ظاہری جائزہ
EspoCRM has an ability to monitor IMAP mailboxes. Email can be archived in two ways: Group Email Accounts and Personal Email Accounts. Group Inbound Accounts are intended for group mailboxes: the most common case is a support box. Personal Email Accounts are intended for users’ personal mailboxes.
ایسپو سی آر ایم (نظام برائے تعلقات صارف) آئی ایم اے پی میل کے خانے کی نگرانی کرنے کی صلاحیت رکھتی ہے۔ ای میل دو طریقے سے منظم کی جا سکتی ہے: گروہی ای میل کے کھاتے اور ذاتی ای میل کے کھاتے۔ گروہی مربوط کھاتے گروہی میل کے خانہ جات کےلیے مختص ہوتے ہیں۔ امدادی خانہ ایک عام سا نمونہ ہے۔ ذاتی ای میل کے کھاتے استعمال کنندہ کے ذاتی میل خانہ جات کےلیے ہوتے ہیں۔ 
As an email is coming the system tries to link it with the appropriate record (Accounts, Lead, Opportunity, Case). Users who follow that record will receive notification about a new email in the system, even if they are not in To or CC.
اگر ایک ای میل آ رہی ہو تو نظام صحیح ریکارڈ کے ساتھ اس کو جوڑنے کی کوشش کرتا ہے۔ ( کھاتے، رہنمائی، موق، مقدمہ)۔ استعمال کنندے جو اس ریکارڈ کی پیروی کرتے ہیں تو وہ اس نظام میں نئیے ای میل کے متعلق اطلاع وصول کرتا ہے اگر چہ کہ وہ وصول کنندہ کےلیے نہ بھی ہو ۔
Group Email Accounts
گروہی ای میل کے کھاتے
Only administrator can setup Group Email Accounts. Group Email Accounts can be used for both receiving and sending emails. Sending emails from group accounts has been available since 4.9.0 version.
صرف منتظم ہی گروہی ای میل کے کھاتے کو ترتیب دے سکتا ہے۔ گروہی ای میل کھاتہ ای میلوں کو وصول کرنے اور بھیجنے دونوں کےلیے استعمال ہو سکتا ہے۔گروہی کھاتے سے بھیجنے والی ای میل چار عشاریہ نو عشاریہ صفر ورژن سے مہیا ہے۔
Teams field determines which teams incoming emails will be assigned to.
جماعتی شعبہ آنے والی ای میلوں کو معلوم کرنے والی جماعتوں کی ذمہ داری کا فیصلہ کرتا ہے۔
If the group email account has SMTP and it's checked as shared then an access will be controlled by Roles through Group Email Account permission. Teams field will be used if permission level is set to 'team'.
اگر گروہی ای میل کا کھاتہ ایس ایم ٹی پی رکھتا ہو اور اس کی شراکت داری کو معلوم کرے تب اس کی رسائی گروہی ای میل کے کھاتے کی اجازت سے ہو گی۔ جماعتی شعبہ اس وقت استعمال ہوتا ہے جب اس کی اجازت کا مقام جماعت پر سیٹ ہو۔
There is an ability to make the system send an auto-reply for incoming emails.
ایک ایسا نظام بنانے کی صلاحیت ہوتی ہے جس میں آنے والی ای میلوں کا خودکار جواب بھیجا جاتا ہے۔
Email-to-Case
ای میل سے مقدمہ
There is an option to make the system create cases from incoming group emails. This feature is intended for support teams. Cases can be distributed to users from a specified team according to these ways: direct assignment, round-robin and less-busy. Only the first email in the thread creates a new case. Every subsequent one will be linked to the existing case record and displayed in its Stream panel.
ایک ایسا نظام بنانے کی گنجائش موجود ہوتی ہے جو کہ آنے والی گروہی ای میلوں کے مقدمہ کو بنا سکے ۔ یہ نمونہ امدادی جماعت کےلیے بنایا جا سکتا ہے۔ مخصوص جماعتوں کے طریقے کے مطابق یہ مقدمے استعمال کنندوں میں تقسیم کیے جا سکتے ہیں: direct assignment, round-robin  اور less-bus۔ صرف پہلی ای میل کا دھاگہ نیا مقدمہ بنا سکتا ہے۔اس کے بعد ہر آنے والا موجودہ مقدمے کی کھاتے سے منسلک ہو گا اور سٹریم پینل پر نظر آئے گا۔
When users want to send a reply to the customer they need to make sure that the case is selected as a parent of the email that is being sent. It will make the customer reply to the group email address rather than to the user’s own.
جب استعمال کنندہ اپنے گاہک کو جواب بھیجنا چاہے انہیں یقین ہونا چاہیے کہ جو ای میل بھیجی جا رہی ہے اس مقدمے کو بنیاد کے طور پر مخصوص کرتی ہے۔ اس طریقے سے گاہک کا جواب استعمال کنندہ کی بجائے گروہی ای میل کے پتے پر جائے گا۔ 
Personal Email Accounts
ذاتی ای میل کے کھاتے
Users can setup their own email accounts that need to be monitored. Emails > Top Right Dropdown Menu > Personal Email Accounts. Administrator also can manage users' email accounts.
استعمال کنندہ اپنا ای میل کے کھاتے بنا سکتا ہے جن کو نگرانی کی ضرورت ہوتی ہے۔ ای میلوں کے خانے کے اوپر سے دائیں ڈراپ ڈاؤن مینو میں ذاتی ای میل کے کھاتے۔ استعمال کنندوں کے ای میل کے کھاتوں کا انتظام منتظم اعلیٰ بھی کر سکتا ہے۔
Email Filters
ای میل فلٹر (چھاننی)
These allow the filtering of incoming emails according to specified criteria. E.g. if you don't want notification messages sent by some application to be imported to EspoCRM you can create filter to make EspoCRM skip them.
یہ آنے والی ای میل کو مخصوص نمونہ کے مطابق چھانٹی کرنے کی اجازت دیتا ہے۔ مظلاً اگر آپ کسی درخواست سے اطلاعات کے بھیجے گئے پیغامات نہیں چاہتے جو کہ ایسپو سی آر ایم کو درآمد ہوتے ہیں تو آپ ایک فلٹر (چھاننی) بنا سکتے ہیں تا کہ ایسپو سی آر ایم انہیں چھوڑ دے
Admin can create global filters, applied to all email accounts. Users can create filters for their own personal email account and for entire inbox.
منتظم عالمی فلٹرز (چھاننے) بنا سکتا ہے جو کہ سب ای میل کھاتوں پر لاگو ہوتے ہیں۔ استعمال کنندے اپنے ذاتی ای میل کے کھاتوں میں اور پورے انباکس (آمدہ پیغام خانے) کےلیے فلٹر (چھاننی) بنا سکتا ہے۔
