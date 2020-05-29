# ইন্সট্যালেশন

### আবশ্যকতা
EspoCRM বেশিরভাগ হোস্টিং প্রদানকারীদের উপর চালান করে। প্রয়োজনীয়তা নিম্নলিখিত অন্তর্ভুক্ত করুন:

* পিএইচপি 5.6 বা পিএইচপি এর সর্বশেষ সংস্করণ সক্রিয় পিডোর, json, জিডি লাইব্রেরি, এমক্রিপ্ট এক্সটেনশন (ডিফল্টরূপে সাধারণত সক্রিয়);
* মাইএসকিউএল 5.5.3 বা উচ্চতর।

দেখুন [সার্ভার কনফিগারেশন](server-configuration.md) আরও তথ্যের জন্য নিবন্ধ

### 1. EspoCRM ইনস্টলেশন প্যাকেজটি ডাউনলোড করুন
EspoCRM অনুসরণের সর্বশেষ সংস্করণটি পেতে [ডাউনলোড পৃষ্ঠা](http://www.espocrm.com/download/) লিঙ্ক।

### 2. আপনার সার্ভারে EspoCRM ফাইল আপলোড করুন

একবার ডাউনলোড শেষ হলে, আপনার ওয়েব সার্ভারে প্যাকেজ আপলোড করুন।
এটি আপলোড করতে আপনি এসএসএইচ, এফটিপি বা হোস্টিং প্রশাসন প্যানেল ব্যবহার করতে পারেন।
আপনার পাবলিক ওয়েব সার্ভার ডিরেক্টরি (যেমন, `public_html`, `www`, ইত্যাদি)।

_Note: FTP এর জন্য, আপনার ওয়েব সার্ভারে আপলোড করার আগে আপনাকে আর্কাইভটি বের করতে হবে।_

### 3. EspoCRM ব্যবহার করার জন্য একটি মাইএসকিউএল ডাটাবেস তৈরি করুন

আপনার হোস্টিং প্রশাসন প্যানেলে যান, বা SSH তে, এবং এস্পোসিআরএম এর জন্য একটি নতুন ডাটাবেস এবং ব্যবহারকারী তৈরি করুন (যেমন, `MySQL Databases` সিপ্যানেল এ)।

### 4. EspoCRM ইনস্টলেশন প্রক্রিয়া চালান

এখন, আপনার ওয়েব ব্রাউজার খুলুন, এবং EspoCRM ফাইলগুলির সাথে URL এ যান (যেমন, `http://yourdomain.com/espo`)।

আপনি এই পর্দা দেখতে হলে, আপনি একটি "Permission denied" ত্রুটি আছে
সুতরাং, আপনি প্রদর্শিত কমান্ডটি দ্বারা SSH মাধ্যমে টার্মিনালে চালানো প্রয়োজন, বা সঠিক অনুমতি সেট।
এটি ডিরেক্টরের জন্য 755, ফাইলের জন্য 644, এবং 775 এর জন্য হওয়া উচিত `data` ডিরেক্টরিতে। 
এছাড়াও নিশ্চিত করুন যে আপনার সঠিক _owner_ এবং _group_ রয়েছে

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/1.png)

আপনি যদি নীচের পর্দাটি দেখতে পান, অনুমতি সঠিক এবং আপনি EspoCRM ইনস্টল করতে শুরু করতে পারেন।

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/2.png)

এই পৃষ্ঠাতে, আপনি লাইসেন্স চুক্তিটি পড়তে ও গ্রহণ করতে পারেন।

![3](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/3.png)

আপনার নতুন তৈরি মাইএসকিউএল ডাটাবেসের বিস্তারিত লিখুন।

![4](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/4.png)

প্রশাসক EspoCRM ব্যবহারকারী নাম এবং পাসওয়ার্ড লিখুন।

![5](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/5.png)

এই পৃষ্ঠায় আপনি EspoCRM এর ডিফল্ট সেটিংস সেট করতে পারেন, যেমন তারিখ এবং সময় বিন্যাস, টাইমজোন, কারেন্সি এবং অন্যান্য।

![6](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/6.png)

আউটগোয়িং ইমেইলের জন্য এসএমটিপি সেটিংস প্রবেশ করুন, যদি আপনি ইমেল প্রেরণ করার ক্ষমতা থাকতে চান
এই ধাপটি _Next_ বোতাম ক্লিক করে এড়িয়ে যেতে পারে।
ইনস্টলেশনের পরে এই সমস্ত বিকল্পগুলি EspoCRM- এ যোগ করা / পরিবর্তিত হতে পারে।

![7](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/7.png)

অভিনন্দন! ইনস্টলেশন সম্পূর্ণ।
আপনার সিস্টেম দ্বারা চালানো শি্ডডট টাস্ক সেট আপ শেষ জিনিস। এটি চলমান দ্বারা সম্পন্ন করা যেতে পারে `crontab -e` উইন্ডোজ সিস্টেমে linux cli এবং _Windows Tasks Scheduler_ এ।

![8](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/8.png)

আমরা আশা করি আপনি EspoCRM এ কাজ উপভোগ করতে করবেন।







