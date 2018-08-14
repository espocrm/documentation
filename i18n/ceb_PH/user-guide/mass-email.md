# Dinaghan nga Email

## Unsaon pagpadala ug dinaghan nga email

Gikinahanglan ka nga naay bisan usa ka Target List nga naay gitarget nga mga rekord ug Email Template sa imohang crm.

1. Paghimo og bago nga Campaign nga naay status nga `Email` o `Newsletter`. Pilia ang usa o daghan nga mga target list sa `Target Lists` nga field.
2. Pagkahuman ug himo sa Campaign record, paghimo og Mass Email para ani nga campaign: i-click ang plus sa Mass Email nga panel. I-specify ang _Date Start_ - kung kanusa ipadala ang mga email, ug pilia ang _Email Template_. Siguradoha nga ang _Status_ kay giset sa `Pending`.

Kung ang tanan kay nakasetup ug sakto, ang mga email kay ipadala. Binahin kining ipadala kada oras (pwede nimong usbon ang hidak-on sa pagbahin sa Administration > Outbound Emails). Ang administrador kay makausab niani pinaagi sa pag-update sa `Scheduling` nga field sa `Check Group Email Accounts` Scheduled Job.

Pwede nimong matan-aw kung napadala naba ang mga email sa sulod Log panel.

## Testingi kong unsay napadala ngadto sa mga mudawat

I-click ang right dropdown sa mass email nga row sa _Mass Email_ nga panel ug i-click ang _Send Test_.

## Log

Sa log, makita nimo ang:
* Napadala nga mga email;
* Mga email nga naabli sa nakadawat;
* Mga link nga giclick sa nakadawat;
* Mga receipient nga ni opt-out;
* Bounced emails (not delivered to recipient).
* Mga ni untol nga mga email (wala nadeliver ngadto sa makadawat).

## Opt-out nga link

Kung walay giusab, ang sistema kay musumpay og opt-out sa tanang mga gipadala nga email. Pero pwede nimong magamit ang custom sa imohang Email Template.

Pananglitan:
```html
<a href="{optOutUrl}">Unsubscribe gikan sa mailing list.</a>
```

Ang administrador kay maka-disable sa minando nga opt-out link nga gipuno sa sistema sa Administration > Outbound Emails.

## Tracking URL

Kung gusto nimong mahibaw-an kung niabli ang nakadawat sa email sa link nga gikan sa imohang email, gikinahanglan nimong muhimo og Tracking nga URL. I-specify ang bisan unsang _Name_
 ug _URL_ kung asa ang link padulong. Dayon, gikinahanglan nimong i-paste ang nahimo nga code ngadto sa imohang Email Template.
 
## Mga Target nga Lista

Ang mga Target List kay naglangkob sa mga lista sa Accounts, Contacts, Leads ug Users nga mga rekord.

Ang mga user kay maka puno og item sa mga listahan sa mga target gamit ang _Select_ nga aksyon sa kapareho nga panel sa Target List detail nga view.

## Pagpuno sa mga target list ug mga Report

Ang [Reports](reports.md#syncing-with-target-lists) nga feature kay muhatag og abilidad para makapuno og target lists nga rekord nga mutukma sa espisipiko nga kriterya.

## Mga Excluding Target List

I-specify ang Excluding Target Lists para malikayan ang pagpadala sa dinaghan nga email sa ubang mga mudawat. Kung naay usa ka rekord nga naay email address nga kaparehas sa mga wala gilabot nga mga rekord, ang unang rekord kay dili pud apilon.

## Campaign Log

Sa Campaign Log, makit-an nimo ang mga email nga napadala, naablihan nga mga email, mga niuntol nga mga email, kinsa tong ni-opt out, ug kinsa tong mga ni-click sa link nga naa sa email. Posible pud nga gamiton ang kani nga log pinaagi sa paghimo og Target List (dropdown nga naa sa pinakataas nga tuong bahin sa panel) base sa mga rekord gikan sa log. Pananglitan, mupili ka ug usa ka kontak nga niclick sa link (tracking nga url).

## Pagpang-ayo sa mga Maguba

_Para sa mga Administrador_

#### Unsay buhaton kong wala napadala ang mga email.

1. Tan-awa kung ang _Send Test_ kay mugana. Kung dili mugana, tan-awa kong ang SMTP nga mga setting kay sakto ra.
2. Tan-awa kung naset-up ang cron sa imohang sistema.
3. Tan-awa kong naa kay `Send Mass Emails` Scheduled Job ug kong kani kay `Active` (Administration > Scheduled Jobs > Send Mass Emails). Tan-awa kong naay nasuwat sa Log.

#### Unsaon kong ang mga Tracking URL kay naay sayop nga url nga dili mupadulong ngadto sa imohang crm.

Tanawa ang 'siteUrl' nga parametro sa `data/config.php` nga file. Gikinahanglan ni i-set isip nga URL sa imohang EspoCRM nga pwede i-access sa gawas nga kalibutan.

#### Ang mga niuntol nga email kay wala gipang-log

Ang mga niuntol nga email kay pwede ra idumala gamit ang group email nga account. Dapat siguradohon nimo nga naa kay group email account nga nagmonitor sa mailbox diin ipadala ang mga niuntol nga mga email. 

Naa puy ubang mga mail server provider nga dili musunod sa mga standard, busa ang mga niuntol nga mga email kay dili mailhan.
