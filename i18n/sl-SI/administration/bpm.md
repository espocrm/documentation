# Upravljanje poslovnih procesov

Orodje Upravljanje poslovnih procesov (BPM) vam omogoča, da v EspoCRM oblikujete in avtomatizirate poslovne procese. Gre za stroj, ki izvaja poslovne procese, opisane v BPMN 2.0 standardu. Orodje BPM je na voljo v razširitvi [Napredni paket](https://www.espocrm.com/extensions/advanced-pack/).

![Primer BPM-ja](../_static/images/administration/bpm/bpm-1.png)

### Kako se razlikuje od orodja Potek dela

Orodje Potek dela je namenjeno avtomatizaciji preprostih poslovnih pravil, brez zaporednih elementov, ki prikazujejo potek, ko pač ni potrebno grafično prikazati poteka.

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

Za kompleksnejše časovne nastavitve se lahko okorisite [formule](formula.md). Skripi s formulami bi morali vrniti vrednost Datum-Čas (v UTC časovnem pasu). Ko nastopi vnaprej določeni čas, se tok nadaljuje z naslednjim elementom.

Z uporabo funkcije datetime\closest je mogoče nastaviti števec na določen čas v prihodnosti, na primer na začetek naslednjega delovnega dne.

#### Dogodek Konec

Konča trenutni potek. Ne ustavi drugih tokov, ki potekajo vzporedno. Ko potek pride do dogodka Konec in ni nobenih vzporednih tokov, se proces konča.

#### Dogodek Takojšnji konec

Konča vse tokove. Proces se zatem konča.

### Prehodi

Prehodi so prikazani kot diamanti.

#### Exclusive Gateway

Can diverge or converge flows.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

#### Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

#### Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

#### Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
