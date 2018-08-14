# Business Process Management

Ang Business Process Management (BPM) tool ay nagbibigay kakayahang mag-model at mag-automate ng isang business process sa EspoCRM. Ito ay isang engine na nagpapatupad ng business process na inilalarawan sa BPMN 2.0 standard. Ang BPM tool ay makukuha sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) na extension.

![BPM example](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### Pagkakaiba mula sa Workflows tool

Ang workflows tool ay ginawa para sa automation ng mga simpleng business rules, nang walang mga sequential flow items, kung kailan hindi na kailangang ipakita ang flow graphically.

Ang BPM tool ginawa para sa mga komplikadong business flows, kung saan mayroong mga diverging at converging na mga flow, execution delays at user interaction. Ginagawa ng flowchart view ang business process na mas madaling maunawaan ng isang tao, ang isang log ay pumapahintulot na makita kung paaano ginawa nag proseso.

### Mga Proseso na Flowchart

Ang link ng mga proseso na flowchart ay makukuha mula sa administration panel. Maaari rin itong idagdag bilang isang tab sa navigation panel.

Ang mga flowchart ay nilalayon para sa pag-momodelo ng mga business process. Ang isang administrador ay maaaring lumikha at mag-edit ng mga flowchart. Ang mga regular na user ay maaari lamang tingnan ang flowcharts.

Ang bawat flowchart ay mayroong tiyak na uri ng entity (Target Type na field). Tinutukoy ng flowchart ang pagpapatupad ng mga darating na mga process instance. Binubuo ito ng mga elemento ng flowchart at mga koneksyon sa pagitan ng mga elemento.

Kung ang proseso flowchart ay mayroong 'Is Active'field na walang check, hindi ito magsisimula ng mga proseso instance.

Upang ipakita ang mga detalye at parameter ng isang tiyak na elemento ng flowchart, kailangan mo itong i-click. Sa mode ng pag-edit, magagawa mong i-edit ang mga parameter.

## Mga Process

Ang mga proseso ay makikita mula sa administration panel. Ang link ay maaari ding idagdag bilang isang tab sa navigation panel.

Ang proseso ang kumakatawan ng isang business process instance. Kapag ito ay sinimulan, ito ay makakakuha ng status na 'Started.' Kapag ang proseso ay natapos na, ito ay makakakuha ng status na 'Ended.' Ang proseso ay maaari ding itigil ng manu-mano sa pamamagitan ng isang user na may access upang i-edit ang process. Kapag ito ay itinigil ng manu-mano, ito ay makakuha ng status na 'Stopped.'

Ang proseso ay isinasagawa ayon sa flowchart. Ang flowchart ng proseso ay hindi na mababago kapag nasimulan na ang process.

Ang proseso obligatorily ay may kaugnayan sa single target record.

Ang mga proseso ay maaring magsimula ng kusa (sa mga partikular na kondisyon o sa pag-iiskedyul) o manu-mano (kung saan mayroong kahit na isang Start Event sa flowchart). Upang masimulan ang proseso ng manu-mano, dapat i-click ng user ang 'Start Process' na button sa list view ng mga process.

## Mga Flowchart Element

### Mga Event

Ang mga event ay naka-display sa isang flowchart bilang mga bilog.

#### Start Event

Walang mga parameter. Ito ay isang panimulang punto ng isang proseso. Ang Start Event ay maaaring simulan ng manu-mano ng isang user na may access upang lumikha ng isang proseo. Dapat i-click ng user ang 'Start Process' na button sa list view ng mga process.

####  Kondisyonal na Start Event

Panimulang punto ng proseso. Ito ay dapat na ma trigger ng kusa kapag ang mga tinutukoy na mga kondisyon ay natutugunan. Mayroong dalawang klase ng trigger: 'After rekord created,' 'After rekord saved.'

#### Timer Start Event

Panimulang punto ng proseso. Sinisimulan nito ang mga proseso sa pamamagitan ng pag-iiskedyul. Kailangan mong tukuyin ang list report na nagbabalik ng mga rekord para sa pagsisimula ng mga proseso at pag-iiskedyul sa crontab notation.

#### Kondisyonal Intermediate Event

Ang event na ito ay pumipigil sa flow hanggang ang specified criteria ay natugunan na.

#### Timer Intermediate Event

Ang event na ito ay pumpipil sa flow and naghihintay hanggat tinutukoy ng mga event's parameter.

Para sa mga mas komplikadong timer settings, maaari mong gamitin ang [formula](formula.md). Dapat ibalik ng formula scripts ang Date-Time value (sa UTC timezone). Kapag ang oras na ito ay dumating, ang flow ay magpapatuloy sa susunod na elemento.

Sa pamamagitan ng paggamit ng datetime\closest formula function, posible ng maitakda ang timer sa isang tiyak na oras sa hinaharap, e.g. ang simula ng susunod na araw ng pagtatrabaho.

#### End Event

Nagtatapos ng kasalukuyang flow. Hindi nito tinatapos ang mga flow na tumatakbo nang makapareho. Kapag ang flow ay umabot na sa dulo at wala ng kung ano mang pinatatakbo nang magkapareho, hihinto na ang process.

#### Terminate End Event

Nagtatapos ng lahat ng mga flow. Ang proseso ay kasunod na natatapos.

### Mga Gateway

Ang mga gateway ay idini-display bilang mga diamante.

#### Eksklusibo na Gateway

Ay maaaring mag-diverge o mag-converge ng mga flow.

Kung sakaling ito ay diverging, tumutukoy ito ng iisang flow (path) na pwedeng piliin ayon sa tinutukoy na kriterion. Ang unang natupad na kondisyon ay tumutukoy sa flow, ang sumusunod na kondisyon ay tinatanggal. Maayroon itong kakayahan na tukuyin ang default flow. Ang default flow ang pinipili kung mayroong mga kondisyon na hindi natutupad. Ang default flow ay minamarkahan ng slash sign.

Kung sakaling ito ay converging, dinidirekta ang flow sa palabas na elemento. Hindi ito bina-block kahit na nakarating na ang flow, kaya ang mga parallel flow ay hindi pagsasama-samahin upang maging isang solo na flow.

![exclusive gateway divergent](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive na Gateway

Ay maaaring mag-diverge o mag-converge ng mga flow.

Kung sakaling ito ay diverging, maaari itong idirekta sa isa or maramihang parallel flow (paths), depende sa pagtatapos ng kriterion ng bawat flow. Ang default flow ay pinipili kung walang nakikitang kondisyon. Ang default flow ay minimarkahan na may slash sign.

Kung mayroong isang pangangailangan na pagsamahin ang mga parallel flow na nagawa sa pamamagitan ng divering inclusive gateway, kailangan mong gumamit ng isang convering inclusive gateway. Ito ay maghihintay para sa lahat ng papasok na flow at pagkatapos ay magpapatuloy sa papalabas na elemento.

![inclusive gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-inclusive.png)

Tandaan: Ang mga divering at converging gateway ay dapat na balanse. 

Tandaan: Kung ang isang parallel flow ay natapos na para sa ilang kadahilanan, kung gayon ang divering gateway ay hindi mapoproseso. Ang proseso ay maba-block. Iwasan ang flowchart design na maaaring magdulot ng gayong sitwasyon. 

#### Parallel Gateway

Ay maaaring mag-diverge o mag-converge ng mga flow.

Kung sakaling ito ay divering, hinahati nito ang flow sa loob ng maramihang parallel flow. Walang mga parameter sa ganitong klaseng gateway. 

Kung sakaling ito ay converging, naghihintay ito hanggang sa lahat ng papasok nga flow ay dumating at pagkatapos ay magpapatuloy sa susunod na papalabas na elemento.

![parallel gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-parallel.png)

Tandaan: Ang mga divering at converging gateway ay dapat na balanse. 

Tandaan: Kung ang isang parallel flow ay natapos na para sa ilang kadahilanan, kung gayon ang divering gateway ay hindi mapoproseso. Ang proseso ay maba-block. Iwasan ang flowchart design na maaaring magdulot ng gayong sitwasyon. 

#### Event Based Gateway

Ay maaaring lamang mag-diverge ng mga flow.

Hinihinto nito ang flow hanggang sa anumang palabas na event ay matri-trigger. Ang isang triggered event ay tumutukoy sa solong flow. Ang iba pang papalabas na event ay tinatanggihan.

Ang mga intermediate event lamang ang maaaring nasa kabilang dulo ng mga papalabas na sequence flow. 

![event based gateway](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-event-based.png)

### Mga Aktibidad

Ang mga aktibidad ay idi-display bilang mga bilogang rektanggulo. 

#### Gawain

Ang gawain ay maaaring mag-execute ng mga sumusunod na mga aksyon: 

* Lumika ng rekord - lumikha ng bagong rekord ng anumang entity type;
* Lumikha nga kaugnay na rekord - lumikha ng bagong rekord na may kaugnayan sa target record;
* Mag-update ng target record;
* Mag-update ng kaugnay na rekord - Ina-update ang rekord o records na may kaugnayan sa target record; 
* Mag-update ng nilikhang rekord - ina-update ang tiyak na field ng anumang rekord sa kasalukuyang proseso;
* Mag-update ng naproseso na rekord - maaaring gamitin para magtalaga ng proseso sa tinutukoy na user o team;
* Mag ugnay sa ibang rekord - inuugnay ang target na rekord sa isang tinutukoy na rekord;
* I-unlink mula sa ibang rekord - ini-unlink ang target na rekord mula sa tinutukoy na rekord;
* Mag-apply ng patakaran sa pagtakda - magtalaga sa target na rekord, sa prinosesong rekord o anumang nilikhang rekord ng proseso ayon sa tinutukoy na panuntunan;
* Lumikha ng notipikasyon - lumilikha ng in-app notipikasyon para sa mga tinutukoy na user;
* Gawing Followed - ina-assign ang mga tiyak na user na sumunod sa target na rekord, sa prinosesong rekord or anumang nilikhang rekord ng proseso;
* Paganahin ang serbisyo na aksyon - pinapagana ang custom na serbisyo na action na ipinapatupad ng nag-develop.

Ang mga aksyon na magagamit para sa gawain ay halos kapareho ng tampok ng Workflow. Tingnan ang higit pang mga detalye tungkol sa [workflow's actions](workflows.md#actions).

#### Magpadala ng Message Task

Magpadala ng email na mensahe para sa partikular na tatanggap.

#### Gawain ng User

Nagbibibay ng pleksibol na kakayahan ng user interaksyon. Tinitigil nito ang pagpapatupad hanggang ang user (tinutukoy ng tahasaon o tuntunin ng pagtatalaga) ay naayos ang gawain. Ang prinosesong user task rekord ay lilikhain sa parehong sistema.

* Ang approve type ay mangangailan sa user na pumili sa pagitan ng 'Approved' at 'Declined.'
* Ang review type ay nagbibigay lamang ng isang pagpipilian: 'Reviewed.'
* Ang accomplish type ay mayroong dalawang pagpipilian: 'Completed' at 'Failed.'


Ang user na naka-assign sa nilikang prinosesong user task rekord ang siyang tatanggap ng in-app notipikasyon. Ang administrador ay maaari ding mag-enable ng email notipikasyon. 

Ang mga user ay maaaring ding magdagdag ng prinosesong user task dashlet sa kanilang dashboard para makita ang aktwal na prinosesong user tasks. 

Possible ding mabasa ang resolution ng lumipas ng user taks loob ng mga diverging gateway o mga kondisyonal na mga event, na gumagawa ng ramification sa process flow. 

#### Script Task

Isinasagawa ang script sa [espo-formula](formula.md) na lengguwahe. Lahat ng naka-set na variable (`$variableName`) ay itatabi at gagamitin sa loob ng proseso. 

### Flows

#### Sequence Flow 

Inilalarawan bilang isang solid na arrow. Pinapahiwatig ang kaayusan kung saan ang prinosesong elemento ay isasagawa.

## Mga Kondisyon

Ang mga kondisyonal na event, ekslusibo at mga kasamang divering gateway ay may mga kondisyon na tumutukoy sa daloy ng proseso. 

Sa pamamagitan ng UI, may kakayahan itong i-check ang mga kondisyon para sa mga sumusunod na mga rekord:

* Target rekord;
* Mga rekord na kaugnay ng target sa pamamagitan ng many-to-one at children-to-parent na kaugnayan;
* Ang mga rekord na nilikha ng proseso sa pamamagitan ng mga gawain;
* Mga user task rekord, na nagpapahintulot sa pag-check sa resolusyon.

Posible rin na tukuyin ang mga kondisyon sa [Espo-formula](formula.md) na lengguwahe.

Ang mga kondisyon sa BPM tool ay pareho sa tampok na Workflow. Tingnan ang higit pang mga detalye 
tungkol sa [workflow's conditions](workflows.md#conditions).

## Mga Halimbawa

### Unang Halimbawa
![Example 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

### Pangalawang Halimbawa
![Example 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

#### Pangatlong Halimbawa
![Example 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)