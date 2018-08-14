# গণনাকৃত ক্ষেত্র (সূত্র)

সত্তা ব্যবস্থাপকের মধ্যে নির্দিষ্ট সত্তা টাইপের জন্য স্ক্রিপ্ট (সূত্র) নির্ধারণ করা সম্ভব। রেকর্ড সংরক্ষিত হবার আগে এই স্ক্রিপ্ট সঞ্চালিত হবে।
এটি গণনা থেকে প্রাপ্ত মানের সাথে নির্দিষ্ট ক্ষেত্রগুলি (বৈশিষ্ট্য) স্বয়ংক্রিয়ভাবে সেট করার একটি ক্ষমতা প্রদান করে।

সূত্র সম্পাদনা করতে অনুসরণ করুন Administration > Entity Manager > dropdown menu at the right on the row of needed entity > Formula.
আপনাকে ক্ষেত্র সেট করতে প্রয়োজন হতে পারে, গণনা করা অনুমিত হয়, এনটাইটীটি ম্যানেজার মাধ্যমে শুধুমাত্র পড়ুন।



## বাক্য গঠন

EspoCRM সূত্র এই বৈশিষ্ট্যটির জন্য বিশেষভাবে পরিকল্পিত সহজ ভাষায় লেখা হয়।

অপারেটর আছে, ফাংশন গুণাবলী এবং মান সূত্র ব্যবহার করা যেতে পারে। অক্ষর দ্বারা বিভাজিত এক্সপ্রেশনকে বিভক্ত করা আবশ্যক`;`.

### অপারেটরসমুহ

* `=` - অ্যাসাইনমেন্ট।
* `||` - লজিকাল অর,
* `&&` - লজিকাল অ্যান্ড,
* `!` - লজিকাল নট,
* `+`-  সাংখ্যিক যোগিকরন,
* `-` - সাংখ্যিক বিয়োগীকরন,
* `*` - সাংখ্যিক গুনন,
* `/` - সাংখ্যিক বিভক্তিকরন,
* `%` - সাংখ্যিক মডিউল,
* `==` - তুলনীয় সমান,
* `!=` - তুলনীয় সমান না,
* `>` - তুলনীয় অপেক্ষাক্রিত বৃহত্তর,
* `<` - তুলনীয় কম,
* `>=` - তুলনীয় বড় বা সমান,
* `<=` - তুলনীয় কম বা সমান.

অপারেটরদের অগ্রাধিকার:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### বৈশিষ্ট্যাবলী

বৈশিষ্ট্য লক্ষ্য সত্তা এর ক্ষেত্র মান প্রতিনিধিত্ব করে। প্লাস বাটন ক্লিক করে আপনি উপলব্ধ বৈশিষ্ট্যগুলি সন্নিবেশ করতে পারেন।

নিম্নোক্ত বিন্যাসের সাথে সম্পর্কিত সংস্থার বৈশিষ্ট্যগুলি অ্যাক্সেস করা সম্ভব `linkName.attributeName`.


### ফাংশনসমুহ

