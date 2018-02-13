# Pamamahala ng Proseso ng Negosyo

BuAng Pamamahala sa Pamamahala ng Proseso ng Negosyo (BPM) ay nagbibigay ng kakayahang mag-modelo at mag-automate ng mga proseso ng negosyo sa EspoCRM. Ito ay isang engine na nagsasagawa ng mga proseso ng negosyo na inilarawan sa pamantayan ng BPMN 2.0. Available ang tool sa BPM sa extension [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) .

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Pagkakaiba mula sa tool ng Workflows

Ang tool ng workflows ay nilayon para sa automation ng mga simpleng patakaran sa negosyo, w / o sequential na mga item ng daloy, kapag hindi na kailangang ipakita ang daloy ng graphically.

Ang BPM tool ay inilaan para sa mas kumplikadong daloy ng negosyo, kung saan maaaring maging diverging at converging daloy, pagkaantala sa pagpapatupad, mga pakikipag-ugnayan ng gumagamit. Ang isang flowchart view ay gumagawa ng proseso ng negosyo na mas maunawaan para sa isang tao, isang log ay nagpapahintulot upang makita kung paano ang proseso ay gaganapin.

## Proseso ng mga Flowchart

Ang link sa proseso ng flowcharts ay makukuha mula sa panel ng administrasyon. Maaari rin itong idagdag bilang isang tab sa panel ng nabigasyon.

Ang mga flowchart ay inilaan para sa pagmomolde ng proseso ng negosyo. Ang Administrator ay maaaring lumikha at mag-edit ng mga flowchart. Maaari lamang tingnan ng mga regular na user ang mga flowchart.

Ang bawat flowchart ay mayroong partikular na uri ng nilalang (Target Type field). Tinutukoy ng flowchart ang pagpapatupad ng mga pangyayari sa hinaharap na proseso. Binubuo ito ng mga elemento ng flowchart at mga koneksyon sa pagitan ng mga elemento.

Kung ang proseso ng flowchart ay may naka-check na 'Aktibo' na patlang pagkatapos hindi ito magsimula proseso ng mga pagkakataon.

Upang ipakita ang mga detalye at parameter ng isang tiyak na elemento ng flowchart kailangan mong mag-click dito. Sa edit mode maaari mong i-edit ang mga parameter.

## Mga Proseso

Available ang mga proseso mula sa panel ng pangangasiwa. Ang link ay maaari ding idagdag bilang isang tab sa panel ng nabigasyon.

Ang proseso ay kumakatawan sa halimbawa ng proseso ng negosyo. Kapag pinasimulan ito ay nakakakuha ng status 'Started'. Kapag natapos ang proseso nakakakuha ito ng katayuan naKapag natapos ang proseso nakakakuha ito ng katayuan na 'Ended'. Ang proseso ay maaari ring itigil nang manu-mano sa pamamagitan ng isang user na may access upang i-edit ang proseso. Kung ito ay tumigil nang manu-mano ito ay nakakakuha ng katayuan na 'Stopped'.

Ang proseso ay isinagawa ayon sa flowchart. Hindi mapapalitan ang flow ng proseso pagkatapos makapagsimula ang proseso.

Ang proseso na obligatorily ay may kaugnayan sa iisang target record.

Maaaring awtomatikong magsimula ang mga proseso (sa mga partikular na kundisyon o sa pamamagitan ng pag-iiskedyul) o mano-mano (kung saan mayroong hindi bababa sa isang Start Event sa flowchart). Upang simulan ang proseso nang manu-mano ang gumagamit ay kailangang mag-click sa pindutan ng 'Simulang Proseso' sa view ng mga proseso ng listahan.

## Mga Elemento ng Flowchart

### Mga kaganapan

Ang mga kaganapan ay ipinapakita sa isang flowchart bilang mga lupon.

#### Simulan ang Kaganapan

DWala itong mga parameter. Ito ay isang panimulang punto ng proseso. Ang Start Event ay maaaring manu-mano nang sinimulan ng isang gumagamit na may access upang lumikha ng mga proseso. Kailangan ng user na mag-click sa pindutan ng  'Start Process' sa view ng listahan ng mga proseso.


#### Conditional Start Event

Ang panimulang punto ng proseso. Ito ay dapat na awtomatikong na-trigger kapag tinukoy na mga kondisyon ay natutugunan. Mayroong dalawang uri ng pag-trigger: 'After record created', 'After record saved'.

#### Simula ng Kaganapan

AAng panimulang punto ng proseso. Nagsisimula ang mga proseso sa pamamagitan ng pag-iiskedyul. Kailangan mong tukuyin ang ulat ng listahan na nagbabalik ng mga tala para sa mga proseso ng pagpapasimuno at pag-iiskedyul sa notasyon ng crontab.

#### Conditional Intermediate Event

