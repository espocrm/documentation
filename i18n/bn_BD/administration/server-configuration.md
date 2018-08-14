# EspoCRM এর জন্য সার্ভার কনফিগারেশন

EspoCRM ইনস্টল করা যেতে পারে Apache ([নির্দেশাবলী](apache-server-configuration.md)), Nginx ([নির্দেশাবলী](nginx-server-configuration.md)), অথবা IIS সার্ভার সমর্থন PHP সংস্করণ 5.6 বা বৃহত্তর এবং MySQL সংস্করণ 5.1 বা বৃহত্তর।

## কনফিগারেশন সুপারিশগুলি

### PHP এর প্রয়োজনীয়তা

EspoCRM এর প্রয়োজন PHP 5.6 বা তার চেয়েও বেশি, নিম্নোক্ত এক্সটেনশনগুলি সক্ষম করে:

* [PDO](http://php.net/manual/en/book.pdo.php) – PHP তে অ্যাক্সেস করতে MySQL;
* [JSON](http://php.net/manual/en/book.json.php) – রিসোর্স এই বিন্যাস ব্যবহার করে (মেটাডেটা, লেআউট, ভাষা এবং অন্যান্য);
* [GD](http://php.net/manual/en/book.image.php) – ইমেজ ম্যানুপুলেট করতে;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – সর্বোচ্চ সুরক্ষা নিশ্চিত করতে;
* [Zip](http://php.net/manual/en/book.zip.php) – EspoCRM আপগ্রেড এবং এক্সটেনশান ইনস্টল করতে সক্ষম হতে;
* [IMAP](http://php.net/manual/en/book.imap.php) – EspoCRM- এ মেলবক্সগুলি নিরীক্ষণ করতে;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

এছাড়াও [mailparse](https://pecl.php.net/package/mailparse) pecl এক্সটেনশন ইনস্টল করার সুপারিশ করা হয়েছে। ই-মেইল ফিচার ফিচারটি মসৃণ করার জন্য এটি প্রয়োজন।

php.ini সেটিংস:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### MySQL এর আবশ্যকতা

EspoCRM সমর্থন করে MySQL সংস্করণ 5.1 বা এর বেশি ।
এই কোন বিশেষ অদ্ভুততা হয়। সমস্ত ডিফল্ট সেটিংস EspoCRM এর জন্য ভাল।

## ইউনিক্স-ভিত্তিক সিস্টেমগুলির জন্য প্রয়োজনীয় অনুমতিসমুহ

ফাইল এবং ডিরেক্টরিগুলির নিম্নলিখিত অনুমতি থাকা উচিত:

* `/data`, `/custom`, `/client/custom` – সব ফাইল, ডিরেক্টরি এবং সাবডিরেক্টরি (ফাইলের জন্য 664, ডিরেক্টরীগুলির জন্য 775, সব সাবডিরেক্টরি এবং ফাইল সহ) লিখনযোগ্য হওয়া উচিত;
* `/application/Espo/Modules`, `/client/modules` – বর্তমান ডিরেক্টরিতে লিখনযোগ্য (বর্তমান ডিরেক্টরি জন্য 775, ফাইলের জন্য 644, ডিরেক্টরি এবং subdirectories জন্য 755);
* অন্যান্য সকল ফাইল এবং ডিরেক্টরিগুলি পড়তে হবে (ফাইলগুলির জন্য 644, ডিরেক্টরিগুলির জন্য 755)।

অনুমতিগুলি সেট করতে, টার্মিনালে এই কমান্ডগুলি চালান:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

সমস্ত ফাইল মালিকানাধীন এবং ওয়েব সার্ভার প্রক্রিয়ার দ্বারা গ্রুপ মালিকানাধীন থাকা উচিত। এটি “www-data”, “daemon”, “apache”, “www”, ইত্যাদি হতে পারে।
দ্রষ্টব্য: বিটমনি স্ট্যাকে, ফাইলগুলি "daemon" ব্যবহারকারীর মালিকানাধীন এবং গোষ্ঠীভুক্ত হওয়া উচিত।
দ্রষ্টব্য: শেয়ার হোস্টগুলিতে, আপনার ব্যবহারকারী অ্যাকাউন্টের মালিকানাধীন এবং গোষ্ঠী-মালিকানা থাকা উচিত।

মালিক এবং গ্রুপ-মালিক সেট করতে, টার্মিনালে এই কমান্ডগুলি চালান:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## একটি crontab সেটআপ করুন

একটি UNIX সিস্টেমের মধ্যে একটি ক্রসট্যাব স্থাপন করতে, নিম্নলিখিত পদক্ষেপগুলি গ্রহণ করুন:

* 1. আপনার EspoCRM উদাহরণের জন্য অ্যাডমিনিস্ট্রেটর হিসাবে লগইন করুন।
* 2. অ্যাডমিনিস্ট্রেটিভ প্যানেলে নির্ধারিত চাকরির বিভাগে যান (Menu > Administration > Scheduled Jobs) এবং crontab এর জন্য স্ট্রিং কপি করুন। এটি এর মত মনে হচ্ছে:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. একটি টার্মিনাল খুলুন এবং এই কমান্ডটি চালান:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER নিম্নলিখিত “www”, “www-data”, “apache”, ইত্যাদি হতে পারে (আপনার ওয়েব সার্ভারে নির্ভর করে)।
* 4. কপি করা স্ট্রিংটি পেস্ট করুন (ধাপ ২ থেকে) এবং crontab ফাইলটি সংরক্ষণ করুন (Ctrl+O, তারপর Ctrl+X ন্যানো সম্পাদকের জন্য).

## আপনার সার্ভারের উপর ভিত্তি করে কনফিগারেশন এর নির্দেশাবলী:

* [Apache সার্ভার কনফিগারেশন](apache-server-configuration.md).
* [Nginx সার্ভার কনফিগারেশন](nginx-server-configuration.md).
