# Raporty

Funkcjonalność raportów jest dostępna w [Zaawansowany pakiet](https://www.espocrm.com/extensions/advanced-pack/).

Są dwa rodzaje raportów: Lista i Siatka.  

## Lista raportów

Lista raportów wyświetla listę rekordów, które spełniają określone kryteria.

Aby stworzyć nową listę raportów naciśnij na zakładkę Raporty a następnie naciśnij przycisk Stwórz Raport. Wybierz potrzebny rodzaj jednostki i następnie naciśnij Stwórz Raport w sekcji Lista Raportów.

W polu _Columns_ wybierz pola, które chciałbyś wyświetlić. Poniżej możesz określić parametry wyświetlania dla każdej kolumny np. szerokość i wyrównanie.

Wybierz sortowanie w polu _List Order_. 

W sekcji _Filters_ możesz określić kryteria, które determinują jakie rekordy będą wylistowane w raporcie. Możesz używać operatorów logicznych 'OR' i 'AND'.

_Runtime Filters_ pozwalają określać inne filtry zanim uruchomisz raport.

Możesz __export__ rezultaty z listy raportów do pliku CSV lub Excela.

## Grid Reports

Grid reports result summarized values grouped by specified fields. These reports can be displayed as a chart.

![Grid reports](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/grid.png)

To create new grid report click on Reports tab and then click Create Report button. Choose needed Entity Type then click Create button at Grid Report section.

At _Group By_ field pick one or two fields you want your report data be grouped by. It's possible to group by year, month, day for date fields. If you group by two fields your report will be considered as three-dimensional.

At _Columns_ field select one or more aggregate functions like COUNT, SUM (summation), MIN, MAX, AVG (average).

_Order by_ field defines how report data will be sorted.

At _Filters_ section you can specify criteria that determines what records will be used in your report. You can use logical operators 'OR' and 'AND' here.

_Runtime Filters_ allows you to specify different filters before you run the report.

Grid report allows displaying results in a chart form. There are following _chart types_: Bar (Horizontal), Bar (Vertical), Pie, Line.

It's possible to __export__ grid report results to excel and csv formats.

## Filtry

### Filtr polowy

Prosty typ filtru w użyciu. Możesz również wybrać pola docelowej jednostki tak samo jak powiązanych jednostek.

![Field filter](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-field.png)

### Wyrażenie OR

OR oznacza, że co najmniej jeden z warunków musi zostać spełniony.

![OR](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-or.png)

### Wyrażenie AND

AND oznacza, że wszystkie warunki muszą być spełnione.

### Wyrażenie NOT

Umożliwia filtrowanie rekordy, które nie spełniają określonych kryteriów. Np. lista kont, które nie mają statusu Wygrane Zamknięte lub Stracone Zamknięte.

![NOT](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-not.png)

### Złożone wyrażenia

Dla bardziej zaawansowanych zastosowań. Możesz zastosować funkcje dla pewnej kolumny bazy danych i porównać ją z rezultatem wyrażenia [wzór](../administration/formula.md).

Uwaga: Jeśli chcesz porównać proste ciągi znakowe powinieneś umieścić je w pojedyncze apostrofy `'some string'`.

Uwaga: Funkcje przeznaczone do interakcji z jednostkami rekordów nie będą tutaj działać ponieważ wzór nie jest przeznaczony do określnych rekordów.

![Filtr wyrażeń złożonych](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-complex.png)

## Wyświetlanie na panelu

Każdy raport możesz wyświetlić w panelu. Aby to zrobić musisz dodać raport do szybkiego dostępu i następnie wybrać potrzebny raport w opcjach szybkiego dostępu.

## Wysyłanie wiadomości email

Możliwe jest zrobienie systemu do wysyłania raportów do określonych użytkowników w określonym czasie. Musi to być skonfigurowane dla każdego raportu indywidualnie.

## Synchronizowanie z listami docelowymi

Możliwe jest synchronizowanie listy docelowych rezultatami listy raportów. Jest to wygodne dla masowych wiadomości e-mail, gdy chcesz wysyłać wiadomości tylko do osób, które spełniają kryteria w momencie wysyłania. Funkcja jest dostępna w widoku szczegółów każdej listy docelowej w panelu 'Synchronizuj z Raportami'.