Ang kaganapan na ito hihinto ang daloy hanggang natukoy na pamantayan ay natutugunan.

#### Timer Intermediate Event

Ang kaganapan na ito hihinto ang daloy at naghihintay hangga't tinukoy sa pamamagitan ng mga parameter ng kaganapan.Ang kaganapan na ito hihinto ang daloy at naghihintay hangga't tinukoy sa pamamagitan ng mga parameter ng kaganapan.

Para sa mas kumplikadong mga setting ng timer maaari mong gamitin ang formula. Ang mga script ng formula ay dapat bumalik sa halaga ng Petsa ng Oras (sa timezone ng UTC). Kapag ang oras na ito ay dumating ang daloy ay nagpapatuloy sa susunod na elemento.

Sa pamamagitan ng paggamit ng datetime \ pinakamalapit na formula function posible upang itakda ang timer sa isang tiyak na oras sa hinaharap, hal. ang simula ng susunod na araw ng pagtatrabaho.

#### Pangwakas na Kaganapan

Natapos ang kasalukuyang daloy. Hindi nagtatapos ang daloy na tumatakbo nang magkapareho. Kapag ang daloy ay umabot sa dulo ng kaganapan at walang anumang bagay na tumatakbo sa kahilera pagkatapos ay nagtatapos ang proseso.

#### Tapusin ang Kaganapan sa Pagtatapos

Natapos ang lahat ng daloy. Pagkatapos ay natapos ang proseso

### Mga Gateway

Ang mga gateway ay ipinapakita bilang mga diamante.

#### Eksklusibong Gateway

Maaaring magkaiba o magkakatipon ang daloy.

Sa kaso ng diverging ito tumutukoy sa isang solong daloy (landas) na ay pinili ayon sa tinukoy na pamantayan. Ang unang natugunan na kalagayan ay tumutukoy sa daloy, ang mga susunod na kondisyon ay tinanggal. May kakayahang tukuyin ang default na daloy. Ang default na daloy ay napili kung walang nakikitang mga kundisyon. Ang marka ng default ay minarkahan ng slash sign.

Sa kaso ng converging ito lamang ang nagtuturo ng daloy sa mga papalabas na elemento. Ito ay hindi nakakakuha ng block pagkatapos ng daloy ay dumating bagaman, kaya parallel daloy ay hindi pagsasama sa daloy ng daloy.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive Gateway

Maaaring magkaiba o magkakatipon ang daloy

Sa kaso ng diverging, maaari itong idirekta sa isa o maramihang parallel daloy (landas), depende sa tagumpay ng pamantayan ng bawat daloy. Ang default na daloy ay napili kung walang nakikitang mga kundisyon. Ang marka ng default ay minarkahan ng slash sign. 

Kung may pangangailangan na pagsamahin ang mga parallel flow na ginawa ng isang diverging inclusive gateway kailangan mong gumamit ng isang converging inclusive gateway. Ito ay maghihintay para sa lahat ng papasok na daloy at pagkatapos ay magpatuloy sa papalabas na elemento.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Tandaan: Dapat na balanse ang diverging at converging gateway.

Tandaan: Kung ang isa sa mga parallel daloy ay natapos para sa ilang kadahilanan ang diverging gateway ay hindi kailanman mapoproseso. Ang proseso ay mai-block. Iwasan ang isang disenyo ng flowchart na maaaring magdulot ng gayong sitwasyon.

#### Parallel Gateway

Maaaring magkaiba o magkakatipon ang daloy.

Sa kaso ng diverging ito splits daloy sa maramihang parallel daloy. Walang mga parameter para sa uri ng gateway na ito.

Sa kaso ng converging ito naghihintay hanggang sa lahat ng mga papasok na daloy ay darating at pagkatapos ay patuloy sa susunod na palabas na elemento.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Tandaan: Dapat na balanse ang diverging at converging gateway.

Tandaan: Kung ang isa sa mga parallel daloy ay natapos para sa ilang kadahilanan ang diverging gateway ay hindi kailanman mapoproseso. Ang proseso ay mai-block. Iwasan ang isang disenyo ng flowchart na maaaring magdulot ng gayong sitwasyon.

#### Kaganapan Batay sa Gateway

Maaari lamang magkaiba ang daloy.

Ito ay tumitigil sa daloy hanggang sa anuman sa mga papalabas na kaganapan ay makakakuha ng pag-trigger. Tinutukoy ang nag-trigger na kaganapan ang nag-iisang daloy. Ang iba pang mga palabas na kaganapan ay tinanggihan.

Ang mga intermediate na kaganapan lamang ay maaaring sa kabilang dulo ng mga papalabas na mga daloy ng pagkakasunud-sunod.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Mga Aktibidad

Ang mga aktibidad ay ipinapakita bilang bilugan na mga parihaba.

