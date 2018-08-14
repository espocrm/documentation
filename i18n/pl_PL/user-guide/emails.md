# Wytyczne korzystania z wiadomości email

EspoCRM udostępnia możliwość pobierania wiadomości email z IMAP. Umożliwia to wykorzystanie EspoCRM jako klienta poczty wraz z funkcjami specyficznymi dla CRM.

## Konta IMAP

*Uwaga: Musisz mieć [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) właściwie skonfigurowany w swoim systemie aby poprawnie działały przychodzące wiadomości e-mail.*

Użytkownik może ustawić konto IMAP na stronie: Osobiste Konta Email (Zakładka Email > górne-prawe menu > Osobiste konta email).

Określ jaki folder sprawdzać w polu Monitorowane Foldery. Domyślnie jest ustawiona skrzynka odbiorcza. Jeśli korzystasz z zewnętrznego klienta do wysyłania wiadomości email możesz dodać folder z wysłanymi wiadomościami aby zarchiwizować te emaile.

*Pobierz od* umożliwia ustawienie daty od której wiadomości email będą archiwizowane. Ustaw jakąś wcześniejszą datę jeśli chcesz zarchiwizować stare wiadomości.

Istnieje możliwość określenia *Folderu* w Osobistych Kontach Email. Przychodzące wiadomości będą umieszczane w tym katalogu.

## Konta SMTP

Użytkownicy mogą ustawić ustawienia SMTP w Preferencjach, tak samo jak w swoich Osobistych Kontach Email. Administrator również może zezwolić na używanie systemu SMTP (udostępnić go).

Użytkownicy mogą mieć wiele kont SMTP (od wersji 4.2.9). Ale adresy z których użytkownik może wysyłać wiadomości email są definiowane przez adres email z rekordu *Użytkownika*  .

## Praca z wiadomościami Email

Wiadomości Email są pobierane przez cron'a (w tle) co kilka minut (okres czasu jest ustawiany przez administratora).
Wszystkie swoje wiadomości email możesz zobaczyć w zakładce Email. Są tam standardowe foldery: Skrzynka odbiorcza, Wysłane, Szkice wiadomości po lewej stronie.

Polce *status*. `Wysłane` oznacza, że wiadomość została wysłana z CRM, `Zarchiwizowano` – pobrano z konta IMPA lub zarchiwizowano ręcznie, `Szkic` – oznacza, że wiadomość została stworzona jako szkic.

Kiedy do systemu przyjdzie nowy email, system próbuje rozpoznać do której części należy ta wiadomość. Może połączyć go z  Kontem, Kontaktem, Zdarzeniem, Sprawą (i Kontraktem w trybie B2C) itd. Jeśli nie został rozpoznany, użytkownik może połączyć go ręcznie przez wypełnienie pola *Rodzic*.

Jeśli wiadomość przyszła od nowego potencjalnego klienta, użytkownik może **zmienić ją w Kontakt**. Otwórz wiadomość i naciśnij Stwórz Kontakt w prawym górnym menu.

Możliwe jest również **tworzenie Zadań i Warunków** z wiadomości email.

Jeśli adres wiadomości(od, do, cc) w wiadomości istnieją w systemie, system pokaże osobę powiązaną z (Kontaktem, Wiadomością, Użytkownikiem itd). Jeśli adres jest nowy, możesz z tego miejsca **stworzyć kontakt**.

Wszystkie wiadomości email powiązane z specyficznym rekordem, są pokazane w panelu Historii tego rekordu. Jeśli jakaś wiadomość jest powiązana, na przykład, ze zdarzeniem ale zdarzenie jest powiązana z kontem, zostanie pokazana zarówno w zdarzeniu oraz w koncie.

## Wysyłanie wiadomości Email

Możesz tworzyć wiadomość na kilka sposobów:
* *Utwórz wiadomości Email* przycisk na liście wiadomości
* odpowiadanie na inną wiadomość;
* kliknięcie na adres poczty email któregoś z rekordów;
* *Utwórz wiadomości Email* akcja w panelu Działania.

Istnieje możliwość **wybrania szablonu** swojej wiadomości.

Możesz ustawić **podpis wiadomości email** w Preferencjach.

## Folder Email

Użytkownicy mogą tworzyć swoje własne foldery email, aby umieszczać tam niektóre ze swoich wiadomości. Lista dostępnych folderów jest widoczna po lewej stronie strony Wiadomości Email. Aby stworzyć lub edytować folder postępuj następująco Wiadomości Email > rozwijane menu w prawym górnym rogu > Foldery. `Pomiń Powiadomienia` oznacz, że nie będziesz powiadamiany o przyjściu nowej wiadomości, która trafi do określonego folderu. Filtry poczty umożliwiają automatyczne umieszczanie wiadomości email w folderach według określonych kryteriów.

## Filtry Wiadomości Email

Administrator może stworzyć globalny filtr, który pominie niepożądane wiadomości email. Jest to dostępne w Administracja > Filtry Wiadomości Email.

Zwykły użytkownik może stworzyć filtr dla swoich Osobistych Kont Email lub dla całej Skrzynki odbiorczej. Jest to dostępne w Wiadomości Email > rozwijane menu w górnych prawym narożniku > Filtry.

Istnieją dwa rodzaje filtrów:
* Pomiń - wiadomość zostanie umieszczona w *Koszu* lub nie zostanie zaimportowane, jeśli filtr jest powiązany z Osobistym Kontem Email;
* Umieść w folderze - zaimportowane wiadomości zostaną automatycznie umieszczone w konkretnym folderze.

## Szablony Wiadomości

Szablony wiadomości są dostępne w Wiadomości Email > rozwijane menu w górnym prawym narożniku > Szablony Wiadomości. Mogą być używane zarówno w wiadomościach wysyłanych masowo oraz w zwykłych emailach. `One-off` checkbox oznacza, że szablon powinien zostać wykorzystany tylko raz, jest to popularne w wiadomościach marketingowych.

Możliwe jest wykorzystanie symboli zastępczych w treści szablonów wiadomości oraz tytule np. {Account.name}, {Person.emailAddress}. Zostaną zastąpione wartościami powiązanymi z rekordem.

Możesz wykorzystać dodatkowe zarezerwowane symbole zastępcze w treści szablonu: {optOutUrl} oraz {optOutLink}.
```
<a href="{optOutUrl}">Anuluj subskrypcję</a>
```
Link do anulowania subskrypcji dla masowych wiadomości email
