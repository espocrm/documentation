# Mga Workflow

Ang workflows nga feature kay naa makit-an sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Ang mga workflows kay mu-awtomeyt sa imohang mga proseso sa negosyo sa sayon nga pamaagi. Makit-an ni sa Administration nga panel. Para mugama ug workflow nga balaod, gikinahanglan nimong ipatin-aw ang mga musunod:

* Target Entity - kong unsa nga entity type workflow ang gigamit;
* Trigger Type - kon kanus-a sugdan ang workflow;
* Conditions - mga kondisyon nga nanginahanglan maabtan para masugdan ang workflow;
* Actions - unsa ang buhaton kong nasugdan na ang workflow.


## Mga Tipo sa Magpasugod

### Pagkahuman mahimo ang rekord

Masugdan ra kung usa ka bag-o nga rekord ang nabuhat. Kung ang gipasabot nga mga kondisyon kay naabot, ang mga aksyon kay i-eksekyut.

### Pagkahuman masave ang rekord

Masugdan ra kung ang bag-o nga rekord kay nahimo na ug ang nahimo na nga rekord kay na-update. Kung ang mga gipasabot nga mga kondisyon kay naabot, ang mga aksyon kay i-eksekyut.

Para sa mga balaod sa worflow nga naay in-ani nga tipo sa pagpasugod, komon nga  nga buhaton nga mukuha ug kondisyon para mucheck kung ang ubang mga field kay 'nausab'. E.g. Kung ang status sa Case kay nausab, sugdi ang ubang mga aksyon.

### Scheduled

Sugdan sumala sa gihimo nga scheduling. Pwede kang muset-up para ipadagan ni kada adlaw, kada semana, etc. Ang mga aksyon kay i-apply sa mga rekord nga giuli sa list repot. Mao gikinahanglan pud nimong mubuhat og list report.

Ang scheduling kay gi-specify ngadto sa usa ka crontab nga notasyon.

```
* * * * * *
| | | | | |
| | | | | +-- Tuig              (naa sulod sa: 1900-3000)
| | | | +---- Adlaw sa semana   (naa sulod sa: 1-7, 1 kay nagpasabot nga Lunes)
| | | +------ Buwan sa tuig     (naa sulod sa: 1-12)
| | +-------- Adlaw sa buwan    (naa sulod sa: 1-31)
| +---------- Oras              (naa sulod sa: 0-23)
+------------ Minuto            (naa sulod sa: 0-59)
```

### Sekwensyal

Tagsa ra kani gamiton. Ipadagan unta kini sa laing workflow. Naghatag ug abilidad nga muhimo og mga komplikado nga lohiko.

Timan-e: Para sa mga sequential nga mga workflow, girekomenda nga gamiton ang [BPM tool](bpm.md) kaysa sa Workflows nga feature.

## Mga Kondisyon

Pwede nimong ilista ang mga kondisyon nga gikinahanglan nga maabot para masugdan ang workflow. Naay duha ka mga pamaggi kong unsan paglista sa mga kondisyon: gamit ang UI condition builder og gamit ang formula.

### UI condition builder

Mga pwedeng gamiton nga mga tipo sa kondisyon:

* _equals_ - ang field kay pareha ra sa usa ka espisipiko nga balor o ang balor sa lahi nga field;
* _was equal_ - ang field kay pareho ra sa usa ka espisipiko nga balor sa di pa masugdan ang workflow;
* _not equals_ - ang field kay di parehas og balor sa usa ka espisipiko nga balor o ang balor sa lain nga field;
* _was not equal_ - ang field kay dili pareho sa usa ka espisipiko nga balor sa di pa sugdan ang workflow;
* _empty_ - ang balor sa field kay blangko;
* _not empty_ - ang balor sa field kay di blangko;
* _changed_ - ang field kay nausab;
* _not changed_ - ang field kay wala nausab.

### Mga kondisyon nga pormula

Ang pormula kay muhatag og abilidad nga mudefine sa mga kondisyon sa bisan unsa nga pagkakomplikado. Para mubasa mahitungod sa pormula syntax sunda ni nga [artikulo](formula.md).

Timan-e: Gikinahanglan nga walay bisan unsang `;` nga delimeter ang gamiton sa code nga pormula kung idetermina ang kondisyon.

## Mga Aksyon

### Pagpadala ug Email

Ang sistema kay magpadala ug email gamit ang gi-specify nga email template. Ang address sa mudawat sa email kay makuha gikan sa gitarget nga rekord, bisan unsang related nga rekord, ang kasamtangang user, mga follower, mga team user o mga gispecify. Ang email kay mapadala karon dayon o ipadugay para sa espisipiko nga interbal.

### Paghimo ug Rekord

