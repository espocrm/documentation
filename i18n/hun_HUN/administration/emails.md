# Az e-mailek használatára vonatkozó iránymutatások

Az EspoCRM lehetővé teszi az e-mailek lekérését az IMAP-fiókból. Ez lehetővé teszi, hogy az EspoCRM e-mail klienst használja CRM-specifikus funkciókkal együtt.

## IMAP-fiókok

* Megjegyzés: Meg kell [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) megfelelően van konfigurálva a rendszerben, hogy a bejövő e-mailek működjenek.

A felhasználó beállíthatja az IMAP-fiókot a Személyes e-mail fiókok oldalon (E-mailek lap > jobb felső menü > Személyes e-mail fiókok).

Adja meg, hogy milyen mappákat figyeljünk a Monitorált mappák mezőben. Alapértelmezés szerint INBOX-ra van állítva. Ha külsős e-mail klienst használ e-mailek küldéséhez, az e-mailek archiválásához hozzáadhatja az Elküldött mappát.

*Fetch Since* lehetővé teszi, hogy kiválassza a dátum e-mailjeit archiválni kell. Állítsa be a mai napot megelőző dátumra, ha régi e-maileket szeretne archiválni.

Lehetőség van megadni a *Folder* értéket a Persnoal Email Accountban. A bejövő e-mailek kerülnek a mappába.

## SMTP-fiókok

A felhasználók beállíthatják az SMTP beállításokat a Beállítások, valamint a Személyes e-mail fiókjaikon belül. Az adminisztrátor engedélyezheti a rendszer SMTP használatát is (megosztás céljából).

A felhasználók több SMTP-fiókkal is rendelkezhetnek (a 4.2.0 verzió óta). De az e-mailek elküldéséhez használt e-mail címeket a * User * rekord e-mail címei határozzák meg.

## Az e-mailek használata

Az e-maileket a cron (a háttérben) néhány percenként (a rendszergazda által meghatározott időtartam) veszi fel.
Az e-maileket az E-mailek lapon láthatja. Vannak szabványos mappák, a Beérkezett üzenetek, az Elküldött, e-mailek tervezése a bal oldalon.

*Állapot* mező. Az `Elküldött` azt jelenti, hogy a CRM-ből érkezett, `Archived` - IMAP-fiókból előállított vagy manuálisan archivált `Draft` - azt jelenti, hogy az e-mailt vázlatként hozták létre.

Amikor az új e-mail érkezik, a rendszer megpróbálja felismerni, hogy melyik rekordhoz tartozik ez az e-mail. Kapcsolja össze fiókjával, vezetőjével, lehetőségeivel, esetével (és az érintkezés B2C módban stb.). Ha nem ismerte fel, akkor a felhasználó manuálisan is összekapcsolhatja a *Szülői mező* kitöltésével.

Ha egy e-mail egy új potenciális ügyfélfelhasználóból származik, akkor **átviheti Lead-ra**. Nyissa meg az E-mail bejegyzést, és kattintson a Vezeték létrehozása lehetőségre a jobb felső menüben.

Lehetőség van **létrehozni a feladatot vagy a házat** egy e-mail rekordból.

Ha az e-mail rekord e-mail címei (cc-től kezdve) ismerik a rendszert, megmutatja, hogy melyik személyhez kapcsolódnak (Kapcsolat, Lead, Felhasználó stb.). Ha néhány e-mail cím új, akkor ** csak kapcsolat létrehozása ** onnan.

All emails related to specific record are shown in History panel of that record. If some email is related, for example, to opportunity but opportunity is related to the account, it will be shown both in opportunity and account.

## E-mail küldése

Néhány módon új e-mailt írhat:
* *Írja be az Email* gombot e-mail lista nézetben;
* válaszol egy másik e-mailen;
* néhány rekord e-mail címére kattintva;
* *Írja be az e-mailt* a Tevékenységek panel tevékenységét.

Van lehetőség arra, hogy **válasszon sablont** az e-mailedből.

Beállíthat **e-mail aláírást** a Beállítások menüben.

## E-mail mappák

A felhasználók létrehozhatják saját e-mail mappáikat, hogy néhány e-mailt a kényelem érdekében. A rendelkezésre álló mappák listája a bal oldalon található E-mailek oldalon található. Mappák létrehozásához vagy szerkesztéséhez kövesse az E-mailek > legördülő menü jobb felső sarka > mappáit. Az "Értesítés letiltása" azt jelenti, hogy nem kap értesítést a beérkező e-mailekről, amelyek az adott mappába esnek. Az e-mail szűrők használatával lehetséges, hogy az e-maileket automatikusan mappákba helyezi, meghatározott feltételek szerint.

## E-mail szűrők

Az adminisztrátor globális e-mail szűrőket hozhat létre, hogy kihagyja a nem kívánatos e-maileket. Ezek elérhetők az Adminisztráció> E-mail szűrők oldalon.

A rendszeres felhasználó e-mail szűrőket hozhat létre személyes e-mail fiókjaikhoz vagy teljes bejövő postafiókjához. Ezek elérhetők az E-mailek> legördülő menüben a jobb felső sarokban> Szűrők.

Kétféle szűrő létezik:
* Átugrás - az e-mailt a *Trash* mappába helyezik, vagy nem importálják, ha a szűrő a személyes e-mail fiókhoz kapcsolódik;
* Tegye be a mappába - az importált e-maileket automatikusan a megadott felhasználó mappájába helyezik.

## E-mail sablonok

E-mail sablonok elérhetőek az E-mailek> legördülő menüben a jobb felső sarokban> E-mail sablonok. Használhatók tömeges levélküldéshez és rendszeres e-mailekhez is. Az "Egyszeri" jelölőnégyzet azt jelenti, hogy az e-mail sablon csak egyszer használható fel, az e-mail marketinghez szokásos módon.

Lehetőség van helyfoglalók használatára az e-mail sablon testében és a témában pl. {Account.name}, {Person.emailAddress}. Ezeket a kapcsolódó nyilvántartások értékével helyettesítik.

A további sablontartományban további fenntartott helyőrzőket használhat: {optOutUrl} és {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Ez a tömeges e-mail üzenetek leiratkozási linkje.
