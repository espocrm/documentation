# Maramihang Email

## Paano magpadala ng maramihang email

Kinakailangan na ikaw ay magkaroon ng kahit isang Target na listahan na may mga ulat ng target at Template ng Email sa iyong crm.

1. Gumawa ng panibagong kampanya na may katayuan na `Email` o `Newsletter` . Pumili ng isa o ilang mga kaunting listahan ng target sa `Mga Listahan ng Target` na patlang.
2. Pagkatapos gawin ang talaan ng kampanya ay gumawa ng maramihang email para sa kampanyang ito: I-klik ang  plus sa panel ng maramihang Email. Tukuyin ang _Date Start_ - kung ang mga email ay kailangan na ipadala, at piliin ang _Email Template_. Siguraduhin na ang _Status_ ay itinakda nilang `Nakabinbin`.

Ang mga email ay maipapalabas kung ang lahat ng pagset-up ay tama. Kailangang maipadala kada oras na may mga bahagi (Pwede mong palitan ng kaki ng bahagi sa Administrastyon> Palabas na mga email). Pwede baguhin ito ng mga Administrador sa pamamagitan ng pag-update na `Scheduling` na patlang ng `Check Group Email Accounts` na naka-iskedyul na trabaho.

Maaari mong suriin kung ang mga email ay ipinadala sa log ng panel in.

## Subukan kung ano ang mapapadala sa mga padadalhan

I-klik ang right na dropdown sa hanay ng maramihang email sa _Mass Email_ na panel at pagkatapos ay i-klik ang _Send Test_.

## Log

Sa log ay iyong makikita ang mga sumusunod:
* Mga email na pinadala;
* Mga email na binuksan ng pinadalhan;
* Mga link na na-klik ng pinadalhan;
* Mga pinadalhan na nagpasyang sumali;
* Mga email na bumalik (mga hindi napadala sa pinadalhan).

## Link para sa Pagsali

Bilang default ang sistema ay magsasama ng pagsali sa lahat ng mga pinadalang email. Ngunit pwede kang gumawa ng isang pinasadya sa iyong Templat na Email.

Halimbawa:
```html
<a href="{optOutUrl}">Hindi na sasali sa listahan na papadalhan ng email.</a>
```

Ang administrador ay kayanag di paganahin ang sapilitang ling ng pagsasali na dinagdag ng sistema sa Administrasyon > Palabas na mga Email.

## Pagsubaybay ng URL

Kung may balak kang malaman kung ang pinadalhan mo ba ay binuksan ang link mula sa iyong email, kailangan mo gumawa ng URL ng pagsubaybay. Tumukoy ng kahit na anong  _Ngalan_
 at _URL_ kung saan ang iyong link ay dapat humantong. Pagkatapos ay kailangan mong ipaste ang code na nalikha sa iyong Template ng email.

 Halimbawa:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Subukan ang aming demo</a>
 ```
 
## Listahan ng mga Target

Ang mga listahan ng target ay naglalaman ng mga listahan ng mga Accounts,mga Contacts, mga Leads at mga talaan ng gymagamit. 

Ang mga gumagamit ay kayang magparami ng mga listahan ng taget ng mano-mano gamit ang _Pumili_ na aksyon sa kaukulang panel sa detalyadong view ng listahan ng target. Mayroong abilidad para gumawa ng pagsasala at pagkatapos ay piliin ang lahat ng resulta ng paghahanap.

## Pagpaparami ng mga listahan ng target na may mga ulat

 Ang [ulat](reports.md#syncing-with-target-lists) na tampok ay nagbibigay ng abilidad na paramihin ang mga listahan ng target na may mga rekord na tumutugma sa isang tiyak na pamantayan.

## Pagliban ng mga Listahan ng Target

Tukuyin ang pagliban ng mga listahan ng target para maiwasan ang maramihang pagpapadala ng email sa mga piling padadalhan. Kung may isang rekord sa isang address ng email na tumutugma sa address ng email ng rekord ng mga hindi kasali, ang unang rekord ang hindi sasali kung gayon man.

## Log ng kampanya

Sa log ng kampanya ay iyong makikita ang mga email na iyong ipinadala, mga nabuksang email, mga bumalik na email, mga sumali, at ang mga taong nag-klik ng link sa email. May posibilidad na magamit ang log na ito sa paraan ng paggawa ng Listahan ng Target(ang dropdown ay nasa bandang kanan sa itaas na sulok ng panel) na batay sa mga rekord na galing sa log. For example, you pick only contacts that clicked on the link (tracking url).

## Pag-troubleshoot

_Para sa mga Administrador_

#### Ano ang gagawin kung ang mga email ay hindi napadala

1. Tingnan kung ang  _test ng pagpadala_ ay gumana. kung hindi gumagana, sa halip ay tingnan kung ang mga setting ng SMTP na sistemaay tama.
2. Tingnan kung ikaw ay naka-setup ng cron para sa iyong sistema.
3. Tingnan kung mayroon kang `Magpadala ng Maramihang Email` na naka-iskedyul na tarabaho at ito ay `Aktibo` (Administraston > Naka-iskedyul na Trabaho > Magpadala ng mga maramihang email). Tingnan kung mayroong kakaiba sa Log.


#### Paano kung ang URL ng pagsubaybay ay may maling url na hindi pinahahantong sa iyong crm.

Tingnan ang 'siteUrl' na parameter sa `data/config.php` na file. Iyon ay kailangang itakda bilang URL ng iyong EspoCRM na pwedeng pasukan ng mundong nasa labas.

#### Ang mga bumalik na email ay hindi na-log

Ang mga bumalik na e-mail ay pwede lang hawakan ng account ng email na grupo. Tiyakin kong mayroon kang isang Eamail na account na panggrupo na sumusubaybay sa mailbox kung saan ang bumalik na email ay pinadala.

Gayundin ang ilang mga tagabigay ng serber ng mail ay maaaring lumihis mula sa mga pamantayan, kaya ang mga bumalik na email ay hindi basta-bastang makikilala.
