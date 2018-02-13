# Upravljanje vlog

## Pregled

Da bi omejili dostop za nekatere uporabnike, morate uporabiti Vloge (Roles). Administrator lahko upravlja vloge v administratorskem panelu. Vsaka vloga določa dostop do določenih področij in je dodeljen uporabnikom, ki imajo to vlogo.

En uporabnik ima lahko več vlog. Te vloge so lahko izbrane za specifičnega uporabnika (polje ‘Roles’ pri postavki User) in/ali so podedovane od tima, ki mu uporabnik pripada.

Če ima uporabnik več vlog, potem se te združijo, tako da ima vloga z več pravicami višjo prioriteto. To omogoča administratorju, da z lahkoto in veliko fleksibilnostjo upravlja nastavitve stopenj dostopa.

To, katere pravice ima določeni uporabnik, lahko preverite tako, da kliknete na gumb 'Access' na podrobnem pogledu uporabnika.

![1](../_static/images/administration/roles-management/scope-level.png)

## Primer

Denimo, da uporabnik pripada timu ‘Sales’. Ta tim ima samo eno vlogo, ‘Salesman’. Torej bodo vsi uporabniki iz tega tima dobili vlogo ‘Salesman’.

Vloga ‘Salesman’ je določena takole:

Sled:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Priložnost:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Uporabniki bodo lahko imeli vpogled samo v tiste sledi in priložnosti, ki pripadajo timu ‘Sales Department’ (polje ‘Teams’). Uporabniki bodo lahko urejali samo tiste sledi in priložnosti, ki so jim dodeljene oziroma tiste, ki so jih sami ustvarili. Uporabniki ne bodo mogli odstraniti nobene sledi ali priložnosti.

Določenemu uporabniku, ki ima v podjetju položaj vodje prodaje, želimo omogočiti več pravic. Ta uslužbenec mora imeti možnost branja/urejanja/brisanja vseh zapisov tima ‘Sales’. Uporabnik bi moral pripadati našemu timu ‘Sales’. Vendar moramo ustvariti novo vlogo ‘Sales Manager’ in za tega uporabnika izbrati to vlogo v polju ‘Roles’.

Vloga ‘Sales Manager’ je določena takole:

Sled:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Priložnost:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Naš uporabnik bo lahko upravljal vse sledi in priložnosti tima ‘Sales’.

## Posebne pravice

### Pravice dodeljevanja

Nastavite ta parameter, če želite omejiti možnost dodeljevanja/premeščanja zapisov drugemu uporabniku in/ali timu. Če izberete `team`, potem bo možno dodeljevati le uporabnikom znotraj lastnega tima(ov). Če pa izberete `no`, uporabniki sploh ne bodo mogli dodeljevati/premeščati zapisov.

Ta pravica prav tako določa, ali uporabnik lahko objavlja na tok drugih uporabnikov/timov.

### Pravice uporabnika

Omogočajo, da se uporabnikom omeji možnost vpogleda v aktivnosti, koledar in tok drugih uporabnikov.

### Pravice portala

Določajo dostop do informacij na portalu, možnost objavljanja sporočil uporabnikom portala.

### Pravice skupinskega e-poštnega računa

Določajo dostop do skupinskih e-poštnih računov, možnost pošiljanja e-pošte iz skupinskega SMTP.

### Pravice izvažanja

Določajo, ali uporabnik lahko izvaža zapise. (od verzije 4.9.0 dalje)

## Privzete nastavitve

Če ni določenih nobenih pravic, potem lahko uporabniki berejo in urejajo vse zapise. Vendar pa jih ne morejo brisati, razen tistih, ki so jih sami ustvarili in so jim hkrati tudi dodeljeni.

Vseeno obstaja možnost, da se omeji dostop, ki je določen na začetku, tako da se omogoči način 'ACL Strict Mode' pod Administration > Settings.

## Varnost na nivoju polj

Omogoča nadzor dostopa za določena polja.

Privzete nastavitve so takšne, da lahko uporabnik bere vsa polja, če lahko bere zapis. Uporabnik lahko ureja vsako polje, če lahko ureja zapis. Dostop do določenih polj lahko omejite z uporabo varnosti na nivoju polj (Field Level Security).

V pogledu za urejanje zapisa vloge v razdelku Field Level kliknite na ikono poleg določenega območja in nato izberite ustrezno polje. Zatem boste lahko določili stopnjo dostopa za akcijo `read` (branje) in `edit` (urejanje). Obstajata dve možnosti: `yes` in `no`.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
