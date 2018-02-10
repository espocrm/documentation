# Business Process Management

Ang Business Process Management (BPM) nga tool kay naghatag og abilidad nga mumodel og mu-awtomeyt sa mga proseso sa negosyo sa EspoCRM. Usa kini ka makina nga maoy mubuhat sa mga proseso sa negosyo nga gihulagway sa BPMN 2.0 nga standard. Ang BPM nga tool kay makita sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) nga ekstensyon.

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Kalainan gikan sa Workflows nga tool

Ang Workflows nga tool kay gituyo para mu-awtomeyt sa mga yano ra nga mga balaod sa negosyo, nga walay sequential flow nga mga item, kung kanus-a wala gikinahanglan ang pagdisplay sa flow nga pina-grapikal.

Ang BPM tool gihimo para sa mga komplikado nga mga proseso sa negosyo, kung asa naay pwede natipon o nagbuwag nga mga proseso, ulahi nga eksekusyon, o mga inter-aksyon sa user. Ang flowchart view kay himoon ang mga proseso sa negosyo nga sayon sabton sa usa ka tao, ang log kay mutugot sa pagpakita kung giunsa ang proseso pagbuhat.

## Mga Flowchart sa mga Proseso

Ang link para iproseso ang mga flowchart kay makit-an sa administrasyon nga panel. Pwede usab kini ipuno sa nabigasyon nga panel isip usa ka tab.

Ang mga flowchart kay gituyo para pag-model sa mga proseso sa negosyo. Ang administrador kay makahimo og makausab sa mga flowchart. Ang mga regular nga user kay pwede ra maka tan-aw sa mga flowchart.

Ang kada flowchart kay naay espisipiko nga tipo sa entity (Target Type field). Ang flow chart mudetermina sa pagpadagan sa mga musunod nga proseso na mga instance. Gilangkuban kini sa mga flowchart na elemento og mga koneksyon tali sa mga elemento.

Kung ang flowchart nga proseso kay naay wala nga nacheck nga 'Is Active' nga field, dili kini sugdan ang pagsugod sa proseso.

Para ipakita ang mga detalye ug mga parameter para sa usa ka flowchart nga element, kinahanglan nimo e-klik kini. Sa edit nga mode, pwede nimong usbon ang mga parameter.

## Mga Proseso

Ang mga proseso kay maanaa gikan sa administrasyon nga panel. Ang link kay pwede usab kini ipuno sa nabigasyon nga panel isip usa ka tab.

Ang mga proseso kay nagrepresentar sa mga proseso sa usa ka negosyo. Kung sugdan kini, ang status kay mausab ngadto sa 'Started'. Kung ang proseso kay mahuman na, ang status kay mausab ngadto sa 'Ended'. Ang proseso kay pwede usab hunongon ug manomano sa usa ka user nga naay pagtugot nga muusab sa proseso. Kung gi manomano kinig hunong, ang status niini kay usbon ngadto sa 'Stopped'.

Ang proseso kay himoon base sa flowchart. Ang Flowchart sa proseso kay dili pwede nga usbon inig human ug sugod.

Ang usa ka proseso kay olbigado nga naay relasyon sa usa ra ka target nga record.

Ang mga proseso kay pwede sugdan ug ditso nga awtomatik (kung naa mga espesipiko nga mga kondisyon o gikan sa paghimo og iskedyul). Para sa manomano nga pagsugod sa proseso, ang user kay gikinahanglan nga mu klik sa 'Start Process' nga pindutanan sa lista nga view sa mga proseso.

## Mga Flowchart nga Elemento

### Mga Event

Ang mga Event kay gi display sa flowchart isip ka mga lingin.

#### Sugod nga Event

Wala kini mga parameter. Kini kay ang sugod nga punto sa proseso. Ang Sugod nga Event kay pwede sugdan nga manomano sa usa ka user nga naay pagtugot para muhimo og mga proseso. Ang user kay gikinahanglan nga muklik sa 'Start Process' nga pindutanan sa mga lista nga view sa mga proseso.

#### Kondisyonal nga Sugod nga Event

Kini kay ang sugod nga punto sa proseso. Kini kay dapat unta sugdan dayon awtomatikali kung ang mga kondisyon kay naabot. Naay duha ka mga tipo sa mga trigger: 'After record created', 'After record saved'.

#### Timer nga Sugod nga Event

Kini kay ang sugod nga punto sa proseso. Sugdan niini ang mga proseso ginamit ang pag-eskedyul. Gikinahanglan nimo nga pahinganlan ang report nga lista nga mubalik sa mga rekord para sa pagsgugod sa mga proseso ug pag-eskedyul sa sud sa crontab nga notation.

#### Kondisyonal nga Intermediate nga Event

Ang kini nga event kay hunongon ang flow hangtod nga maabot ang mga kondisyon nga gitakda.