Ang sistema kay muhimo og bag-o nga rekord sa bisan unsang entity nga tipo. Kung naay relasyon bahin sa gitarget nga rekord og ang naghimo nga rekord, naay posibilidad nga himoan og relasyon ang duha ka rekord.

Naay abilidad nga mu-define ug formula para ikalkula ang mga field.

### Paghimo og mga Related nga Rekord

Ang sistema kay muhimo og rekord nga naay relasyon sa gitarget nga rekord. Naay posibilidad nga mudefine ug pormula para ikalkula ang mga field.

### Pag-update sa Gitarget nga Rekord

Mupahimo og mga pag-usab sa mga espisipiko nga mga field sa gitarget nga rekord. Posibleng i-define ang pormula para ikalkula ang mga field.

Kung gikinahanglan nimong mudugang og mga bag-o nga mga item ngadto sa Link-Multiple field nga walay mawala nga nahimo na nga datos (e.g. Teams), gikinahanglan nimong gamiton ang pormula nga punsyon nga entity\addLinkMultipleId. Pananglitan: `entity\addLinkMultipleId('teams', 'teamId')`.

### I-update ang Related nga Rekord

Nagtugot nga muusab sa mga espisipiko nga mga field sa mga related rekord o mga rekord. Posible kini nga mudefine ug mga pormula para mukalkula sa mga field.

### Link sa Laing Rekord

Mu-relate sa gitarget nga entity sa laing espisipiko nga entity. E.g. mudugang ug espisipiko nga team ngadto sa rekord.

### Unlink sa Laing Rekord

Mu-unrelate sa gitarget nga entity sa laing espisipiko nga entity. E.g. mutangtang ug espisipiko nga team gikan sa rekord.

### I-apply ang Assignment nga Balaod

I-assign ang gitarget nga rekord sa user gamit ang distribusyon nga balaod. Naay duha ka mga balaod nga pwedeng gamiton: Round-Robin ug Least-Busy.

* Round-Robin - ang mga user kay pilion gikan sa taas ngadto sa ubos sa lista (team) ug balikon nasad pag-usab.
* Least-Busy - ang user nga naay pinakagamay nga na-assng nga mga rekord maoy pilion para sa assignment.

_List Report_ - Para sa Least-Busy nga distribusyon, i-determina kung unsa nga rekord ang gikonsiderar para makalkula ang ihap sa naka-assign nga mga rekord. E.g. para sa mga Case, gikinahanglan natong kwaon ra ang mga rekord nga naay aktibo nga estado.

### Paghimo og Notipikasyon

I-notify ang mga espisipiko nga mga user gamit ang kani nga mga mensahe. Posibleng mugamit og mga placeholder sa message template: {entity} - gitarget nga record, {user} - ang kasamtangang user.

### Himuong Musunod

Pugson ang mga espisipiko nga mga user nga musunod sa gitarget nga entity o ang gispecify nga related nga entity.

### Pagsugod sa Lain na sad nga Workflow

Mutugot nga muhimo og sekwensiyal nga mga workflow. Posible nga i-branch ang workflow gamit ang mga kondisyon: pwede nimong i-setup ang workflow para i-trigger ang duha ka workflow gamit ang managlahing mga kondisyon nga gidefine sa kato nga mga workflow.

Posible sad dugayon ug eksekyut ang sekwensiyal nga workflow. Sa sekwensiyal nga workflow, pwede nimong i-define ang kondisyon nga mu-check kung ang espisipiko nga mga field kay nausab kay ang ginikanan nga workflow kay gisugdan sa gamit ang _Changed_ ug _Was Equal_ nga mga tipo sa kondisyon.

Timan-e: Para sa sekwensiyal nga mga workflow, girekomenda nga mugamit og [BPM nga tool](bpm.md) kaysa sa Workflows nga feature.

### Ipadagan ang Service nga Aksyon

Mutugot nga ipadagan ug mga espisipiko nga mga script. Kung walay mga pag-usab, ang mga musunod nga aksyon kay pwede gamiton:

* Send Invitations - para sa Meetings/Calls;
* Add Quote Items - para sa Quotes.

Ang mga developer kay pwede kasulat ug ilahang kaugalingong mga aksyon nga serbisyo. Tan-awa ang [ubang mga detalye](../development/workflow-service-actions.md).

## Using Formula in Actions

Posible nga mudefine ug pormula para ikalkula ang mga field para sa Create Record, Update Target Record, Create Related Record, Update Related Record. Para sa nauwahi nga duha, para magamit ang mga attribute sa gitarget nga entity, gikinahanglan nimong mugamit sa punsyon nga `targetEntity\attribute`. Para gamiton ang mga attribute sa gitarget nga entity nga na-set usa nasugdan ang workflow, gamita ang punsyon nga `targetEntity\attributeFetched`.

Pananglitan:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
