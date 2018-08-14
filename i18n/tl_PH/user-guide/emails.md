# Mga Alituntunin sa Paggamit ng Email

Ang EspoCRM ay nagbibigay ng abilidad na kuning ang mga email mula IMAP box. Ito ay nagbibigay ng posibilidad na gamitin ang EspoCRM bilang isang kliyente ng email kasama ang mga tukoy na tampok ng CRM.

## Mga Account na Imap

*Paalala: kailangan ay mayroon kang [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) na iniayos ng maayos sa iyong sistema ng magkaroong ng gumaganang pagdating ng mga email.*

Ang gumagamit ay kayang mag-setup ng IMAP na account sa sariling pahina ng email na account (Tab ng mga email > kanang taas na menu > Mga account ng sariling email).

Tukuyin kung saan na mga folder ang susundan sa mga patlang ng sinusundan na mga folder. Bilang default ay hindi ito nakasset-up sa inbox. Kung ikaw ay gumagamit ng eksternal na email na kliyente sa pagpapadala ng mga email ay pwede kang magdagdag ng folder ng pinadala para maitago ang mga email na iyon.

Ang *Kunin mula* ay nagpapahintulot sa iyo na pumili ng araw kung kelan itatago ang mga email. i-set ito sa ibang araw mula ngayon kung kinakailangan mo na itago ang mga lumang email.

Mayroong kakayan na tukuyin ang *Folder* sa Account na pansariling email. Ang mga papasok na email ay malalagay sa folder na iyon.

## Mga SMTP na Account

Ang mga gumagamit ay kayang mag-setup ng mga settings sa SMTP sa mga preprensiya gayundin sa kanilang mga sariling email na mga account. Ang Administrador ay kaya din na magpahintulot ng paggamit ng sistema ng SMTP (Ibahagi ito).

Ang mga gumagamit ay may kakayah na magkaroon ng maraming SMTP na account (mula noong bersyon 4.2.0). Ngunit ang gumagamit ng mga address ng email ay pwedeng magpadala ng email mula tinutukoy ng mga address ng email sa talaan ng *gumagamit*.

## Pagtatrabaho sa mgaa Email

Ang mga email ay kinukuha ng cron (sa background) kada ilang minuto (ang panahon aay maaaring tukuyin ng administrador).
Makikita mo ang lahat ng email tab ng mga email. Mayroong karaniwang folder ng Inbox, Pinadala, Di pa tapos na mga email sa bandang kaliwa.

*Estado* na patlang. `Napadala` ay nanganahulugan na pinadala galing sa CRM, `Archived` – nalakap galing sa IMAP na account o tinago ng mano-mano, `Draft` – ay nangangahulugan naa ang email ay nagawa bilang draft.

Kung may bagong email na dumarating ay sinusubukan ng sistema na alamin kung saang talaan ang email na ito ay nabibilang. Ito ay pwede i-link sa Account, Lead, Opportunity, Case (at Contact sa B2C na mode) etc. Kung hindi ito nakilala ay sa halip ang gumagamit ay pwedeng i-link ito ng manomano pagkatapos ay punan ang patlang ng *parent*.

Kung may isang email na dumating na mula sa kliyenteng may potensyal ay may kapangyarihan ang gumagamit na **i-convert bilan Lead**. Buksan ang Email na entry at i-klik ang Gawa ng Lead sa kanang itaas na bahagi na menu.

May posibilidad din na **Lumikha ng gagawin o kaso** galing sa isang talaaan ng email.

Kung ang mga adddress na email ay (from, to, cc) nasa talaan email na kilala sa sistema ay ipapakitaa nito sa tao kung sila ay may kaugnayaan sa (Contact, Lead, Gumagamit etc).Kung ang ibang email na address ay bago, ikaw ay may kayang **Gumawa ng contact** mula doon.

Ang lahat ng mga email ng may kaugnayan sa tukoy na rekord ay makikita sa panel na History ng record na iyon. Kung ang ibang email ay magkaugnay, halimbawa, sa opportunity pero ang opportunity ay may ugnyan sa account, Ito ay makikita ng pareho sa opportunity at account.

## Pagpapadala ng mga email

maaari kang gumawa ng bagong email gamit ang mga konting pamamaraan:
* *Gumawa ng Email* na pindutan sa on list na view ng email;
* magreply sa ibang email;
* pagclick ng isang email address sa iibang rekord;
* *Gumawa ng Email* na aksyon ng panel ng mga activities.

May kakayan din na **pumili ng template** sa iyong email.

Pwede kang magset-up ng **Lagda sa email** sa preperensiya.

## Mga Folder ng Email

Ang mga gumagamit ay maaring gumawa ng mga sariling folder na paglalagyan ng mga email para sa iyong ikabubuti.Ang Listahan ng pwedeng gamitin na mga folder ay makikitaa sa pahina ng mga email sa kaliwang banda. Para makagawa at maka-edit ng mga folder ay sundin ang mga Email > dropdown in sa kanang-taas na bahagi sa sulok > Folders. `Laktawan ang abiso` ay nangangahulugan ng ayaw mong makatanggap ng balita ukol sa mga paparating na mga email na mahuhulog sa ibang folder. Sa pamamagitan ng paggamit ng pansala o filterng email ay may posibilidad na ilagay ang mga email sa mga folder sa pamamaraang awtomatiko ukol sa tukoy na pamamaraan.

## Mga pansala sa email

Ang mga administrador ay kayang makagawa ng pangkalahatang pang-sala ng email para laktawan ang mga di kasiya-siyang mga email. Ito ay magaganap sa adminitrador > Pangsala ng email.

Ang mga regular na gumagamit ay pwedeng gumawa ng salaan ng email para sa kanilang mga pansariling Account ng email or para sa pangkalahatang inbox. Ang lahat ng ito ay mahahanap sa Mga Emails > dropdown sa nasa kanang bahagi sa sulok > Mga pangsala.

May dalawang klase ng pagsasala:
* Laktaw - ang email ay ilalagaay sa *basurahan* o hindi na-import kung ang pagsasala ay may kaugnayan sa Personal na Email na Account;
* Ilagay sa folder - Ang mga na-import na email ay awtomatikong malalagay sa iyang tukoy na folder ng gumagamit.

## Mga Templates sa Email

Ang mga email na templates ay makikita sa Mga Email > dropdown na nasa kanang itaas na sulok > Mga email na template. Ang mga ito ay magagamit kapwa sa pagpapadala ng maramihang email at sa mga email na regular. `Isa-off` na checkbox ay nangangahulugan na ang email na template ay pwede lamang gamitin ng isang beses, kung ano ang karaniwan para sa pagmemerkado sa email.

May posibilidad na pwedeng gumamit ng mga placeholder sa katawan at paksa ng template ng email e.g. {Account.Pangalan}, {tao.emailAddress}. Sila ay papalitan ng mga halaga na kaugnay sa talaan.

Maari kang gumamit ng karagdagang nakalaan na mga placeholder sa katawan ng template: {optOutUrl} at {optOutLink}.

```
<a href="{optOutUrl}">umiwas</a>
```
Ito ay link sa pag-iwas sa serbisyo mula sa maramihang email
