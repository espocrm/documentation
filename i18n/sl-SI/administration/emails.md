# E-pošta

> Pomembno. Da bi v vašem sistemu delovalo pobiranje e-pošte, je potrebno skonfigurirati [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab). Informacije lahko dobite v svojem EspoCRM pod Administration > Scheduled Jobs.

## Pregled

EspoCRM ima možnost nadzora IMAP poštnih predalov. E-pošta se lahko arhivira na dva načina: kot skupinski e-poštni računi in kot osebni e-poštni računi. Skupinski dohodni računi so namenjeni za skupinske poštne predale: najpogosteje se uporablja poštni predal za podporo. Osebni e-poštni računi so namenjeni za osebne poštne predale uporabnikov.  

Ko prispe e-pošta, jo sistem poskuša povezati z ustreznim zapisom (Računi, Sled, Priložnost, Primer). Uporabniki, ki sledijo ta zapis, bodo v sistemu prejeli obvestilo o novi e-pošti, tudi če niso navedeni v polju Za ali CC.

## Skupinski e-poštni računi

Samo administrator lahko nastavi skupinske e-poštne račune. Skupinski e-poštni računi se lahko uporabljajo tako za prejemanje kot pošiljanje pošte. Pošiljanje e-pošte iz skupinskih računov je na voljo od verzije 4.9.0.

Polje Teams določa, katerim timom bo dodeljena dohodna e-pošta.

Če ima skupinski e-poštni račun SMTP in je označen kot deljen, potem bodo dostop nadzorovale vloge (Roles) pod pravice za Skupinski e-poštni račun. Če je stopnja pravic nastavljena na 'team', bo uporabljeno polje Teams.  

Obstaja tudi možnost nastavitve, da sistem pošlje samodejni odgovor za dohodno e-pošto.

## E-pošta ustvari primer

Obstaja možnost, da se sistem nastavi tako, da ta ustvari primere iz dohodne skupinske e-pošte. Ta možnost je namenjena timom za podporo. Primere se lahko razdeli uporabnikom iz določenega tima na naslednje načine: `direct assignment` (neposredno dodeljevanje), `round-robin` (krožno dodeljevanje) in `less-busy` (dodeljevanje najmanj zasedenemu). Samo prvo e-poštno sporočilo v nizu povezane pošte ustvari nov primer. Vsako nadaljnje sporočilo se poveže z že obstoječim zapisom primera in se prikaže v njegovem Stream panelu.

Kadar uporabniki želijo poslati odgovor stranki, se morajo prepričati, da je primer izbran kot starš e-poštnega sporočila, ki se pošilja. Ta odgovor stranki bo poslan iz skupinskega e-poštnega naslova, ne pa iz uporabnikovega.

## Osebni e-poštni računi

Uporabniki lahko nastavijo svoje osebne e-poštne račune, ki jih je treba nadzorovati. Emails > Padajoči meni zgoraj desno > Personal Email Accounts. Tudi administrator lahko upravlja e-poštne račune uporabnikov.

## E-poštni filtri

Ti omogočajo filtriranje dohodne e-pošte glede na določene kriterije. Na primer, če ne želite, da se sporočila za obveščanje, ki jih pošlje določena aplikacija, uvozijo v EspoCRM, lahko ustvarite filter, da jih EspoCRM izpusti.

Administrator lahko ustvari globalne filtre, ki potem veljajo za vse e-poštne račune. Uporabniki lahko ustvarijo filtre za svoj osebni e-poštni račun in za celotni poštni predal.