ফাংশন ব্যবহারের বিন্যাস: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box ফাংশন নীচের তালিকাভুক্ত করা হয়।

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` যদি শর্ত পূরণ করা হয় তবে CONSEQUENT করুন। যদি না - তারপর আলাদাভাবে করুন।

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` যদি শর্ত পূরণ করা হয় তবে CONSEQUENT করুন। যদি না হয় - কিছুই করবেন না।

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` দুই বা ততোধিক স্ট্রিংগুলি সমন্বয় করে।

#### string\substring
`string\substring(STRING, START, LENGTH)`  START অবস্থান এবং LENGTH দ্বারা একটি STRING থেকে অক্ষর এক্সট্র্যাক্ট করে।

যদি LENGTH বাদ দেওয়া হয়, তবে START থেকে শুরু হওয়া STRING এর শেষ পর্যন্ত শুরু হওয়া সাবস্ট্রিংটি ফেরত দেওয়া হবে।

যদি LENGTH নেতিবাচক হয়, তাহলে অনেক অক্ষর STRING শেষে শেষ হবে।

#### string\\trim
`string\trim(STRING)` STRING এর প্রারম্ভে এবং শেষে থেকে রেখাচিত্রমালা স্ট্রিপগুলি।

#### string\\lowerCase
`string\lowerCase(STRING)` নিম্ন ক্ষেত্রের অক্ষরে রূপান্তর করে। (সংস্করণ 5.0.0 থেকে)।

#### string\\upperCase
`string\upperCase(STRING)` ঊর্ধ্ব ক্ষেত্রের অক্ষরে রূপান্তর করে। (সংস্করণ 5.0.0 থেকে)। 

#### datetime\\today
`datetime\today()` আজকের তারিখে ফেরত। 

#### datetime\now
`datetime\now()` বর্তমান ডেটটাইম রিটার্ন করে। 

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` অ্যাপ্লিকেশন সেটিংস অনুযায়ী স্ট্রিং ফর্ম্যাট করা তারিখ বা ডেটাটাইম VALUE রূপান্তর করে। টাইমজোন এবং FORMAT বাদ দেওয়া যাবে। যদি টাইমজোন বাদ দেওয়া হয় তাহলে ডিফল্ট টাইম জোনটি ব্যবহার করা হবে। যদি FORMAT বাদ দেওয়া হয় তবে ডিফল্ট বিন্যাসটি ব্যবহার করা হবে।

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Returns date of the month (1-31). `0` যদি VALUE খালি থাকে। যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.0 থেকে)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Returns month (1-12). `0` যদি VALUE খালি থাকে। যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.0 থেকে)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Returns year. `0` যদি VALUE খালি থাকে। যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.0 থেকে)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Returns hour (0-23). `-1` যদি VALUE খালি থাকে। যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.0 থেকে)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Returns minute (0-59). `-1` যদি VALUE খালি থাকে। যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.0 থেকে)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Returns day of the week (0-6). `-1` যদি VALUE খালি থাকে। `0` - রবিবারের জন্য যদি TIMEZONE বাদ দেওয়া হয় তাহলে সিস্টেম টাইমজোন ব্যবহার করা হয়। (সংস্করণ 4.7.3 থেকে)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Returns difference between two dates or datetimes. INTERVAL_TYPE can be 'years', 'months', 'days', 'hours', 'minutes'. Returns `null` if failure. Result will be negative if VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` DATTIME VALUE এর MINUTES যোগ করে MINUTES ঋণাত্মক হতে পারে।

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` DATTIME VALUE এ HOURS যোগ করে HOURS নেতিবাচক হতে পারে।

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` তারিখ বা datetime VALUE যোগ করে DAYS নেতিবাচক হতে পারে।

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` WEEKS তারিখ বা তারিখ সময় VALUE যোগ করে WEEKS নেতিবাচক হতে পারে।

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` তারিখ বা ডেটটাইম VALUE এর জন্য MONTHS যোগ করে MONTHS নেতিবাচক হতে পারে।

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` তারিখ বা ডেটটাইম VALUE এর জন্য YEARS জুড়েছে YEARS নেতিবাচক হতে পারে।

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` পাস করা আর্গুমেন্টগুলির উপর ভিত্তি করে VALUE- এর নিকটতম তারিখ বা ডেটাটাইম ফেরত দেয়। (সংস্করণ 5.0.0 থেকে)

TYPE নিম্নলিখিত মানগুলির মধ্যে একটি হতে পারে: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET একটি পূর্ণসংখ্যা মান বা একটি স্ট্রিং মান। IS_PAST অতীতের নিকটতম খুঁজে পেতে মানে যদি টাইমজোন বাদ দেওয়া হয় তাহলে ডিফল্ট টাইমজোন ব্যবহার করা হয়।

উদাহরণ:

`datetime\closest(datetime\now(), 'time', '20:00')` 20:00 সময় সঙ্গে ভবিষ্যতে নিকটতম datetime মান ফিরে আসবে।

`datetime\closest('2017-11-20', 'date', 1, true)` ফিরে আসবে `2017-11-01`, মাসের প্রথম দিন।

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` পরের সোমবার ফিরে আসবে (দিনের শুরুতে)।

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` একটি নির্দিষ্ট বিন্যাস বা ডিফল্ট অ্যাপ্লিকেশন সেটিংস অনুসারে স্ট্রিং ফর্ম্যাট করা সাংখ্যিক VALUE রূপান্তর করে। যদি DECIMALS, DECIMAL_MARK বা THOUSAND_SEPARATOR তারপর সিস্টেম ডিফল্টগুলি ব্যবহার করা হয়

উদাহরণ:

`number\format(2.666667, 2)` - ফলাফল 2.67;

`number\format(1000, 2)` - ফলাফল 1,000.00;

`number\format(10.1, 0)` - ফলাফল 10.


#### number\abs
`number\abs(VALUE)` পরম মান যদি সংখ্যাটি সাংখ্যিক না হয় তবে উল্লিখিত হয়।

#### number\round
`number\round(VALUE, PRECISION)` নির্ধারিত PRECISION (দশমিক বিন্দুর পরে সংখ্যা সংখ্যা) এর মানের মান পূরণ করে। PRECISIONও নেগেটিভ বা শূন্য (ডিফল্ট) হতে পারে।

#### number\floor
`number\floor(VALUE)` প্রয়োজনীয় সর্বনিম্ন মান পরে নীচের সর্বনিম্ন পূর্ণসংখ্যা মান ফেরত দেয় (সংস্করণ 4.9.0 থেকে)

#### number\ceil
`number\ceil(VALUE)` যদি প্রয়োজন হয় তাহলে সর্বোচ্চ মানের পূর্ণসংখ্যা মান ফেরত পাঠায়। (সংস্করণ 4.9.0 থেকে)

#### entity\isNew
`entity\isNew()` যদি সত্তাটি নতুন (তৈরি করা হয়) এবং মিথ্যা না হলে (সত্যিকারের আপডেট করা হয়) সত্যিকারের সত্য প্রদান করে।

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` সত্তা এর ATTRIBUTE পরিবর্তন করা হয়, তাহলে TRUE প্রদান করে।

