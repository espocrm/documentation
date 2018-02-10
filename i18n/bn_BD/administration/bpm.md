# ব্যবসা প্রক্রিয়া ম্যানেজমেন্ট

ব্যবসায় প্রক্রিয়া ব্যবস্থাপনা (BPM) টুল EspoCRM- এ ব্যবসায়িক প্রক্রিয়ার মডেল এবং স্বয়ংক্রিয় করার ক্ষমতা প্রদান করে। এটি একটি ইঞ্জিন বিপিএমএন 2.0 স্ট্যাণ্ডার্ড বর্ণিত ব্যবসা প্রক্রিয়া নির্বাহ। BPM সরঞ্জাম পাওয়া যায় [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension.

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### ওয়ার্কফ্লা টুল থেকে পার্থক্য

ওয়ার্কফ্লো টুলটি সহজ ব্যবসা নিয়মগুলির অটোমেশন, W/O ক্রমবর্ধমান প্রবাহের আইটেমগুলির জন্য নির্ধারিত হয়, যখন প্রফ্রাইনটি গ্রাফিকালি প্রদর্শন করার প্রয়োজন নেই।

বি.পি.এম টুল আরও জটিল ব্যবসা প্রবাহের উদ্দেশ্যে হয়, যেখানে ডাইভারজিং এবং কনভারজিং ফ্লো, এক্সিকিউশন বিলম্ব, ইউজার ইন্টারঅ্যাকশন থাকতে পারে। একটি ফ্লোচার্ট ভিউ একটি মানুষের জন্য ব্যবসায়িক প্রক্রিয়া আরও বোধগম্য করে তোলে, একটি লগ প্রক্রিয়া কিভাবে অনুষ্ঠিত হয়েছিল তা দেখতে পারবেন।

## প্রক্রিয়া ফ্লোচার্টগুলি

ফ্লোচার্ট প্রক্রিয়া লিঙ্কটি প্রশাসনের প্যানেল থেকে পাওয়া যায়। এটি ন্যাভিগেশন প্যানেলের একটি ট্যাবে যোগ করা যাবে।

ফ্লোচার্ট ব্যবসার প্রক্রিয়া মডেলিং জন্য উদ্দেশ্যে করা হয়। প্রশাসক ফ্লোচার্টগুলি তৈরি এবং সম্পাদনা করতে পারেন। নিয়মিত ব্যবহারকারীরা কেবলমাত্র ফ্লোচার্টগুলি দেখতে পারেন।

প্রতিটি ফ্লোচার্টের নির্দিষ্ট সত্তা টাইপ আছে (টার্গেট প্রকার ক্ষেত্র)। ফ্লোচার্ট ভবিষ্যতে প্রক্রিয়াকরণগুলির বাস্তবায়ন নির্ধারণ করে। এটি ফ্লোচার্ট উপাদান এবং উপাদানগুলির মধ্যে সংযোগগুলি অন্তর্ভুক্ত করে।

যদি প্রক্রিয়া ফ্লোচার্টটি অনির্বাচিত হয় তবে 'Is Active' ক্ষেত্র তারপর এটি উদাহরণ প্রক্রিয়া আরম্ভ হবে না.

একটি নির্দিষ্ট ফ্লোচার্ট উপাদানের বিবরণ এবং প্যারামিটারগুলি দেখানোর জন্য আপনাকে এটি ক্লিক করতে হবে। সম্পাদনা মোডে আপনি প্যারামিটার সম্পাদনা করতে সক্ষম হবেন।

## প্রক্রিয়া

প্রক্রিয়াগুলি প্রশাসনের প্যানেল থেকে পাওয়া যায়। সংযোগটিও নেভিগেশন প্যানেলের একটি ট্যাবে যোগ করা যেতে পারে।

প্রক্রিয়া ব্যবসায়িক প্রক্রিয়ার উদাহরণ উপস্থাপন করে। এটি শুরু যখন এটি অবস্থা পায় 'Started'. প্রক্রিয়া শেষ হলে এটি অবস্থা পায় 'Ended'. প্রসেসটি এমন একটি ব্যবহারকারীর দ্বারা বন্ধ করা যায় যা প্রসেসটি সম্পাদনা করার অ্যাক্সেস আছে। এটি ম্যানুয়ালি বন্ধ হলে এটি অবস্থা পায়'Stopped'।

প্রক্রিয়াটি ফ্লোচার্ট অনুযায়ী কার্যকর করা হয়। প্রক্রিয়াটি শুরু হওয়ার পরে প্রক্রিয়াটির ফ্লোচার্ট পরিবর্তন করা যাবে না।

প্রক্রিয়াটি দায়বদ্ধভাবে একক লক্ষ্যের রেকর্ডের সাথে সম্পর্কিত।

প্রক্রিয়াগুলি স্বয়ংক্রিয়ভাবে শুরু হতে পারে (নির্দিষ্ট শর্ত বা নির্ধারিত সময়ে) বা ম্যানুয়ালি (যেখানে ফ্লোচার্টে অন্তত একটি স্টার্ট ইভেন্ট আছে)। প্রক্রিয়াটি শুরু করতে ব্যবহারকারীকে ক্লিক করতে হবে'Start Process'প্রসেস তালিকা বোতাম।

## ফ্লোচার্ট এলিমেন্টস

### ঘটনাবলী

চেনাশোনাগুলি হিসাবে একটি ফ্লোচার্টে ইভেন্টগুলি প্রদর্শিত হয়

#### ইভেন্ট শুরু করুন

প্যারামিটার নেই এটি প্রক্রিয়া একটি শুরু বিন্দু। স্টার্ট ইভেন্টটি এমন ব্যবহারকারীর দ্বারা শুরু করা যেতে পারে যা প্রসেস তৈরির অ্যাক্সেস আছে। ব্যবহারকারীকে ক্লিক করতে হবে 'Start Process' প্রসেস তালিকায় বোতাম.

#### শর্তসাপেক্ষ স্টার্ট ইভেন্ট

প্রক্রিয়া শুরু একটি বিন্দু। নির্দিষ্ট শর্ত পূরণ করা হয় যখন এটা স্বয়ংক্রিয়ভাবে ট্রিগার হতে অনুমিত হয়। ট্রিগার দুটি ধরনের আছে:'After record created', 'After record saved'.

#### টাইমার স্টার্ট ইভেন্ট

প্রক্রিয়া শুরু একটি বিন্দু। এটি নির্ধারণের মাধ্যমে প্রসেস আরম্ভ করে। আপনি প্রসেস শুরু করার জন্য ক্রসব্লব নোটিএনে নির্ধারিত লিস্ট প্রতিবেদনগুলি নির্দিষ্ট করতে হবে।

#### শর্তসাপেক্ষ ইন্টারমিডিয়েট ইভেন্ট

নির্দিষ্ট মাপকাঠি পূরণ করা হয় না হওয়া পর্যন্ত এই ঘটনাটি প্রবাহ বন্ধ করে দেয়।

#### টাইমার ইন্টারমিডিয়েট ইভেন্ট

এই ইভেন্ট প্রবাহ বন্ধ এবং ইভেন্ট এর পরামিতি দ্বারা নির্দিষ্ট হিসাবে যতক্ষণ অপেক্ষা করছে।

আরো জটিল টাইমার সেটিংসের জন্য আপনি ব্যবহার করতে পারেন [formula](formula.md). সূত্র স্ক্রিপ্টগুলি তারিখ-সময় মান (UTC টাইমজোনে) ফেরত দিতে হবে। একবার এই সময় আসে প্রবাহ পরের উপাদান এগিয়ে যেতে হবে।সূত্র ফাংশনটি ভবিষ্যতে একটি নির্দিষ্ট সময় টাইমার সেট করা সম্ভব, উদাহরণস্বরূপ। পরের কাজ দিবসের শুরুতে

ব্যবহার করে datetime\closest সূত্র ফাংশনটি ভবিষ্যতে একটি নির্দিষ্ট সময় টাইমার সেট করা সম্ভব, উদাহরণস্বরূপ। পরের কাজ দিবসের শুরুতে।

#### শেষ ইভেন্ট

বর্তমান প্রবাহ শেষ। এটা সমান্তরাল মধ্যে চলমান প্রবাহ শেষ না। প্রবাহ সমাপ্তি ঘটনা পৌঁছেছে এবং সমান্তরালে চলমান কোন কিছু নেই তারপর প্রক্রিয়া শেষ হয়।

#### শেষ ইভেন্ট বন্ধ করুন

সব প্রবাহ শেষ প্রক্রিয়া পরবর্তীকালে শেষ হয়

### Gateways

Gateways are displayed as diamonds.

#### Exclusive Gateway

Can diverge or converge flows.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

#### Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

#### Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

#### Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
