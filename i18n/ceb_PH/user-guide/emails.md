# Mga Giya sa Paggamit sa mga Email

Ang EspoCRM kay naghatag og abilidad nga mukuha ug email gikan sa IMAP nga box. Gihimo niining posible ang paggamit sa EspoCRM isip usa ka email client kauban sa mga feature nga para ra sa CRM.

## Mga IMAP account

*Timan-e: Gikinahanglan ka nga naay [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) nga sakto pagkakonpigyura sa imohang sistema para naay mugana ang mga padulong nga mga email.*

Ang user kay maka-setup ug IMAP account sa Personal Email Accounts nga page (Emails tab > top-right menu > Personal Email Accounts).

I-specify kung asa nga mga folder ang ipangmonitor sa Monitored Folders nga field. Kung wala ray giusab, kini kay giset padulong sa INBOX. Kung mugamit kag eksternal nga email client para mupadala og email, pwede nimong mupuno og Sent nga folder para iarchive ang kadtong mga email.

Ang *Fetch Since* kay mutugot nga makapili ka sa petsa kung kanus-a ang mga email kay gigikanan og archive. I-set sa bisan unsang mga petsa sa dili pa ang karong adlawa kung gusto ka iarchive ang mga karaan nga email.

Naay abilidad nga mudirekta ug *Folder* sa Personal Email Account. Ang mga padulong nga mga email kay ibutang sa kadto nga folder.

## Mga SMTP account

Ang mga user kay mamahimong muset-up ug mga SMTP nga mga setting sa Preferences ug sa ilaha pong mga Personal Email Account. Ang administrado kay mamahimo pong mugamit ug system SMTP (himoon ning Shared).

Ang mga user kay pwede mahatagan og daghang SMTP nga account (gikan sa bersiyon 4.2.0). Pero ang mga email address nga magamit sa user para mupadala og email kay i-define sa mga email address sa *User* nga rekord.

## Paggamit sa mga Email

Ang mga email kay kwaon sa cron (sa background) kada pipila ka mga minuto (ang hingdugayon kay depende sa gi-set Administrador).
Pwede nimong tan-awon ang imohang tanang mga email sa Emails nga tab. Adunay mga standard folder nga Ibox, Sent, Draft emails sa wala nga bahin.

Ang *Status* nga field. Ang `Sent` kay nagpasabot nga gikan kini sa CRM, `Archived` – gikuha gikan sa IMAP nga accoun o gimanomano nig archive, `Draft` – pasabot nga ang email kay nahimo isip usa ka draft.

Kung maabot ang bag-o nga email, ang sistema kay musuway og ila kung kang kinsa nga rekord nakatag-iya niini. Pwede kini mulink sa Account, Lead, Opportunity, Case (ug Contact sa B2C nga mode) etc. Kung wala kini nailhan, ang user kay maka manomanog link pinaagi sa pagbutang sa *Parent* nga field.

Kung ang email nigikan sa usa ka potensiyal nga kliyente, ang user kay mamahimong **mu-convert ngadto sa Lead**. Pag-abli og Email entry ug i-click ang Create lead nga naa sa pinakababaw sa tuo nga menu.

Posible usab nga **muhimo og Task o Case** gikan sa email nga rekord.

Kung ang mga email address (from, to, cc) sa usa ka email nga rekord kay mahibal-an sa sistema, ipakita niini ang mga tawo nga naay relasyon niini (Contact, Leader, User etc). Kung ang uban nga mga email address kay bag-o, pwede nimong **muhimo og contact** gikan didto.

Ang tanang mga email nga naay relasyon sa usa ka espisipiko nga rekord kay ipakita sa History na panel sa kadto nga rekord. Kung ang ubang mga email kay naay relasyon, pananglitan, sa oportunidad pero ang oportunidad kay naay relasyon sa kadto nga account, ipakita kini sa duha (oportunidad og account).

## Pagpadala ug mga Email

Pwede kang muhimo og bag-o nga email gamit ang pila ka mga pamaagi:
* *Compose Email* nga pindutanan sa Emails list nga view;
* pagtubag sa lain nga email;
* pagclick sa usa ka email address sa laing rekord;
* *Compose Email* aksyon sa Activities nga panel.

Naay abilidad nga **mupili og template** sa imohang email.

Mahimo kang muset-up sa **email signature** didto sa Preferences.

## Mga Email Folder

Ang mga user kay mamahimong muhimo og ilahang kaugalingong mga email folder para conveninent nga mabutangan og uban nga mga email. Ang lista sa mga pwedeng folder kay naa makit-an sa Emails nga page sa walang bahin sa app. Para makahimo o mu-usab sa mga folder sunda ang Emails > dropdown sa pinakataas nga tuong bahin > Folders. Ang `Skip Notification` nagpasabot nga gusto kang manotipikasyonan sa mga padulong nga email nga padulong sa ubang mga folder. Sa paggamit sa mga Email Filter, posible nga awtomatik mubutang og email sa folder gamit ang mga giset nga kriterya.

## Mga Email Filter

Ang administrador kay makahimo og global nga mga filder para laktaran ang mga dili nindot nga ma email. Makita kini sa Administration > Email Filters.

Ang regular nga user kay makahimo og mga email filter para sa ilahang mga Personal Email Account o para sa tibuok nga inbox. Makit-an kini sa Emails > dropdown sa pinakataas nga tuong bahin > Filters.

Naay duha ka klase nga mga filder:
* Skip - ang email kay ibutang sa *Trash* o dili ma-import kung ang filter kay walay relasyon sa Personal Email Account;
* Put in Folder - ang mga naimport nga mga email kay awtomatik nga ibutang sa folder sa gi-specify nga user.

## Mga Email Template

Ang mga email template kay naa makit-an sa Emails > dropdown pinakataas nga tuong bahin > Email Templates. Pwede ning magamit para sa pag email og dinaghan og para sa mga regular nga mga email. Ang `One-off` nga checkbox nagpasabot nga ang email template kay kausa ra unta gamiton, kung unsay kasagaran gamiton sa email nga marketing.

Posible usab mugamit ug mga placeholder sa sulod sa email template ug subject e.g. {Account.name}, {Person.emailAddress}. Ilisan kini sa mga balor sa ilahang related nga mga rekord.

Pwede kang mugamit og adisyonal nga mga gireserba nga mga placeholder sa sulod sa template: {optOutUrl} ug {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Kini kay ang ubsubscribe nga link para sa dinaghang email.
