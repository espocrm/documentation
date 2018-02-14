# Upravljalnik entitet

Upravljalnik entitet je na voljo v panelu Administracija. Omogoča vam, da svoj EspoCRM sistem popolnoma prilagodite svojim potrebam. Omogoča vam naslednje:

* Dodajanje novih tipov entitet.
* Prilagajanje obstoječih tipov entitet: lahko spremenite oznake, privzeti vrstni red v seznamskem pogledu, omogočite ali onemogočite tok.
* Prilagajanje polj: lahko dodate nova polja, prilagodite obstoječa.
* Prilagajanje relacij: lahko dodate nove relacije, spremenite oznake za obstoječe.

## Ustvarjanje nove entitete

Kliknite gumb `Ustvari entiteto` na strani Upravljalnik entitet. Določite ime, oznako in tip. Če izberete tip `Oseba`, bo vaša entiteta vsebovala polja E-pošta, Telefon, Ime, Priimek in Pozdrav. Označite `Tok`, če želite, da bo imela vaša entiteta panel s prikazom toka ter da bodo uporabniki lahko sledili entitetam tega tipa.

Tipi:

* Osnovni - prazna entiteta s samo osnovnimi polji, kot so Ime, Dodeljeni uporabnik, Timi, Opis.
* Osnovni plus - podoben tipu Osnovni, toda s paneli Aktivnosti, Zgodovina, Opravila (na voljo od verzije 4.3.0).
* Dogodek - polja Začetni datum, Končni datum, Trajanje, Starš, Status. Na voljo v panelu Koledar in Aktivnosti (od verzije 4.3.0, potrebno omogočiti v Administracija > Nastavitve).
* Oseba - polja E-pošta, Telefon, Ime, Priimek, Pozdrav, Naslov. Paneli Aktivnosti, Zgodovina, Opravila.
* Podjetje - polja E-pošta, Telefon, Naslov za izstavitev računa, Naslov za dostavo. Paneli Aktivnosti, Zgodovina, Opravila.

## Posodabljanje obstoječe entitete

Če pri določeni entiteti kliknete povezavo `Uredi`, boste lahko spremenili nekatere parametre te entitete.

* Oznake - ime entitete v ednini in množini.
* Privzeti vrstni red, po katerem so zapisi sortirani v seznamskih pogledih.
* Tok - ali je možnost Tok omogočena za to entiteto.
* Onemogočena - označite, če ne potrebujete te entitete v svojem sistemu.
* Besedilna filtrirna polja - v katerih poljih naj išče glavni besedilni filter in globalni iskalnik.


## Polja

Klik na povezavo `Polja` vas bo prestavil na ločeno stran. Na njej boste lahko ustvarili nova polja ali posodobili že obstoječa. V Upravljalniku entitet so na voljo naslednji tipi polj:

* Naslov - naslov, ki je sestavljen iz ulice, mesta, zvezne države, poštne številke in države;
* Tabela - seznam vrednosti z možnostjo izbire več vrednosti (ni dobra izbira, če morate iskati po tem polju); uporabniki lahko dodajo svoje vrednosti, če ni kako drugače določeno.
* Večkratna priponka - več pripetih datotek;
* Samodejno oštevilčevanje - generirana številka, ki jo je mogoče le brati;
* Boolean - potrditveno polje, pravilno ali napačno;
* Valuta - za vrednosti valut;
* Datum;
* Datum in čas;
* Enum - izbirno poljo z možnostjo izbire le ene vrednosti;
* Datoteka - nalaganje ene datoteke;
* Plavajoča vejica - decimalna številka;
* Foreign - polje povezane entitete;
* Slika - nalaganje slikovne datoteke s predogledom;
* Integer - celo število;
* Številka - auto-incrementing number of string type with a possible prefix and a specific length;
* Multi-enum - seznam vrednosti z možnostjo izbire več vrednosti (ni dobra izbira, če morate iskati po tem polju), podobno Tabeli, vendar lepše.
* Besedilo - besedilno področje za dolga, večvrstična besedila;
* Url - za povezave;
* Varchar - kratko besedilo;
* Wysiwyg - podobno besedilnemu polju, z možnostjo oblikovanja besedila.

Parametri:
* Zahtevano - ali mora polje obvezno vsebovati vrednost.
* Privzeta vrednost - vrednost polja ob ustvaritvi novega zapisa.
* Sledenje - spremembe polja se bodo beležile v Tok.

**Opomba**: Potem ko dodate novo polje, morate to polje dodati na [postavitve](layout-manager.md) (Administracija > Upravljalnik postavitev).

### Dinamična logika

Omogoča možnost izdelave dinamičnih obrazcev. Možno je določiti pogoje, kdaj bodo določena polja vidna, zahtevana ali samo bralna. Pogoji se preverijo samodejno, ko se podatki na obrazcu spremenijo.

Za Enum, Tabelo in Multi Enum polja je možno določiti različne skupke možnosti, ki bodo na voljo za polje, odvisno od tega, kateri pogoj je izpolnjen.


## Relacije

Ustvarite lahko nove relacije tako med privzetimi kot prilagojenimi entitetami. Obstajajo trije tipi relacij:

* Eden proti več: potem ko ste ustvarili to relacijo, lahko dodate Url polje v postavitev s prikazom podrobnosti desne entitete in dodate relacijski panel levi entiteti;
* Več proti eden: enako kot Eden proti več, vendar ravno obratno;
* Več proti več: relacijska panela na obeh straneh.

Parameter 'Poveži večkratno polje' kaže na to, da bo polje tipa `linkMultiple` ustvarjeno skupaj z relacijo. Takšno polje lahko dodate postavitvi. Je prikladno za hitro izbiro povezanih zapisov. Ni pa dobra izbira, če ima vaša relacija veliko povezanih zapisov, ki lahko upočasnijo nalaganje zaslona s prikazom podrobnosti.

Če je označen parameter 'Sledenje', se bodo spremembe relacije beležile v Tok.
