# Stream

Ang Stream sa EspoCRm kay usa ka feed kung asa ka makakita ug mga update ug mga bag-ong adisyon para sa mga rekord nga nagsunod ka. Pwede pug ka makapost sa imohang stream ug sa stream sa uban nga mga user (gikan sa bersiyon 3.8.0). Naay duha ka klase nga mga stream sa EspoCRM: record stream ug user stream.

Kung wala ray nausab, ang musunod nga mga entity kay naay mga stream: Accounts, Contacts, Leads, Opportunities, Cases. Ang mga administrador kay mu-enable o disable sa stream para sa usa ka entity gamit ang [Entity Manager](../administration/entity-manager.md).

## Record Stream

Ang Record Stream kay ipakita sa sulod sa Stream nga panel sa usa ka espisipiko nga rekord sa detail view. Ang mga post, update, ug mga bag-ong adisyon nga naay relasyon sa kasamtangang rekord kay ipakita dinhi.

## User Stream

Ang mga user ka mamahimong mutan-aw sa ilahang stream sa Stream dashlet ug sa Stream tab sad. Ang mga user kay pwede sam makakita sa stream sa laing mga user sa detail view sa user, kung naa silay access nga gikontrolar sa `User Pemission` nga field sa mga Role.

Ang user stream kay makakita og post, mga update, ug mga bag-ong adisyon sa mga naay relasyon na rekord nga gisunod sa user. Pwede usab ka makakita og mga post nga giaddress ngadto sa user. Kadtong mga post kay walay relasyon sa bisan unsang rekord.

## Mga Notipikasyon

Makadawat ka og mga notipikasyon kabahin sa mga bag-o nga adisyon sa imohang stream nga gihimo sa ubang mga user.

## Mga Post

Pwede kang muhimo og post nga naay relasyon sa usa ka rekord. Pwede usab ka maka-attach ug daghan nga mga file ug imahe didto sa imohang post. Kung gusto kang muhisgot ug uban tawo sa imohang post, pwede kang mu-type og `@` nga simbolo ug sugdan ug type ang pangalan sa user. Ang user nga imohang nahisgot sa imohang post kay mahatagan og notipikasyon kabahin niini.

## Mga post ngadto sa mga user

_This feature is available since version 3.8.0._
_Ang kani nga feature kay naa na gikan sa bersiyon 3.8.0._

Ang mga user kay mamahimong muhimo og post ngadto sa mga user, sa mga team, o sa tanang mga user ug sa kaugalingon. Ang access para sa kani nga abilidad kay gikontrolar sa `Assignment Permission` nga field sa mga Role.

## Pag-filter

Pwede nimong i-filter ang mga butang nga gusto nimong ipakita sa stream: `All`, `Posts` o `Updates`. 

