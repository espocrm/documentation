# Masowe Wiadomości Email

## Jak wysyłać  masowe wiadomości email

Musisz mieć przynajmniej jedną listę docelową z docelowymi rekordami i szablonem wiadomości email w swoim CRM.

1. Stwórz nową akcję ze statusem `Email` lub `Newsletter`. Wybierz jedną lub kilka docelowych list w polu `Target Lists`.
2. Po akcji jest tworzona masowa wiadomość email dla tej akcji: naciśnij przycisk plus w panelu Wiadomości Masowych. Ustaw _Date Start_ - kiedy wiadomość powinna być wysłana, i wybierz _Email Template_. Upewnij się, że _Status_ jest ustawiony na `Pending`.

Jeśli wszystko jej poprawnie ustawione wiadomość email powinna zostać wysłana. Powinny być wysyłane porcjami co godzinę (możesz zmienić rozmiar porcji w Administracja > Wychodzące wiadomości Email). Administrator możę zmienić to przez aktualizację pola `Scheduling` z `Check Group Email Accounts` Zaplanowanych zadań.

W panelu Logów możesz sprawdzić czy wiadomości zostały wysłane.

## Testowanie co zostanie wysłane do odbiorców

Naciśnij prawym przyciskiem w wierszu masowe wiadomości email na _Mass Email_ panel następnie naciśnij _Send Test_.

## Zapisy

W zapisach możesz zobaczyć:
* Wysłane wiadomości;
* Wiadomości email otwarte przez odbiorców;
* Odnośniki kliknięte przez odbiorców;
* Odbiorcy, którzy zrezygnowali;
* Odrzucone wiadomości (nie dostarczone do odbiorców).

## Link rezygnacji

Domyślnie system doda link z adresem do rezygnacji do wszystkich wysłanych wiadomości email. Możesz wykorzystać go zmienić na niestandardowy w swoim szablonie wiadomości.

Przykład:
```html
<a href="{optOutUrl}">Wypisz się z listy mailingowej.</a>
```

Administrator może wyłączyć obowiązkowy adres do rezygnacji dodawany przez system w Administracja > Wychodzące wiadomości.

## Link monitorujący

Jeśli chcesz wiedzieć, czy odbiorca wszedł w link z Twojej wiadomości email, musisz stworzyć link monitorujący. Określić _Name_
 oraz _URL_ gdzie powinien prowadzić Twój link. Następnie musisz wkleić wygenerowany kod do szablonu wiadomości.

 Przykład:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Wypróbuj naszą wersje demonstracyjną</a>
 ```
 
## Listy docelowe

Listy docelowe zawierają listy z Kontami, Kontaktami, Wskazówkami i Użytkownikami. 

Użytkownicy mogą wypełniać te listy ręcznie poprzez akcję _Select_ w panelu korespondencji w szczegółach Listy docelowej . Jest możliwość filtrowania oraz wybrania wszystkich wyszukanych rezultatów.

## Uzupełnianie listy docelowej z raportami

[Raporty](reports.md#syncing-with-target-lists) funkcja umożliwiająca uzupełnienie listy docelowej z rekordami spełniającymi określone kryteria.

## Lista pominiętych osób

Określanie listy pominiętych osób w listach docelowych aby uniknąć wysyłania masowych wiadomości do określonych odbiorców. Jeśli jest tam rekord z adresem email zawierającym się w liście pominiętych odbiorców, pierwszy rekord zostanie również pominięty.

## Dziennik kamapanii

W dzienniku kampanii możesz zobaczyć adresy email do których została wysłana wiadomość, otworzyli wiadomości email, pominięte wiadomości, kto zrezygnował, oraz kto wszedł w link z wiadomości email. Jest możliwe wykorzystanie dziennika logów przez stworzenie Listy docelowej (rozwijane menu w prawym górnym narożniku panelu) bazującym na rekordach z dziennika. Na przykład, wybierasz tylko kontakty, które weszły w link z wiadomości (link monitorujący).

## Rozwiązywanie problemów

_Dla Administratorów_

#### Co zrobić jak wiadomość nie została wysłana.

1. Sprawdź czy działa _Wysyłanie Testowe_. Jeśli nie działa, sprawdź, czy ustawienia systemu SMTP są poprawne.
2. Sprawdź czy masz ustawiony Cron w swoim systemie.
3. Sprawdź czy masz zaplanowane zadanie `Wyślij masowe wiadomości email` i jest ono `Aktywne` (Administracja > Zaplanowane Zadania > Wysyłanie Wiadomości Masowych). Sprawdź czy jest coś w dzienniku logowania.


#### Co w przypadku gdy link docelowy jest zły i nie prowadzi do Twojego CRM.

Sprawdź parametr 'siteUrl' w pliku `data/config.php`. Musi być ustawiony publiczny adres Twojego EspoCRM.

#### Odrzucone wiadomości email nie są zapisywane w dzienniku logowania

Odrzucone wiadomości mogą być obsłużone tylko przez konta grupowych wiadomości email. Upewnij się, że masz konto grupowych wiadomości email, które monitoruje wysyłanie wiadomości.

Niektóre serwery mailingowe mogą różnić się od standardowych, więc odrzucane wiadomości mogą nie być odróżniane.