#### Timer nga Intermediate nga Event

Ang kani nga event kay muhunong sa flow ug maghuwat kung gitakda kini sa parameter sa event.

Para sa mga mas komplikado pa nga mga setting, pwede gamiton ang [formula](formula.md). Anga mga formula nga mga script kay dapat mubalik og Date-Time nga value (sa UTC nga timezone). Kung muabot na ang oras niini, ang flow kay sundan sa sunod nga elemento.

Sa paggamit og datetime\closest nga formula nga function, pwede na iset ang timer sa espisipiko nga oras sa umaabot, e.g. ang sugod sa adlaw sa ugma nga naay trabaho.

#### Katapusan nga Event

Undagon ang karon nga flow. Dili niya undagon ang mga flow nga nagdagan in parallel. Kung ang flow kay naabot na sa kataposan nga event ug wala nay laing nagdagan pa in parallel, taposon niini ang proseso.

#### Terminate nga Kataposan nga Event

Muundang sa tanan nga mga flow. Ang proseso kay ulahing undangon.

### Mga Gateway

Ang mga gateway kay ipakita isip mga diamond.

#### Eksklusibo nga Gateway

Pwede mubuwag o magtipon sa mga flow.

Sa kaso nga kini mag buwag, muhimo kini og usa ka nag-inusara nga flow (nga path) nga pilion sa nase sa gitakda nga mga kondisyon. Ang unang naabot nga kondisyon kay mudetermina sa flow, ang sunod nga mga kondisyon kay pangtangtangon. Naa kini abilidad nga mutakda kong unsa ang default nga flow. Ang default nga flow kay pilion kong walay mga kondisyon nga naabot. Ang default nga flow kay markahan og slash nga sign.

Sa kaso nga magtipon, mu idirekta ra niini ang flow ngado sa outgoing nga elemento. Dili hinoon kini babagan pagkahuman sa pag-abot sa flow, mao ang mga parallel nga mga flow kay dili matipon ngadto sa usa ka nag-inusara nga flow.

