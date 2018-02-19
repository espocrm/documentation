# Upravljanje poslovnih procesov

Orodje Upravljanje poslovnih procesov (BPM) vam omogoča, da v EspoCRM oblikujete in avtomatizirate poslovne procese. Gre za stroj, ki izvaja poslovne procese, opisane v BPMN 2.0 standardu. Orodje BPM je na voljo v razširitvi [Napredni paket](https://www.espocrm.com/extensions/advanced-pack/).

![Primer BPM-ja](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### Kako se razlikuje od orodja Delovni tokovi

Orodje Delovni tokovi je namenjeno avtomatizaciji preprostih poslovnih pravil, brez zaporednih elementov, ki prikazujejo potek, skratka ko ni potrebno grafično prikazati poteka dela.

Orodje BPM je namenjeno kompleksnejšim poslovnim potekom, pri katerih so lahko tudi razhajajoči in stekajoči se tokovi, zamiki izvajanja, posegi uporabnika. Pogled s prikazom poteka omogoča, da je poslovni proces bolj razumljiv človeku; dnevnik omogoča, da lahko vidite, kako je proces potekal.

## Diagrami s prikazom poteka procesov

V administracijskem panelu je na voljo povezava do diagramov s prikazom poteka procesov. Doda se jo lahko tudi kot jeziček na navigacijskem panelu.

Diagrami s prikazom poteka so namenjeni oblikovanju poslovnih procesov. Administrator lahko ustvari in ureja takšne diagrame. Redni uporabniki pa lahko diagrame zgolj vidijo.

Vsak diagram ima svoj specifični tip entitete (polje Tip cilja). Diagram določa izvajanje prihodnjih ustvarjenih procesov. Na njem so zajeti elementi, ki prikazujejo potek, ter povezave med elementi.

Če pri diagramu ni označeno polje 'Aktiven', potem ne bo sproženo ustvarjanje procesov.

Za prikaz podrobnosti in parametrov določenega elementa na diagramu morate klikniti nanj. V urejevalnem načinu boste lahko urejali parametre.  

## Procesi

Do Procesov lahko pridete iz administracijskega panela. Povezavo se lahko doda tudi kot jeziček na navigacijskem panelu.

Proces predstavlja ustvarjen poslovni proces. Ko se zažene, prejme status 'Zagnan'. Ko se proces konča, prejme status 'Končan'. Proces lahko ročno ustavi tudi uporabnik, ki ima pravice za urejanje procesa. Če se ga ustavi ročno, prejme status 'Ustavljen'.

Proces se zažene glede na diagram poteka. Ko je proces enkrat zagnan, ne morete spremeniti diagrama poteka processa.

Nujno je, da je proces povezan z enim samim ciljnim zapisom.

Procesi se lahko zaženejo samodejno (ko so izpolnjeni določeni pogoji oziroma glede na urnik) ali ročno (če obstaja vsaj en dogodek Začetek v diagramu poteka). Da bi uporabnik ročno zagnal proces, mora klikniti gumb 'Zaženi proces' na seznamskem pogledu procesov.

## Elementi Diagrama poteka

### Dogodki

Dogodki so na diagramu prikazani kot krogci.

#### Dogodek Začetek

Nima parametrov. Gre za začetno točko procesa. Dogodek Začetek lahko ročno zažene uporabnik, ki ima pravice za ustvarjanje procesov. Uporabnik mora klikniti gumb 'Zaženi proces' na seznamskem pogledu procesov.

#### Dogodek Pogojni začetek

Začetna točka procesa. Zažene se samodejno, ko so izpolnjeni določeni pogoji. Obstajata dva tipa sprožilcev: 'Po ustvaritvi zapisa', 'Po shranjevanju zapisa'.

#### Dogodek Časovno določen začetek

Začetna točka procesa. Procese zažene ob določenem času. Določiti morate seznamsko poročilo, ki vrne zapise za ustvarjanje procesov ter časovno razvrščanje v obliki, primerni za crontab.

#### Dogodek Pogojno nadaljevanje

Ta dogodek ustavi potek, dokler ni izpolnjen vnaprej določeni pogoj.

#### Dogodek Časovno določeno nadaljevanje

Ta dogodek ustavi potek in čaka tako dolgo, kot to določajo parametri dogodka.

Za kompleksnejše časovne nastavitve se lahko okorisite [formule](formula.md). Skripti s formulami bi morali vrniti vrednost Datum-Čas (v UTC časovnem pasu). Ko nastopi vnaprej določeni čas, se tok nadaljuje z naslednjim elementom.

Z uporabo funkcije datetime\closest je mogoče nastaviti števec na določen čas v prihodnosti, na primer na začetek naslednjega delovnega dne.

#### Dogodek Konec

Konča trenutni potek. Ne ustavi drugih tokov, ki potekajo vzporedno. Ko potek pride do dogodka Konec in ni nobenih vzporednih tokov, se proces konča.

#### Dogodek Takojšnji konec

Konča vse tokove. Proces se zatem konča.

### Prehodi

Prehodi so prikazani kot diamanti.

#### Ekskluzivni prehod

Lahko razcepi ali združi tokove.

Ko pride do razcepitve, prehod določi posamični tok (pot), ki bo izbran glede na vnaprej določene pogoje. Prvi izpolnjeni pogoj določi tok, drugi pogoji se ne upoštevajo. Možno je določiti privzeti tok. Privzeti tok je izbran, če ni izpolnjen noben pogoj. Privzeti tok je označen s poševnico.

Ko se tokovi združijo, prehod zgolj usmeri tok na izhodni element. Potem ko tok preide skozi prehod, se ta ne zapre, zato se vzporedni tokovi ne bodo združili v en sam tok.

![ekskluzivni prehod - razcepitev](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-divergent.png)

![ekskluzivni prehod - združitev](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inkluzivni prehod

Lahko razcepi ali združi tokove.

Ko pride do razcepitve, prehod lahko preusmeri tok na enega ali več vzporednih tokov (poti), odvisno od izpolnjenih pogojev vsakega toka. Privzeti tok je izbran, če ni izpolnjen noben pogoj. Privzeti tok je označen s poševnico.

Če je potrebno združiti vzporedne tokove, ki so nastali zaradi razcepitvenega inkluzivnega prehoda, morate uporabiti združitveni inkluzivni prehod. Ta bo počakal na vse vhodne tokove in bo šele nato usmeril tok na izhodni element.

![inkluzivni prehod](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-inclusive.png)

Opomba: Razcepitveni in združitveni prehodi morajo biti v ravnovesju.

Opomba: Če je eden od vzporednih tokov iz določenega razloga končal svojo pot, potem razcepitveni prehod nikoli ne bo aktiviran. Proces se bo ustavil. Ogibajte se takšnih diagramov poteka, ki lahko povzročijo takšno težavo.

#### Vzporedni prehod

Lahko razcepi ali združi tokove.

Ko pride do razcepitve, razcepi tok v več vzporednih tokov. Za ta tip prehoda ni nobenih parametrov.

Ko pride do združitve, prehod počaka na vse vhodne tokove in šele nato usmeri tok na naslednji izhodni element.

![vzporedni prehod](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-parallel.png)

Opomba: Razcepitveni in združitveni prehodi morajo biti v ravnovesju.

Opomba: Če je eden od vzporednih tokov iz določenega razloga končal svojo pot, potem razcepitveni prehod nikoli ne bo aktiviran. Proces se bo ustavil. Ogibajte se takšnih diagramov poteka, ki lahko povzročijo takšno težavo.

#### Z dogodki sprožen prehod

Lahko samo razcepi tokove.

Ustavi tok, dokler ni sprožen kateri koli od izhodnih dogodkov. Sproženi dogodek določi en sam tok. Drugi izhodni dogodki so zavrnjeni.

Na drugi strani izhodnih zaporednih tokov so lahko samo nadaljevalni dogodki.

![z dogodki sprožen prehod](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-event-based.png)

### Aktivnosti

Aktivnosti so prikazane kot zaobljeni pravokotniki.

#### Naloga

Naloga lahko izvrši naslednje akcije:

* Ustvari zapis - ustvari nov zapis katerega koli tipa entitete;
* Ustvari povezani zapis - ustvari nov zapis, ki je povezan s ciljnim zapisom;
* Posodobi ciljni zapis;
* Posodobi povezani zapis - posodobi zapis ali zapise, ki so povezani s ciljnim zapisom;
* Posodobi ustvarjeni zapis - posodobi določeno polje katerega koli zapisa, ki je bil ustvarjen v trenutnem procesu;
* Posodobi zapis procesa - lahko se uporabi za dodelitev procesa določenemu uporabniku ali timu;
* Poveži z drugim zapisom - poveže ciljni zapis z izbranim zapisom;
* Prekini povezavo z drugim zapisom - povzroči, da ciljni zapis ni več povezan z izbranim zapisom;
* Uporabi dodelitveno pravilo - določi ciljni zapis, zapis procesa ali kateri drug zapis, ki ga je ustvaril proces glede na določeno pravilo;
* Ustvari obvestilo - ustvari obvestilo znotraj aplikacije za določene uporabnike;
* Ustvari sledenje - povzroči, da določeni uporabniki sledijo ciljni zapis, zapis procesa ali kateri drug zapis, ki ga je ustvaril proces;
* Zaženi storitveno akcijo - zažene storitvene akcije po meri, ki jih izdelajo razvijalci.

Akcije, ki so na voljo za nalogo, so skoraj enake tistim pri Delovnem toku. Poglejte si več podrobnosti glede [akcij pri delovnem toku](workflows.md#actions).

#### Pošlji sporočilo z nalogo

Pošlje e-poštno sporočilo določenemu prejemniku.

#### Uporabnikova naloga

Omogoča prilagodljiv sistem uporabnikove interakcije. Ustavi izvajanje, dokler uporabnik (določen eksplicitno ali z dodelitvenim pravilom) ne opravi naloge. V sistemu bo ustvarjen zapis Proces uporabnikove naloge.
Originalno so na voljo trije tipi akcij: Sprejmi, Preglej, Opravi.

* Tip Sprejmi zahteva, da uporabnik izbere med 'Sprejeto' in 'Zavrnjeno'.
* Tip Preglej ima samo eno možnost: 'Pregledano'.
* Tip Opravi ima dve možnosti: 'Opravljeno' in 'Neopravljeno'.


Uporabnik, ki je določen ustvarjenemu zapisu Proces uporabnikove naloge, bo prejemal obvestila znotraj aplikacije. Administrator lahko omogoči tudi e-poštna obvestila.

Uporabniki lahko prav tako dodajo element Proces uporabnikove naloge na svojo nadzorno ploščo, da lahko spremljajo dejanski proces svojih nalog.

Obstaja možnost branja rešitve opravljene uporabnikove naloge znotraj razcepitvenih prehodov ali pogojnih dogodkov, s čimer se naredi ustrezna razcepitev v poteku procesa.

#### Skriptna naloga

Zažene skript v [Espo-formula](formula.md) jeziku. Vse določene spremenljivke (`$imeSpremenljivke`) bodo shranjene in na voljo znotraj procesa.

### Tokovi

#### Zaporedni tok

Predstavljen je z neprekinjeno puščico. Prikazuje zaporedje, v katerem bodo elementi procesa izvršeni.

## Pogoji

Pogojni dogodki - ekskluzivni in inkluzivni razcepitveni prehodi imajo pogoje, ki določajo potek procesa.

V uporabniškem vmesniku se lahko označi pogoje za naslednje zapise:

* Ciljni zapis;
* Zapisi, ki so povezani s ciljem z relacijami več proti eden in otroci proti starši;
* Zapisi, ki jih je ustvaril proces s pomočjo nalog;
* Zapisi uporabnikovih nalog, ki omogočajo pregled rešitev naloge.

Pogoje je prav tako možno določiti v [Espo-formula](formula.md) jeziku.

Pogoji v orodju BPM so enaki kot pri orodju Delovni tokovi. Poglejte si več podrobnosti o [pogojih delovnega toka](workflows.md#conditions).

## Primeri

### Primer 1

![Primer 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

### Primer 2

![Primer 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

### Primer 3

![Primer 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)
