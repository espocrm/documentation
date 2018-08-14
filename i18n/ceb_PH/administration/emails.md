# Mga Email

> Importante. Ang [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) kay gikinahanglan gikonpigyur sa inyohang sistema para mugana ang pagkuha sa email. Makit-an ni nimo nga inpormasyon sa imohang EspoCRM sa Administration > Scheduled Jobs.

## Kinatibuk-an

Ang EspoCRM kay naay abilidad nga mumonitor sa mga IMAP na mga mailbox. Ang email kay pwede ma-archive sa 2 ka pamaagiL Group Email Accounts ug Personal Email Accounts.
Ang Group Inbound Accounts kay gituyo para sa mga grupo nga mga mailbox: ang pinaka komon nga kaso kay ang usa ka suporta na box. Ang Personal Email Accounts kay gituyo para sa personal nga mga mailbox sa user.

Sa pagabot sa email, ang sistema kay suwayan og pagkonektar sa mga saktong record (Accounts, Lead, Opportunity, Case). Ang mga user nga nagsunod ana nga mga record kay makadawat og notipikasyon bahin sa bagong email nga naabot sa sistema, bisan pa wala sila gibutang sa To or CC.

## Group Email Accounts

Ang administrado ra ang maka himo og Group Email nga mga account. Ang mga Group Email Account kay pwede magamit para pagdawat og pagpadala og mga email. Ang pagpadala og email gikan sa group nga mga account kay naa na gikan sa 4.9.0 nga version.

Ang Teams nga field kay nag determina kung asa nga team e-assign ang email.

Kung ang group email account kay naay SMTP ug gicheck na ni nga shared, ang pag-akses ani kay mahimong ikontrol sa mga Role sa Group Email Account nga pagtugot. Ang Teams nga field kay gamiton kung ang lebel sa pagtugot kay 'team'.

Naay abilidad ang sistema nga musend og awtomatik nga tubag kong naay padulong nga email.

## Email-ngadto-Kaso

Naay opsyon para ang sistema muhimo og cases para sa mga padulong nga group email.
Ang kani nga bahin kay gituyo para sa pagsuporta sa mga team. Ang mga kaso kay pwede ibahin ngadto sa lain laing mga user para sa espesipiko nga mga team gamit ang kani nga mga pamaagi: `direct assignment`, `round-robin` and `less-busy`. Ang una ra nga email sa thread ang muhimo og bago nga kaso. Anga sumusunod nga mga email kay e-konektar sa nahimo na nga kaso ug ipakita kini sa Stream nga panel.

Kung ang user kay gusto mupadala og tubag ngadto sa kustomer, gikinahanglan nila siguradohon nga ang kaso kay gipili para mahimong ginikanan sa email nga gipadala. Himoon ni nga ang ang tubag sa customer kay ipadala sa group email nga address kay sa sa email sa user.

## Personal nga mga Email Account

Users can setup their own email accounts that need to be monitored. Emails > Top Right Dropdown Menu > Personal Email Accounts. Administrator also can manage users' email accounts.

Ang mga user kay makasetup og ilahang kaugalingong mga count nga gikinahanglang obserbahan. Top Right Dropdown Menu > Personal Email Accounts. Ang administrador kay pwede makadumala sa mga email account sa user.

## Mga Email Filter

Kini kay musala sa mga padulong nga mga email sumala sa ilahang mga espesipiko nga mga kriterya. E.g. kun dili ka ganahan makadawat og mga notipikasyon nga mga mensahe gikan sa ubang mga applikasyon para ma-import padulong sa EspoCRM, pwede ka magbuhat ug filter para laktodan kini sa EspoCRM.

Ang admin kay makahimo og global nga mga filter, para ma-gamit sa tanang mga email account. Ang mga user kay pwede nga muhimo og mga filter para sa ilahang personal nga email account para sa kinatibuk-ang inbox.