![eksklusibo nga gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![eksklusibo nga gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inklusibo nga Gateway

Pwede mubuwag og mutipon sa mga flow.

Sa kaso nga mubuwag, pwede ni siya idirekta sa usa o mas daghan pa nga mga parallel nga flow (nga path), depende kung naabot ang mga kondisyon sa tagsa tagsa ka mga flow. Ang default nga flow kay pilion kung walay kondisyon nga naabot. Ang default nga flow kay markahan og slash nga sign.

Kung gikinahanglan nga itipon ang mga parallel nga mga flow nga nahimo sa pag buwag sa mga inklusibo nga mga gateway, gikinahanglan nimo nga gamiton ang nagtipon nga inklusibo nga gateway. Maghuwat kinig para sa tanang mga padulong nga mga flow ug mupadayon sa mga mubiya nga mga elemento.

![inklusibo nga gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Timan-e: Dapat ibalanse ang mga magbuwag o mga magtipon nga mga flow.

Timan-e: Kung ang usa ka parallel nga flow kay maundang tungod sa usa ka rason, ang magbuwag nga gateway kay dili na maproseso. Ang proseso kay pugngan. Likaye ang disenyo sa flowchart nga pwede mahitabo ni nga sitwasyon.

#### Parallel nga Gateway

Pwede mubuwag o mutipon sa mga flow.

Kung pananglit magbuwag, iyang tungaon ang flow ngadto sa makadaghan nga parallel nga mga flow. Walay paramter para sa kani nga tipo sa gateway.

Sa kaso nga magtipon, maghuwat kini hangtod ang tanan padulong nga mga flow kay maabot ug dayon mupadayon kini ngadto sa sunod nga elemento.

![parallel nga gateway](../_static/images/administration/bpm/gateway-parallel.png)

Timan-e: Ang magbuwag og magtipon nga mga gateway kay dapat balansehon.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

Timan-e: Kung ang usa ka parallel nga flow kay maundang tungod sa usa ka rason, ang magbuwag nga gateway kay dili na maproseso. Ang proseso kay pugngan. Likaye ang disenyo sa flowchart nga pwede mahitabo ni nga sitwasyon.

#### Gateway nga Gibase sa Event

Pwede ra magbuwag sa mga flow.

Hunongon niini ang flow hangtod ang tanang nagpadayon nga mga event kay masugdan. Ang mga nasugdan nga event kay mudeterminar sa nag-inusara nga flow. Ang uban nga nagpadayon nga event kay e-reject.

Ang mga intermediate ra nga event ang pwede nga naa sa pikas nga bahin sa mga nagpadayon nga mga sequence flow.

![gateway nga gibase sa event](../_static/images/administration/bpm/gateway-event-based.png)

### Mga Aktibidad

Ang mga aktibidad kay ipakita isip mga rektanggulo.

#### Tahas

Ang tahas kay pwede muhimo aning mga aksyon:

* Paghimo og Rekord - muhimo og bag-o nga record sa bisan unsa nga klase nga entity;
* Paghimo og Related nga Rekord - muhimo og bago nga record nga naay relasyon sa gitarget nga rekord;
* Pag-update sa Target nga Rekord;
* Pag-update sa Related nga Rekord - mu-update sa record o mga record nga naay relasyon sa gitarget nga rekord;
* Pag-update sa Nahimo na nga Record - mu-update sa espisipiko nga record nga field sa bisan unsang record nga nahimo sa proseso karon;
* Pag-udate sa Process na Record - pwede gamiton para mu-assign sa proseso sa espisipiko nga user o grupo;
* Pag-link ngadto sa Lain nga Record - mu-link sa gitarget nga rekord ngadto sa gitakda nga record;
* Pag-unlink gikan sa Lahi nga Record - mu-unlink sa gitarget nga record gikan sa gitakda nga rekord;
* Pag-assign sa Assignment nga Rule - mu-assign sa gitarget nga rekord, sa proseso nga rekord, o bisan unsang klase nga rekord nga gihimo sa proseso base sa gitakda nga kondisyon;
* Paghimo og Notipikasyon - muhimo og in-app nga notipikasyon para sa gitakda nga mga user;
* Himoong Followed - himoon ang usa ka gitakda nga user nga musunod sa usa ka gitarget nga rekord, sa proseso nga rekord, o bisan unsa nga rekord nga ginama sa proseso;
* Pagdagan sa Serbisyo nga Aksyon - mupadagan sa kustom nga serbisyo nga aksyon nga giimplementar sa mga debeloper.

Ang mga aksyon nga pwede himoon sa usa ka tahas kay halos parehas ra sa Workflow nga feature. Tanawa ang uban pa nga mga detalye kabahin sa [aksyon sa workflow](workflows.md#actions).

#### Pagpadala og Mensahe nga Tahas

Mupadala og email nga mensahe ngado sa usa ka espisipiko nga mudawat.

#### Tahas nga User

Muhatag og flexible nga abilidad nga user interaksyon. Hunoongon niini ang pagbuhat hangtod ang user (giklaro og takda o gikan sa assignment nga balaod) muhuman sa tahas. Ang Process User Task nga rekord kay himoon sa sistema. Naay tulo nga mga klase nga aksyon: Approve, Review, Accomplish.

* Ang Approve nga tipo kay nanginahanglan sa user nga mupili tali sa 'Approved' ug 'Declined'.
* Ang Review nga tipo kay muhatag lang og usa ka opsyon: 'Reviewed'.
* Ang Accomplish nga tipo kay naay duha ka opsyon: 'Completed' and 'Failed'.

Ang user nga na-assignan sa sa mga nahimo nga Process User Task nga rekord kay makadawat og in-app nga notipikasyon. Ang administrador kay pwede usab mutugot sa mga email nga notipikasyon.

Ang mga user kay pwede usab makadungag og Process User Tasks nga dashlet sa ilahang mga dashboard para makita ang mga proseso nga user nga task.

Pwede sad basahon ang resolusyon sa gipasa nga user task sa sulod sa nagbuwag nga mga gateway o mga kondisyonal nga mga event, nga mupamatuud sa proseso nga flow.

#### Script nga Tahas

Mu-eksikyut sa script sa sulod sa [espo-formula](formula.md) nga pinulongan. Ang tanang mga giset nga variable (`$variableName`) kay hiposon ug mahimong makuha sulod sa proseso.

### Mga Flow

#### Sequence nga Flow

Girepresanta isip usa ka solid nga udyong o arrow. Mupakita sa order kung asa ang mga proseso na elemento kay i-eksikyut.

## Mga Kondisyon

Ang mga kondisyonal nga event, eksklusibo og inklusibo nga mga magbuwag nga gateway kay naay mga kondisyon nga mudeterminar sa flow sa mga proseso.

Sa UI, naay abilidad nga tanawon ang mga kondisyon sa mga musunod nga mga rekor:

* Gitarget nga rekord;
* Mga rekord nga naay relasyon sa gitarget nga rekord pinaagi sa many-to-one ug children-to-parent nga mga relasyon;
* Ang mga rekord nga nahimo sa proseso gikan sa mga tahas.
* Ang mga tahas sa user nga rekord, nga pwede mupakita ug mupasusi sa mga resolusyon.

Posible usab nga muhimo og mga kondisyon sulod sa [Espo-formula](formula.md) nga pinulongan.

Ang mga kondisyon sa BPM too kay parehas ra sa Workflow nga feature. Tanawa ang mga detalye bahin sa [mga kondisyon sa workflow](workflows.md#conditions).

## Mga Example

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
