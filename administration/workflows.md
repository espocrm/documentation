# Workflows
# Mga Daloy ng Trabaho

Workflows feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).
Ang mga daloy ng trabaho ay magagamitsa [Advanced Pack] (https://www.espocrm.com/extensions/advanced-pack/).

Workflows automate your business process an easy way. You can find it in the Administration panel. To create a workflow rule you need to define:
Ang mga daloy ng trabaho ay nag-automate sa iyong proseso ng negosyo sa madaling paraan. Maaring mong mahanap ito sa Administration panel. Upang lumikha ng panuntunan sa daloy ng trabaho kailangan mong tukoyin ito:

* Target Entity - what entity type workflow is applied to;
* Entidad Target - anong uri ng entidad daloy ng trabaho ay ilapat sa:

* Trigger Type - when workflow will be triggered;
* Uri ng pag-trigger - kailan ma-trigger ang daloy ng trabaho:

* Conditions - conditions need to be met to trigger workflow;
* Mga kondisyon - mga kondisyong kinakailangan upang makabot para ma trigger ang daloy ng trabaho:

* Actions - what to do if workflow is triggered.
* Mga aksyon - anong dapat gawin kung ang daloy ng trabaho ay na-trigger.


## Trigger Types
## Mga uri ng pag-trigger

### After record created 
### Pagkatapos i-rekord ang nilikha

Triggered only when a new record is created. If specified conditions are met then actions will be executed.
Ang pag-trigger lamang kung ang bagong rekord ay nalikha. Kung ang tinukoy ng mga kondisyon ay nakabot pagkatapos ang mga aksyon ay naisakatuparan.

### After record saved
### Pagkatapos na i-save ang rekord

Triggered when a new record is created or an existing record is updated. If specified conditions are met then actions will be executed.
Pag-trigger kung ang bagong rwkord ay nilikha o ang umiiral na rekord ay naka-update.Kung natukoy ang mga kondisyon ay nakabot pagtapos ang mga aksyon ay naisakatuparan.

For workflow rules with this type of trigger it's a common practice to have a condition that checks whether some field was 'changed'. E.g. If Case's status is changed then execute some actions.
Para sa daloy g trabaho kasama itong uri ng pag-trigger ito ay karaniwang kasanayan  na magkaroon ng kondisyon na sinusuri kung may ilang larangan ay 'binago'. Hal. kung ang estado ng Case ay binago pagtapos na isakatuparan  ang ilan mga aksyon.

### Scheduled
### Naka-iskedyul

Triggered according to the defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by a specified list report. So you need also to create a list report.
Ang pag-trigger ayon sa tinakdang pag-iiskedyul. Maari mong i-setup ito upang patakbuhin ito araw-araw, kada linggo, atbp. Ang mga aksyon ay inilapat para sa mga rekord na binalik sa isang listahan tinukoy na ulat. Kailanhan mo ring lumikha ng listahan ng ulat.

Scheduling is specified in a crontab notation.
Pag-iiskedyul ay tinukoy sa isang crontab notation.

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Sequential
### Ang pagkasunod-sunod

Used rarely. Supposed to be run by another workflow. Provides an ability to make a complex logic. 
Bihirang ginamit. Dapat na pinatakbo sa pamamagitan ng ibang daloy ng trabaho. Nagbibigag ng abilidad upanh lumikha ng complwx logic.

Note: For sequential workflows it's recommended to utilize [BPM tool](bpm.md) rather thnn a Workflows feature.
Tandaan: Para sa pagkasunod-sunod nz mga trabaho, ito ay inirerekomenda upang i-utilize ang [BPM tool](bpm.md)sa halip ng tampok ns daloy ng trabaho.

## Conditions
## Mga kondisyon


You can specify conditions that must be met to trigger the workflow. There are two ways how conditions can be specified: with the UI condition builder and with formula.

Maari mong tukuyin ang mga kondisyon na iyon ay makabot sa pag-trigger na daloy ng trabaho. May mga dalawang paraan na maaring tukuyin kasama ang UI kondisyonbuilder at gamit ang formula.

### UI condition builder
### Mga UI kondisyon builder

Some available condition types:
Ang ilang uri magagamit na kondisyon:

* _equals_ - the field equals to a specific value or a value of another field;
* _katumbas_ - ang mga patlang ay katumbas sa tinukoy na halaga o halaga ng isang patlang;

* _was equal_ - the field was equal to a specific value before the workflow was triggered;
* _ay katumbas_ - ang patlang ay katumbas sa tinukoy na halaga  bago ang daloy ng trabaho ay na-trigger;

* _not equals_ - the field does not equal to a specific value or a value of another field;
* _hindi katumbas_ - ang patlang ay hindi katumbas sa isang tinukoy na halaga o ang halaga sa ibang patlang

* _was not equal_ - the field was not equal to specific value before the workflow was triggered;
* _ay hindi katumbas_ - ang patlang sy hindk katukbas sa isang tinukoy na halaga bago ang daloy ng trabaho sy ns trigger;

* _empty_ - the field value is empty;
* _walang laman_ - ang halaga na patlang ay walang laman;

* _not empty_ - the field value is not empty;
* _hindi walang laman_ - ang patlang na halaga ay hindi walang laman

* _changed_ - the field was changed;
* _binago_ - ang pstlang ay binago;

* _not changed_ - the field was not changed.
* _hindi binago_ - ang patlang ay hindi binago.

### Formula conditions
### Ang mga kondisyon ng formula

Formula provides an ability to define conditions of any complexity. To read about formula syntax follow [this article](formula.md). 
Ang formula ay nagbibigay ng abilidad upang tukuyin ang mga kondisyon sa kahit anong pagiging komplikao. Upang mabasa tungkol sa syntax sundin ang [ang itong artikulo]. (formula.md)

Note: There should not be any `;` delimiter used in formula code when it determines a condition.
Tandaan: hindi dapat magkaroon ng anuman `;` delimiter ang ginamit sa formula code kapag tinukoy ang kondisyon.

## Actions
## Mga aksyon

### Send Email
### Magpadala ng Email

System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. Email can be sent immediately or delayed for a specific interval.
Ang sistema ay magpapadala ng email gamit ang tinukoy na email template. Ang recipient email address ay maaring makukuha mula sa taget na rekord sa kahit anong kaugnay sa rekord, ang kasulukuyang gumagamit, ang mga tagasunod, pangkat ng isang gumagamit o tinutukoy. Ang email ay maaring ipadala ng madalian o maantala para sa isang tiyak na agwat.

### Create Record
### Lumikha ng rekord

System will create the new record of any entity type. If there is a relationship between the target record and creating record it's possible to relate records. 
Ang sistema ay lumikha ng bagong rekord sa kahit anong uri ng entidad. Kung magkaroon ng relasyon sa pagitan ng Target rekord at nilikhanh rekord , ito maaring maiugnay sa mga rekord.

There is an ability to define formula to calculate fields.
Mayroon mga abilidad uoang tukuyin ang formula upang kalkulahin ang mga patlang.

### Create Related Record
### Ang mga bagong nauugnay na rekord

System will create the record related to the target record. It's possible to define formula to calculate fields.
Ang sistema ay lumikha ng rekord nag uugnag sa target rekord. Ito ay posible na tukuyin ang formula upang kakulahin ang mga patlang

### Update Target Record
### I-update ang mg Target Rekord

Allows changing of specific fields of the target record. It's possible to define formula to calculate fields. 
Pinapayagan ibahin ang tiyak ng mga patlang sa isang target rekord. Ito ay posible na tukuyin ang formulang upang kalkulahin ang mga patlang.

If you need to add new items to the Link-Multiple field w/o loosing existing data (e.g. Teams) you need to utilize formula function entity\addLinkMultipleId. Example: `entity\addLinkMultipleId('teams', 'teamId')`.
Kung kailanhan mong magdagdag ng mga bagong aytem sa isang Link-Multiple ng patlang na walang mawawala sa umiiral na data  (hal.mga koponan) kailangan mong gamitin ang formula na function entidad. Halimbawa: `entity\addLinkMultipleID( 'teams', 'teamID')`

### Update Related Record
### I-update ang nag-uugnay na rekord

Allows changing of specific fields of the related record or records. It's possible to define formula to calculate fields.
Pinapayagan ibahain ang isang tiyak ng mga patlanh sa isang nag-uugnay na rekord o mga rekord. Ito ay posible na tukuyin ang upang kakulahin ang mga patlang

### Link with Another Record
### I-link kasama ang ibanv rekord

Relates the target entity with another specific entity. E.g. adds specific team to the record.
Iugnay ang target entidad sa ibang tiyak na entidad. Hal. Magdagdag ng tiyak na koponan sa isang rekord.

### Unlink with Another Record
### I-unlink sa ibang rekord

Unrelates the target entity from another specific entity. E.g. removes a specific team from the record.
Walang kaugnay ang target entidad mula sa ibang tiyak na entidad. Hal. alisin ang tiyak na kopinan mula sa isang rekord.

### Apply Assignment Rule
### Maglapat ng nakatakdang pununtunan

Assign the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.
Magtakda ng target rekord sa gumagamit sa pamamagitam ng pamamahagi ng panuntunan. Mayroong dalawang magagamit na panuntunan: Round Robin at Least Busy.

* Round-Robin - users are choosen from the top to the bottom of a list (team) and then starting again.
* Round-Robin - ang mga gumagamit ay pinili mula sa ibabaw hanggang sa ibaba sa isang listahan at pagtapos magsisimula ulit.

* Least-Busy - user who has fewer assigned records will be chosen for assignment.
* Least-Busy - ang mga gumagamay  ay mayroong kunting naitalaga ng mga rekord ay pipiliin para sa naitalaga.

_List Report_ - For Least-Busy distribution determines what records will be taken into account to calculate the number of assigned records. E.g. for Cases we need to take only records with active status.
_List Report_ - Para sa Least-Buy na pamamahagi tinutukoy kung anong mga rekord ay makukuha sa akwant uoang kalkulahin ang bilang ng naitalaga na mga rekord. Hal. para sa mga Kaso kailangan namin kumuha lamang ng mga rekord kasama anv mga aktibong estado.

### Create Notification
### Lumikha ng abiso

Notify specific users with the message. It's possible to use placeholders in message template: {entity} - target record, {user} - current user.
Abisuhan ang mga tiyak na gumagamit gamit ang mensahe. Ito ay posible na gamitn ang mga placeholder template {entidad} - target rekord.

### Make Followed
### Gumawa ng sinundan

Forces specific users to follow the target entity or a specificied related entity.
Pilitin ang mga tiyak na gumagamit na sundin ang taget entidad o ang tinukoy nakaugnay na entidad.

### Trigger Another Workflow
### Mag-trigger ng ibang daloy ng trabaho

Allows to make sequential workflows. It's possible to branch workflow by condition: you can setup the workflow to trigger two workflows with different conditions defined in that workflows.
Pinapayagan ng gumawa ng pagkasunod-sunod na daloy ng trabaho. Ito ay posible i-sangay ang daloy ng trabaho sa isang kondosyon: maari kang mag-setup na daloy ng trabaho upang malaman ang dalawang daloy ng trabaho sa mga iba't ibang kondisyon na tinukoy sa daloy ng trabaho.

It's possible to delay executing of sequential workflow. In the sequential wokflow you can define the condition that checks whether specifiec fields were changed since the parent workflow were triggered by using _Changed_ and _Was Equal_ condition types.
Ito ay posible na maantala na maisakatuparan  ang pagkasunod-sunod na daloy ng trabaho. Sa pagkasunod-sunkd na daloy ng trabaho maari mong tukuyin ang kondisyon na sinusuri kung ang mga tiyak na patlang na binago mulan noon ang parent na daloy na trabaho ay nalaman sa pamamagitan ng paggakit ng _Changed_ at _Was Equal_ uri ng kondisyon.

Note: For sequential workflows it's recommended to utilize [BPM tool](bpm.md) rather than a Workflows feature.
Tandaan: Para sa pagkasunod-sunkd na daloy ng trabaho ito ay inirerekomends na gamitin ang [BLM tool](bpm.md) sa halip ng tampok na daloy ng trabaho

### Run Service Action
### Patakbuhin ang serbisyong aksyon

Allows to run specific service scripts. By default there are following actions available:
Pinapayagn na pagtakbuhin ang tiyak na serbisyong skript. Sa pamamagitan ng default mayroong sumusunod ng mga aksyon na magagamit:

* Send Invitations - for Meetings/Calls;
* Magpadala ng mga imbitasyon - para sa mga metting/tawag:

* Add Quote Items - for Quotes.
* Magdagdag ng mga Quote aytem - para sa mga Quote.

Developers can write their own service actions. See [more detail](../development/workflow-service-actions.md).
Mga nag-develop ay maaring magsulat nf kanilanh serbisyong aksyon. Tingnan [karagdagang detalye] (../development/workflow-service-actions.md).

## Using Formula in Actions
## Gamit ang Formula sa mga aksyon

It's possible to define formula to calculate fields for Create Record, Update Target Record, Create Related Record, Update Related Record. For the last two, to access attributes of target entity you should use function `targetEntity\attribute`. To access attributes of target entity that was set before workflow was triggered use function `targetEntity\attributeFetched`.
Ito ay posoble upang tukuyin ang formula upang kalkulahin ang mga patlang para sa Nilikhang Rekord. I-update ang target rekord. I-update ang nag-uugnay na rekord. Para sa huling dalawa, upang ma-access ang mga katangian sa isang target entidad gamitin ang pag-andar `targetEntity\attribute`. Upang ma-access ang mga katangian sa isang target entidad na itakda dati bago ang daloy ng trabahi ay nalaman gamit ang pag-andar `targetEntity\attributeFetched`.

Example:
Halimbawa: 

```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```

```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
``
