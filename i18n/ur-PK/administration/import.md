Import
درآمد
Import is accessible only for admin users. Administration > Import. You are able to import only from CSV files.
درآمد (امپورٹ) تک صرف منتظم ارکان کی رسائی ہوتی ہے۔ Administration > Import. آپ صرف سی ایس وی فائلوں سے درآمد (امپورٹ) کرنے کر قابل ہوں گے۔

Step 1
Select what type of records you need to import (Entity Type field). Select a CSV file. A file should be formated with UTF-8. Select What to do?. Available options: 'Create Only', 'Create & Update', 'Update Only'.
پہلا مرحلہ
آپ کو جس قسم کے ریکارڈز کو امپورٹ (درآمد) کرنے کی ضرورت ہے اسے منتخب کیجئے (شناخت کے شعبے کی قسم)۔
ایک سی ایس وی فائل کو منتخب کیجئے۔ یہ  فائل UTF-8. فارمیٹ میں ہونی چاہیے۔ What to do?. کو منتخب کیجئے۔ مہیا آپشنز یہ ہیں: 'Create Only', 'Create & Update', 'Update Only'. ("صرف بنائیے"، :بنائیے اور تجدید کیجئے"، "صرف تجدید کریں")

•	Create Only - select it if you want record be only created.
•	Create & Update - records will be created but if records with matching field values will be found it will be updated. You will be able to check what fields to match by on the Step 2.
•	Update only - only records with matching field values will be found it will be updated.
Create Only – اسے منتخب کیجئے اگر آپ ریکارڈ کو صرف بنانا چاہتے ہیں۔
Create & Update – ریکارڈ بنائے جائیں گے لیکن اگر ملتے جلتے شعبے والی قدریں پائی گئیں تو ان کی تجدید ہو جائے گی۔ آپ دوسرے مرحلے میں یہ جانچ سکیں گے کہ کون سے شعبے مشابہت رکھتے ہیں۔
 Update only صرف ملتے جلتے شعبے کی قدریں تلاش کرکے ان کی تجدید کی جائے گی۔
Once you select a csv file you will be able to see how it should be parsed in Preview panel. When you change properties the preview will be updated.
•	Header Row - whether CSV file has the first row with field names.
•	Execute in idle - recommended if you have a big bunch of records to be imported. Import will be processed via cron. Status will be set to 'Complete' when import process is finished.
•	Skip searching for duplicates - it will decrease import runtime.
Click Next button to preceed to the Step 2.
جب آپ ایک مرتبہ سی ایس وی فائل کو منتخب کریں تو آپ دکھائے جانے والے پینل میں یہ دیکھ سکیں گے کہ ان کا کس طرح تجزیہ کیا جا سکتا ہے۔ جب آپ خصوصیات کو تبدیل کردیں تو ان کے پیش منظر کی بھی تجدید ہوجائے گی۔
Header Row – اگر سی ایس وی فائل کی پہلی قطار شعبوں کے نام کے ساتھ ہے۔
Execute in idle – اگر بہت زیادہ ریکارڈز کو درآمد کرنا ہو تو یہ آپشن تجویز کردہ ہے۔  درآمد (امپورٹ) cron کے ذریعے عمل میں لائی جائے گی۔ جب امپورٹ (درآمدی) عمل ختم ہو جائے تو سٹیٹس 'Complete' پر سیٹ ہو جائے گا۔
Skip searching for duplicates یہ اختیار امپورٹ آپشن کو کم کردے گا۔
دوسرے مرحلے کی طرف منتقل ہونے کےلیے Next کے بٹن پر دبائیے۔
 
Step 2
Setup the field mapping: how fields correspond to columns of the csv file. You can skip not needed columns here. In cases of 'Create & Update' and 'Update only' you need to check fields by which records that should be updated will be found. Add default values you want new and updated records to set with. E.g. you can specify Assigned User or Teams fields.
After the import is done you will be able to revert created records, see duplicates and updated records. Duplicate means that there was the similar record in the system. You can remove all imported duplicates at once. Note: Revert doesn't work with updated records.
Click Run Import button to proceed. It may take some time before an import process gets finished. If you want to import a large bunch of records (depends on you server configuration, usually if more than 200 records) you need to make sure that php parameter set_time_limit is large enough.
دوسرا مرحلہ
شعبے کے نقشے کو ترتیب دیجئے: کس طرح شعبوں کی سی ایس وی فائل کے کالموں سے مشابہت ہے۔ آپ یہاں غیرضروری کالموں کو چھوڑ سکتے ہیں۔ 'Create & Update' اور 'Update only' کی صورت میں آپ کو شعبوں کا جانچنا ہوگا جس کے ذریعے ایسے ریکارڈز ملیں گے جن کی تجدید ضروری ہوگی۔ جن کے ساتھ آپ نئے اور تجدید ریکارڈز سیٹ کرنا چاہتے ہیں ان معیاری قدروں (مقداروں) کا اضافہ کیجئے۔ مظال کے طور پر آپ تفویض کردہ استعمال کنندے اور ٹیمز کے شعبوں کی تخصیص کرسکتے ہیں۔
جب درآمد مکمل ہو جائے تو آپ بنائے گئے ریکارڈز کو لوٹانے کے اہل ہوں گے، نقلوں کو اور تجدید کردہ ریکارڈز کو دیکھ سکیں گے۔ نقلوں کا مطلب یہ ہے کہ اس طرح کا مشابہ ریکارڈ سسٹم میں موجود تھا۔ آپ امپورٹ (درآمد) کی گئی تمام نقلوں کو ایک ہی وقت میں حذف کر سکتے ہیں۔ نوٹ: تجدید کردہ ریکارڈز کو لوٹانا ممکن نہیں ہوگا۔
Run Import بٹن پر کلک کر کے آگے بڑھیے۔ ہو سکتا ہے کہ درآمدی عمل کو ختم ہونے میں کچھ وقت لگ جائے۔ اگر آپ بہت زیادہ ریکارڈز کو درآمد کرنا چاہتے ہیں ( جو کہ آپ کے سرور کی تشکیلات پر منحصر ہے، عام طور پر اگر 200 ریکارڈز سے زائد ہو) تو آپ کو یقینی بنانا ہوگا کہ پی ایچ پی کی متعین مقدار set_time_limit بھیی اتنی بڑی ہے۔

 
How to import into Target List
When you import Contacts, Leads or Accounts you can add them to some target list. On the Step 2 you need to add Target List field on Default Values panel and select a needed target list record. You can also use Update only or Create & Update import to add existing targets to a target list.
جب آپ روابط، راہنمائی اور کھاتہ جات کو درآمد کرتے ہیں تو انہیں کسی ہدفی فہرست میں شامل کرسکتے ہیں۔ دوسرے مرحلے مں آپ کو ہدفی فہرست کے شعبے کو  Default Values پینل میں شامل کرنا ہوگا اور ضروری ہدفی فہرست ریکارڈ کو منتخب کرنا ہوگا۔ آپ Update only  یا  Create & Updateکو پہلے سے موجودہ اہداف کو ہدفی فہرست میں شامل کرنے کےلیے درآمد کرسکتے ہیں۔
