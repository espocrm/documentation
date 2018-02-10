# ব্যাকআপ এবং পুনঃস্থাপন

## কিভাবে নিজে EspoCRM ব্যাকআপ করবেন

EspoCRM ফাইল এবং ডাটাবেস ডেটা নিয়ে গঠিত। EspoCRM এর একটি সম্পূর্ণ ব্যাকআপ তৈরি করার জন্য এই সমস্ত ডেটা প্রয়োজন। এখানে উবুন্টু সার্ভারের সাথে মাইএসকিউএল কিভাবে কাজ করে তার নির্দেশনা।

### Step 1. ব্যাকআপ ফাইল

ইনস্টল করা EspoCRM এর ডকুমেন্টের বিষয়বস্তু সংরক্ষণ করুন। উবুন্টুর জন্য ডিফল্ট পাথ হয় `/var/www/html`. আপনি এই পাথ ব্যাবহার করতে পারেন:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Step 2. ব্যাকআপ ডাটাবেস

আপনার সমস্ত ডেটা ব্যাকআপ করতে, আপনাকে ডাটাবেস নাম এবং অ্যাক্সেস শংসাপত্রগুলি জানতে হবে। আপনি কনফিগারেশন ফাইলে ডাটাবেস নামটি খুঁজে পেতে পারেন `/ESPOCRM_DIRECTORY/data/config.php` অধীন অধ্যায় `database`. আপনি এই কমান্ড ব্যবহার করে আপনার ডাটাবেস ব্যাকআপ করতে পারেন:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Step 3. ব্যাকআপ অনুলিপি করুন

এখানেই শেষ. এখন, আপনি তৈরি ব্যাকআপ একটি নিরাপদ স্থানে কপি করতে হবে।


## একটি স্ক্রিপ্ট এর সঙ্গে EspoCRM ব্যাকআপ করবেন কিভাবে

আপনি সমস্ত প্রয়োজনীয় তথ্য ব্যাকআপ করার জন্য একটি স্ক্রিপ্ট ব্যবহার করতে পারেন। SSH এর মাধ্যমে লগইন করুন এবং কমান্ডগুলি চালান (উবুন্টু সার্ভারে পরীক্ষিত)।

### একটি স্ক্রিপ্ট ডাউনলোড করুন

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### স্ক্রিপ্ট চালান

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
কোথায়:
 * `PATH_TO_ESPOCRM`EspoCRM ডিরেক্টরিটি ইনস্টল করার একটি পথ.
 * `BACKUP_PATH` ব্যাকআপ ডিরেক্টরি একটি পথ.

উবুন্টু সার্ভারের জন্য এটি হল:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

দ্রষ্টব্য: যদি আপনার মাইএসকিউএল ব্যবহারকারীকে আপনার ডাটাবেস ডাম্প করার জন্য প্রয়োজনীয় অধিকার না থাকে, তাহলে আপনাকে অন্য মাইএসকিউএল ব্যবহারকারীর শংসাপত্রগুলি প্রবেশ করতে প্রমান করা হবে।

সফল নির্মাণের পরে, আপনি তৈরি ব্যাকআপ একটি পাথ পাবেন।

## ব্যাকআপ থেকে EspoCRM পুনরুদ্ধার করুন

আপনি উপরে বর্ণিত হিসাবে তৈরি ব্যাকআপ থেকে EspoCRM পুনরুদ্ধার করতে পারেন।

### Step 1. ব্যাকআপ ফাইলগুলি আনআর্কাইভ করুন

আর্কাইভ ফাইলগুলিতে, আপনি আর্কাইভ ম্যানেজার ব্যবহার করতে পারেন বা নিম্নোক্ত কমান্ডটি চালাতে পারেন। ফাইলগুলি ওয়েব-সার্ভারের ডিরেক্টরির মধ্যে স্থাপন করা প্রয়োজন।

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
কোথায়:
 * `/var/www/html` is a web-server directory.

### Step 2. প্রয়োজনীয় অনুমতিগুলি সেট করুন

ফাইলগুলির একটি ওয়েব সার্ভার ব্যবহারকারীর মালিকানা থাকা উচিত এবং সঠিক অনুমতি আছে। এই নির্দেশ অনুসরণ করে প্রয়োজনীয় অনুমতি সেট করুন:[www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Step 3. ডাটাবেস ডাম্প আমদানি করুন

ডেটাবেস ডাম্প একই ব্যবহারকারীর শংসাপত্রের সাথে একই ডাটাবেসে আমদানি করা উচিত, অন্যথায় কনফিগারেশন ফাইলের সংশোধন করা উচিত `ESPOCRM_DIRECTORY/data/config.php`. ডাম্প থেকে আপনার ডাটাবেস আমদানি করতে, টার্মিনালে নীচের কমান্ডটি চালান:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Step 4. চেক/কনফিগার করুন crontab

আপনার crontab সঠিকভাবে কনফিগার করা হয় কিনা তা পরীক্ষা করুন। নীচের কমান্ডটি চালান এবং চেক করুন যদি এস্পোসিআরএম সঠিক পথে থাকে:

```bash
sudo crontab -l -u www-data
```
কোথায়:
 * `www-data` is your web-server user.

যদি আপনি কোনও পরিবর্তন করতে চান তবে এই কমান্ডটি ব্যবহার করুন:

```bash
sudo crontab -l -u www-data
```

EspoCRM জন্য crontab কনফিগার সম্পর্কে আরো বিবরণ এখানে বর্ণিত আছে [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
