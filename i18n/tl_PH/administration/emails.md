# Mga EMail

> Importante. Ang [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) ay dapat nakaconfigure sa iyong sistema para gumawa ng email fetching na task. Makikita mo impormasyon na ito sa iyong EspoCRM sa Administration > Scheduled Jobs.

## Kabuuran

Ang EspoCRM ay may abilidad na magmonitor ng mga IMAP mailbox. Ang email ay pwede i-archive sa pamamagitan ng dalawang paraan: Group Email Accounts at Personal Email Accounts. Ang Group Inbound Accounts ay ginawa para sa mga group mailbox: ang pinaka pangkaraniwang uri ay ang support box. Ang Personal Email Accounts ay ginawa para sa mga personal na mailbox ng user.

Habang may paparating na email, ang sistema ay susubukang i-link ito sa angkop na rekord (Accounts, Lead, Opportunity, Case). Ang mga user na sumusunod sa rekord na ito ay makakatanggap ng notipikasyon tungkol sa bagong email sa loob ng sistema, kahit na wala sila sa To o CC.

## Mga Group Email Account

Ang administrador lang ang may kakayahang mag-setup ng mga Group Email Accounts. Ang Group Email Accounts ay pwedeng gamitin para sa pagtanggap at pagpapadala ng mga email. Ang pagpapadala ng mga email galing sa mga group account ay maari ng gawin mula sa 4.9.0 na version.

Ang Teams na field ay nagtutukoy kung sa anong team i-aasign ang paparating na email.

Kung ang group email account ay may SMTP at ito ay naicheck bilang shared, kung ganoon ang access ay makokontrol ng mga Role gamit ang Group Email Account na permission.

Mayroong abilidad para ma-set ang sistema na mag magpadala ng auto-reply para sa mga paparating na mga email.

## Email-to-Case

Mayroong opsyon para ma-set ang sistema na gumawa ng mga kaso galing sa paparating na mga group email.
Ang feature na ito ay ginawa para sa pagsuporta ng mga team.
Ang mga kaso ay pwede i-distribute sa mga user galing sa isang espesikong team ayon sa mga paraang ito: 
`direct assignment`, `round-robin` and `less-busy`. 
Ang unang email lang ng thread ang pwedeng gumawa ng bagong case.
Ang mga susunod na mga email ay ililink sa mga nagawa ng case record at ididisplay sa Stream panel nito.

Kung ang mga user ay gustong magpadala ng reply sa mga customer, kinakailangan nilang siguradohin na ang case ay nakaselect bilang parent ng email na pinapadala. Dahil nito, ang customer ay magrereply na sa group email address sa halip na sa address ng user.

## Mga Personal Email Account

Ang mga user ay pwedeng mag-setup ng kanilang sariling email account na kailangang imonitor. Emails > Top Right Dropdown Menu > Personal Email Accounts. Ang administrador ay pwede ring mamahala ng mga email account ng user.

## Mga Email Filter

Ang mga ito ay pinapahintulutang magfilter ng mga paparating na email ayon sa specified na kriterya. E.g. kung hindi mo gustong makatanggap ng mga mensaheng notipikasyon galing sa ibang application para iimport sa EspoCRm, pwede kang gumawa ng filter para laktawan ito ng EspoCRM.

Ang admin ay pwedeng gumawa ng mga global filter, na iaapply sa lahat ng mga email account. Ang mga user ay pwede gumawa ng mga filter para sa kanilang personal na email account at para sa kanilang buong inbox.
