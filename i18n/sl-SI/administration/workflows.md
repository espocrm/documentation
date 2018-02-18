# Delovni tokovi

Orodje Delovni tokovi (Workflows) je na voljo v [Naprednem paketu](https://www.espocrm.com/extensions/advanced-pack/).

Delovni tokovi na preprost način avtomatizirajo vaš poslovni proces. To orodje lahko najdete v administracijskem panelu. Da bi ustvarili pravilo delovnega toka, morate določiti:

* Ciljno entiteto - kateremu tipu entitete je delovni tok pripisan;
* Tip sprožilca - kdaj se bo delovni tok sprožil;
* Pogoje - da bi se delovni tok sprožil, morajo biti izpolnjeni pogoji;
* Akcije - kaj je treba narediti, ko se delovni tok sproži.


## Tipi sprožilcev

### Po ustvarjenem zapisu

Sproži se samo, ko je ustvarjen nov zapis. Če so navedeni pogoji izpolnjeni, se izvršijo akcije.

### Po shranjenem zapisu

Sproži se, ko je ustvarjen nov zapis oziroma je obstoječi zapis posodobljen. Če so navedeni pogoji izpolnjeni, se izvršijo akcije.

Za pravila delovnih tokov s tem tipom sprožilca je običajno, da imajo izbran pogoj, ki preverja, ali se je katero polje spremenilo. Na primer, če se je status Primera spremenil, potem se izvrši določena akcija.

### Časovno določen

Sproži se glede na vnaprej določen urnik. Lahko ga nastavite, da se zažene vsak dan, vsak teden itn. Akcije bodo dodeljene zapisom, ki so ustvarjeni kot rezultat določenega poročila v obliki seznama. Torej morate ustvariti tudi poročilo v obliki seznama.

Čas izvajanja se določi v obliki, primerni za crontab.

```
* * * * * *
| | | | | |
| | | | | +-- Leto              (razpon: 1900-3000)
| | | | +---- Dan v tednu       (razpon: 1-7, 1 pomeni ponedeljek)
| | | +------ Mesec v letu      (razpon: 1-12)
| | +-------- Dan v mesecu      (razpon: 1-31)
| +---------- ura               (razpon: 0-23)
+------------ Minuta            (razpon: 0-59)
```

### Zaporedni

Redko se uporablja. Mišljeno je, da ga zažene drug delovni tok. Omogoča vam, da ustvarite zapleteno logiko.

Opomba: Za zaporedne delovne tokove je priporočljivo uporabiti [orodje Upravljanje poslovnih procesov](bpm.md) namesto orodja Delovni tokovi.

## Pogoji

Določite lahko pogoje, ki morajo biti izpolnjeni, da bi se sprožil neki delovni tok. Obstajata dva načina za določanje pogojev: v uporabniškem vmesniku za izdelavo pogojev in s formulo.

### Uporabniški vmesnik za izdelavo pogojev

Nekateri tipi pogojev, ki so na voljo:

* _equals_ - polje je enako določeni vrednosti oziroma vrednosti nekega drugega polja;
* _was equal_ - polje je bilo enako določeni vrednosti, preden je bil delovni tok sprožen;
* _not equals_ - polje ni enako določeni vrednosti oziroma vrednosti nekega drugega polja;
* _was not equal_ - polje ni bilo enako določeni vrednosti, preden je bil delovni tok sprožen;
* _empty_ - vrednost polja je prazna;
* _not empty_ - vrednost polja ni prazna;
* _changed_ - polje je bilo spremenjeno;
* _not changed_ - polje ni bilo spremenjeno.

### Pogoji s formulo

Formula vam omogoča, da določite pogoje katere koli kompleksnosti. Da bi izvedeli več o sintaksi formul, si poglejte [ta članek](formula.md).

Opomba: Ko določate pogoj, ne sme biti v formuli uporabljeno ločilo `;`.

## Akcije

### Pošlji e-pošto

Sistem bo poslal e-pošto, pri čemer bo uporabil določeno e-poštno predlogo. E-poštni naslov prejemnika je lahko vzet iz ciljnega zapisa, katerega koli povezanega zapisa, trenutnega uporabnika, sledilca, timskega uporabnika ali pa je ročno določen. E-pošta je lahko poslana takoj ali pa z določenim časovnim zamikom.

### Ustvari zapis

Sistem bo ustvaril nov zapis katerega koli tipa entitete. Če obstaja relacija med ciljnim zapisom in ustvarjenim zapisom, je možno narediti povezavo med zapisoma.

Mogoče je tudi določiti formulo, ki bo izračunala polja.

### Ustvari povezani zapis

Sistem bo ustvaril zapis, ki bo povezan s ciljnim zapisom. Mogoče je določiti formulo, ki bo izračunala polja.

### Posodobi ciljni zapis

Dopušča možnost spreminjanja določenih polj ciljnega zapisa. Mogoče je določiti formulo, ki bo izračunala polja.

Če morate dodati nove elemente polju Poveži-Več (Link-Multiple), ne da bi izgubili obstoječe podatke (na primer Timi), morate uporabiti funkcijo formule entity\addLinkMultipleId. Primer: `entity\addLinkMultipleId('teams', 'teamId')`.

### Posodobi povezani zapis

Omogoča spreminjanje določenih polj povezanega zapisa oziroma zapisov. Mogoče je določiti formulo, ki bo izračunala polja.

### Poveži z drugim zapisom

Ciljno entiteto poveže z drugo izbrano entiteto. Na primer, zapisu doda določen tim.

### Prekini povezavo z drugim zapisom

Prekine povezavo ciljnega zapisa z drugo izbrano entiteto. Na primer, odstrani določen tim iz zapisa.

### Uporabi določitveno pravilo

Uporabniku določi ciljni zapis s porazdelitvenim pravilom. Na voljo sta dve pravili: krožno dodeljevanje in najmanj zaseden.

* Krožno dodeljevanje - uporabniki so izbrani od vrha proti dnu seznama (tima) in potem znova od vrha.
* Najmanj zaseden - nalogo bo dobil uporabnik, ki mu je dodeljeno manj zapisov.

_Poročilo v obliki seznama_ - Za porazdelitev Najmanj zaseden določi, kateri zapisi bodo uporabljeni za izračun števila dodeljenih zapisov. Na primer, za Primere moramo izbrati samo zapise z aktivnim statusom.

### Ustvari obvestilo

Izbrane uporabnike obvesti s sporočilom. V predlogi sporočila je mogoče uporabiti polja s spremenljivkami. {entity} - ciljni zapis, {user} - trenutni uporabnik.

### Določi sledenje

Izbranim uporabnikom določi, da sledijo ciljni entiteti oziroma izbrani povezani entiteti.

### Sproži drug delovni tok

Omogoča ustvaritev zaporednih delovnih tokov. Obstaja možnost razcepitve delovnega toka z uporabo pogoja: delovni tok lahko nastavite tako, da sproži dva toka z različnima pogojema, definiranima v tema delovnima tokovoma.  

Mogoče je tudi nastaviti zakasnitev izvajanja zaporednega delovnega toka. V zaporednem delovnem toku lahko določite pogoj, ki preverja, ali so se določena polja spremenila, odkar je bil sprožen nadrejeni delovni tok, in sicer s tipoma pogojev _Changed_ in _Was Equal_.

Opomba: Za zaporedne delovne tokove je priporočljivo uporabiti [orodje Upravljanje poslovnih procesov](bpm.md) namesto orodja Delovni tokovi.

### Zaženi storitveno akcijo

Omogoča, da zaženete določene storitvene skripte. Originalno sta na voljo naslednji akciji:

* Pošlji vabila - za Sestanke/Klice;
* Dodaj Navedene elemente - za Navedke.

Razvijalci lahko napišejo svoje storitvene akcije. Preberite si [več podrobnosti](../development/workflow-service-actions.md).

## Uporaba formule pri akcijah

Možno je določiti formulo, ki bo izračunala polja za Ustvari zapis, Posodobi ciljni zapis, Ustvari povezani zapis, Posodobi povezani zapis. Da bi pri zadnjih dveh lahko imeli dostop do atributov ciljne entitete, bi morali uporabiti funkcijo `targetEntity\attribute`. Da bi imeli dostop do atributov ciljne entitete, ki je bila določena, preden je bil sprožen delovni tok, uporabite funkcijo `targetEntity\attributeFetched`.

Primer:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
