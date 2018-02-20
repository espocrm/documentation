# Uvoz

Uvoz je dostopen samo uporabnikom z administratorskimi pravicami. Administracija > Uvoz. Podatke lahko uvažate samo iz CSV datotek.

## Korak 1

Izberite, katere vrste zapisov želite uvoziti (polje Tip entitete). Izberite CSV datoteko. Datoteka bi morala biti v formatu `UTF-8`.
Izberite `Kaj naj naredim?`. Možnosti, ki so na voljo: 'Samo ustvari', 'Ustvari in posodobi', 'Samo posodobi'.

* `Samo ustvari` - izberite to možnost, če želite, da je zapis samo ustvarjen.
* `Ustvari in posodobi` - zapisi bodo ustvarjeni, toda če se bodo našli zapisi z ujemajočimi se vrednostmi polj, bodo tudi posodobljeni. To, katera polja naj bi se ujemala, boste lahko preverili eno po eno v _Koraku 2_.
* `Samo posodobi` - posodobljeni bodo samo zapisi z ujemajočimi se vrednostmi polj.

Potem ko izberete csv datoteko, boste lahko videli, kako bo ta razčlenjena, in sicer v panelu Predogled. Ko spremenite lastnosti, se predogled posodobi.

* `Vrstica glave` - ali CSV datoteka vsebuje prvo vrstico z imeni polj.
* `Zaženi v mirovanju` - priporočeno, če morate uvoziti zelo veliko število zapisov. Uvoz bo časovno koordiniran s cron-om. Ko bo uvoz dokončan, bo status nastavljen na 'Končano'.
* `Ne išči podvojitev` - to bo skrajšalo čas uvoza.

Kliknite gumb _Naprej_ za nadaljevanje v _Korak 2_.

![1](../_static/images/administration/import/step-1.png)

## Korak 2

Nastavite preslikavo polj: kako polja ustrezajo stolpcem v csv datoteki.
Stolpcev, ki jih ne potrebujete, lahko izpustite tukaj. V primeru 'Ustvari in posodobi' ter 'Samo posodobi', morate preveriti polja, po katerih naj bi se posodobljeni zapisi našli. Dodajte privzete vrednosti za nove in posodobljene zapise. Na primer, lahko določite polji Dodeljeni uporabnik ali Timi.

Potem ko bo uvoz podatkov končan, boste lahko razveljavili ustvarjene zapise, videli podvojitve ter posodobili zapise. Podvojitev pomeni, da je v sistemu že obstajal podoben zapis. Vse uvožene podvojitve lahko odstranite hkrati. Opomba: Razveljavitev ne deluje s posodobljenimi zapisi.

Kliknite gumb _Prični z uvozom_ za nadaljevanje. Postopek uvoza lahko traja kar nekaj časa. Če želite uvoziti veliko število zapisov (odvisno od vaše konfiguracije strežnika, ponavadi če je več kot 200 zapisov), morate poskrbeti, da bo php parameter `set_time_limit` dovolj velik.

![2](../_static/images/administration/import/step-2.png)

## Kako uvoziti v Ciljni seznam

Ko uvažate Kontakte, Sledi ali Račune, jih lahko dodate na isti ciljni seznam. Pri koraku 2 morate dodati polje Ciljni seznam na panel `Privzete vrednosti` in izbrati potrebni zapis ciljnega seznama. Za to, da dodate obstoječe cilje na ciljni seznam, lahko uporabite tudi možnost uvoza `Samo posodobi` ali `Ustvari in posodobi`.