উদাহরণ:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` TRUE ফেরত আসে যদি সত্তাটির ATTRIBUTE পরিবর্তন না হয়।

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` অ্যাট্রিবিউট যা সেট করা হয়েছিল যখন টার্গেট সত্তা ডাটাবেস থেকে আনা হয়েছিল। এটি সংশোধন করার আগে।

উদাহরণ:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` একাধিক ক্ষেত্র লিঙ্ক আইডি যোগ করুন। উদাহরণ স্বরূপ, যোগ করুন 'someTeamId' থেকে 'teams'ক্ষেত্র। 

`entity\addLinkMultipleId(LINK, ID_LIST)` আইডি তালিকা যুক্ত করে (সংস্করণ 4.8.3 থেকে)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` লিংক একাধিক ক্ষেত্রের নির্দিষ্ট আইডি নির্দিষ্ট কিনা তা পরীক্ষা করে।

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` লিঙ্ক একাধিক ক্ষেত্র থেকে একটি নির্দিষ্ট আইডি মুছে ফেলে।

#### entity\isRelated
`entity\isRelated(LINK, ID)` লক্ষ্য সত্তাটি LINK এবং ID দ্বারা উপস্থাপিত অন্য সত্তাটির সাথে সম্পর্কিত কিনা তা পরীক্ষা করে।

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` বর্তমান ব্যবহারকারীর ATTRIBUTE প্রদান করে।

#### list
`list(VALUE-1, ... VALUE-N)` অ্যারে ফেরত আসে (সংস্করণ 4.7.0 থেকে)।

#### array\includes
`array\includes(LIST, VALUE)` যদি তালিকাতে VALUE অন্তর্ভুক্ত থাকে তবে সত্য প্রদান করে অ্যারে এবং মাল্টি-Enum ক্ষেত্রগুলির জন্য ব্যবহার করা যেতে পারে। (সংস্করণ 4.7.0 থেকে)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` একটি অ্যারের শেষে এক বা একাধিক উপাদান যোগ করে এবং নতুন অ্যারে ফেরৎ। (সংস্করণ 5.0.0 থেকে)

#### array\length
`array\length(LIST)` LIST- এ উপাদানগুলির সংখ্যা গণনা দেয় (সংস্করণ 4.8.1 থেকে)


### ভ্যালু

* স্ট্রিংস। উদাহরণস্বরূপ 'some string';
* পূর্ণ সংখ্যা উদাহরণস্বরূপ 1, 100, 40300.
* ফ্ল্যাট সংখ্যা। E.g. 5.2.

### ভেরিয়েবল

সূত্র মধ্যে কাস্টম ভেরিয়েবল সংজ্ঞায়িত করা সম্ভব।
```
$someVariableName = 'Test';
description = $test;
```


## উদাহরণ

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## ওয়ার্কফ্লো মধ্যে সূত্র ব্যবহার

আপনি ওয়ার্কফ্লো শর্ত এবং কর্মের সূত্র ব্যবহার করতে পারেন। দেখুন [workflows documentation](workflows.md) আরও তথ্যের জন্য।
