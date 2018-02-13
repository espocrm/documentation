# EspoCRM অন্য সার্ভারে সরানো হচ্ছে

অন্য সার্ভারে EspoCRM সরানোর জন্য এই পদক্ষেপগুলি অনুসরণ করুন:

### ধাপ 1. ব্যাকআপ ফাইল

একটি ফাইল ম্যানেজার খুলুন বা SSH এর মাধ্যমে লগইন করুন EspoCRM ডাইরেক্টরি থেকে সমস্ত উপলব্ধ ফাইল আর্কাইভ করুন আরো বিস্তারিত: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### ধাপ 2. ব্যাকআপ রাখুন আপনার ডাটাবেসের

ডেটাবেস (মাইএসকিউএল, মারিয়াডবি) -এ সংরক্ষিত ডাটা ব্যাক আপ করা উচিত। এই সুপারিশটি অনুসরণ করুন: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### ধাপ 3. অন্য সার্ভারে ফাইল এবং ডাটাবেস ব্যাকআপ কপি

একটি নতুন সার্ভারে ফাইল এবং আপনার ডাটাবেসের ব্যাকআপ কপি।

### ধাপ 4. আর্কাইভ মুক্ত ব্যাকআপ ফাইল

ব্যাকআপ ফাইলগুলি অ্যারেভিক করতে, আপনি আর্কাইভ ম্যানেজার বা এই নির্দেশনাটি ব্যবহার করতে পারেন: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
দ্রষ্টব্য: ফাইলগুলি ওয়েব-সার্ভারের ডিরেক্টরির মধ্যে স্থাপন করা প্রয়োজন।

### ধাপ 5. একটি সার্ভার কনফিগার করুন

এখানে সুপারিশগুলির উপর ভিত্তি করে একটি নতুন সার্ভার কনফিগার করুন: https://www.espocrm.com/documentation/administration/server-configuration/.

### ধাপ 6. অনুমতি সঠিক করুন

প্রয়োজনীয় অনুমতি এবং ফাইল মালিক সেট করুন, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### ধাপ 7. আপনার ডাটাবেস ব্যাকআপ আমদানি করুন

প্রথমত, আপনাকে একটি মাইএসকিউএল ব্যবহারকারীর সাথে একটি নতুন ডাটাবেস তৈরি করতে হবে। ব্যাকআপ থেকে আপনার ডাটাবেস আমদানি করতে, instuction অনুসরণ করুন: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### ধাপ 8. সঠিক EspoCRM কনফিগারেশন

সার্ভার সফলভাবে আমদানি এবং কনফিগার করার পরে, ফাইলের EspoCRM কনফিগারেশন সঠিক করুন `ESPOCRM_DIRECTORY/data/config.php`:

 * ডাটাবেস সংযোগ সেটিংস:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - যদি আপনার ডোমেন নাম (URL) পরিবর্তিত হয়:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
 * ডিফল্ট ফাইলের মালিক (শুধুমাত্র যদি ভিন্ন হয়):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

কোথায় `www-data` আপনার ওয়েব-সার্ভার ব্যবহারকারী

### ধাপ 9. একটি ক্রনট্যাব সেটআপ করুন

একটি ক্রনট্যাব সেটআপ করুন, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
দ্রষ্টব্য: এটি আপনার ওয়েব সার্ভার ব্যবহারকারীর অধীনে কনফিগার করা উচিত।

এখানেই শেষ. এখন, আপনার EspoCRM উদাহরণ একটি নতুন সার্ভারে চলছে।