#### Task

Gagagawa ng gawain ang pagsunod sa mga pagkilos:

* Lumikha ng Record - lumilikha ng bagong tala ng anumang uri ng entidad;
* Lumikha ng Kaugnay na Rekord - lumilikha ng bagong rekord na may kaugnayan sa rekord ng target;
* I-update ang Rekord ng Target;
* I-update ang Kaugnay na Rekord - ina-update ang rekord o rekord na may kaugnayan sa rekord ng target;
* I-update Nilikha ang Rekord - ina-update ang partikular na larangan ng anumang rekord na nilikha sa kasalukuyang proseso;
* I-update ang Proseso ng Pag-record - ay magagamit upang italaga ang proseso sa partikular na user o koponan;
* Mag-link sa Isa pang Record - mga link sa target na rekord na may tinukoy na rekord;
* I-unlink mula sa Isa pang Record - i-unlink ang target record mula sa tinukoy na record;
* AMag-apply ng Rule ng Pagtatalaga - magtatalaga ng target record, ang record ng proseso o anumang rekord na nilikha ng proseso ayon sa tukoy na tuntunin;
* Lumikha ng Abiso - lumilikha ng in-app na abiso para sa mga partikular na user;
* Gumawa ng Sumunod - ginagawang sundin ng mga tiyak na user ang target record, ang proseso ng rekord o anumang rekord na nilikha ng proseso;
* Patakbuhin ang Aksyon ng Serbisyo - nagpapatakbo ng mga pasadyang serbisyo na ipinatupad ng mga developer.

Ang mga aksyon na magagamit para sa gawain ay halos kapareho ng sa tampok na Workflow. Tingnan ang higit pang mga detalye tungkol sa mga [workflow's actions](workflows.md#actions).

#### Magpadala ng gawaing mensahe

Nagpapadala ng mensaheng email sa partikular na tatanggap.

#### Gawaing gumagamit

Nagbibigay ng kakayahang umangkop sa pakikipag-ugnayan ng user. Itigil ang pagpapatupad hanggang sa ang user (tinukoy na malinaw o sa pamamagitan ng panuntunan sa pagtatalaga) ay napagtatalo ang gawain. Ang Proseso ng Gumagamit ng Task rekord ay malilikha sa system. Bilang default mayroong tatlong uri ng pagkilos: Aprubahan, Repasuhin, Tuparin.

* Ang apruba ng uri ay nangangailangan ng gumagamit na pumili sa pagitan ng  'Approved' at 'Declined'.
* Ang uri ng pagsusuri ay nagbibigay lamang ng isang pagpipilian:  'Reviewed'.
* Mayroong dalawang pagpipilian ang uri ng pagsasakatuparan:  'Completed' at 'Failed'.


Ang user na nakatalaga sa nilikha na Tala ng Tala ng Gumagamit ng Gumagamit ay makakatanggap ng abiso ng in-app. Maaari ring paganahin ng administrator ang mga notification sa email.

Ang mga gumagamit ay maaari ring magdagdag ng Dashlet ng Mga Gumagamit ng Gumagamit sa kanilang dashboard upang makita ang kanilang mga aktwal na proseso ng mga gawain ng gumagamit.

Posible na basahin ang resolusyon ng naipasa na gawain ng user sa loob ng diverging gateway o kondisyon na mga pangyayari, na ginagawa ang pag-uumpisa sa daloy ng proseso.

#### Gawaing Script 

Pinapatupad ang script sa [espo-formula](formula.md) na wika. Ang lahat ng mga hanay ng mga variable (`$variableName`) ay maiimbak at magagamit sa loob ng proseso.

### Mga Daloy

#### Pagkakasunud-sunod ng Daloy 

Kinakatawan bilang isang solid arrow. Nagpapahiwatig ng pagkakasunud-sunod kung saan ang mga elemento ng proseso ay papatupad. 

#Kundisyon

Ang mga kondisyong pangyayari, eksklusibo at napapabilang diverging gateway ay may mga kondisyon na nagpapasiya sa daloy ng proseso.

Sa pamamagitan ng UI mayroong kakayahang suriin ang mga kondisyon para sa mga sumusunod na tala:

* Target record;
* Mga rekord na may kaugnayan sa target sa pamamagitan ng mga relasyon sa maraming-sa-isang at mga anak-sa-magulang; 
* Mga rekord na nilikha ng proseso sa pamamagitan ng mga gawain;
* Mga tala ng gawain ng user, na nagbibigay-daan sa pag-check sa resolution. 

Posible rin na tukuyin ang mga kondisyon sa wika ng [Espo-formula](formula.md).

Ang mga kondisyon sa tool ng BPM ay pareho sa tampok na Workflow. Tingnan ang higit pang mga detalye tungkol sa mga  [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
