#B2C (ব্যবসা-থেকে-ক্লায়েন্ট) জন্য EspoCRM কনফিগার করা

ডিফল্ট হিসাবে EspoCRM B2B ব্যবসা ব্যবহারের জন্য কনফিগার করা হয়। কিন্তু আপনি সহজেই এটি B2C জন্য সেটআপ করতে পারেন।

* পরিবর্তন করুন `b2cMode` তে আপনার কনফিগ ফাইল `data/config.php`. সংস্করণ 4.3.0 থেকে এটি কনফিগার করা যেতে পারে। Administration > Seetings.
* অপসারণ *Account* ন্যাভিগেশন মেনু থেকে ইটারফেস (Administration > User Interface).
* অপসারণ *Account* আপনার লেআউটগুলির ক্ষেত্রগুলি (Administation > Layout Manager).
* একটি অ্যাক্সেস অক্ষম করুন *Account* আপনার সব ভূমিকারসব পিতা বা মাতা ক্ষেত্রগুলির পিকলিস্টগুলি থেকে অ্যাকাউন্ট সরান জন্য সুযোগ (Administration > Roles).
* সব পিতা বা মাতা ক্ষেত্রগুলির পিকলিস্টগুলি থেকে অ্যাকাউন্ট সরান (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
