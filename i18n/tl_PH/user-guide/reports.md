# Mga ulat

Ang tampok ng ulat ay makikita at makukuha sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

May dalawang uri ng ulat: List at Grid.  

## List na mga ulat

Report na list ng mga resulta mula sa listahan ng mga talaan na kayang matugunan ang mga tinukoy na pamantayan.

Para limikha ng report na list, i-click ang tab ng Reports at i-click ang lumikha ng report na button. Piliin ang kinakailangang tipo ng entidad at i-click ang Lumikha button at List Report section.

Sa _Columns_ field pumili ng mga larangan na gusto mong i-displey. Sa ibaba na maaari mong tukuyin ang mga parameter ng displey para sa bawat hanay e.g. lapad at paghanay.

Piliin ang mga kinakailangan na mga pag-ayos sa  _List Order_ field. 

Sa _Filters_ na seksyon ay maaari mong tukuyin ang pamantayan na tumutukoy kung anong mga talaan ang maiilista sa iyong ulat. Maaari mong gamitin ang lohikal na na mga operator na 'OR' at 'AND' dito.

_Runtime Filters_ ay nagbibigay-daan sa iyo upang tukuyin ang iba 't ibang mga pagsasala bago mo patakbuhin ang iyong ulat.

pwede mong i-export ang listahan ng mga reulta ng iyong ulat sa excel at csv na mga format.

## Ang mga ulat na grid

ang reulta ng mga ulat na grid ay nagbubuod ng mga halaga na nakagrupo batay sa tukoy na larangan. Ang mga ulat na ito ay pwedeng i-displey bilang isang tsart .

![Mga ulat na grid](../_static/images/user-guide/reports/grid.png)

Para gumawa ng bogaong ulat na grid ay i-klik ang tab ng mga ulat at pagkatapos ay i-iklik ang Gumawa ng bagong ulat na button. Piliin ang kakailanganing tukoy na entidad at pagkatapos ay i-klik ang Gumawa na button at seksyon ng ulat na grid.

Ang _Group By_ na larangan ay pumili ng isa o dalawa na mga larangan na gusto mo na makita sa datos ng iyong report na nakagrupo. posibleng magrupo ayon sa taon, buwan, at araw sa mga larangan ng panahon. Kung binuo mo ayos sa dalawang larangan ang iyong report ay ituturing bilang three-dimensional.

Sa _Columns_ na larangan ay pumili ng isa o dalawang aggregate na mga punksiyon kagaya ng  COUNT, SUM (summation), MIN, MAX, AVG (average).

_Order by_ na larangan ay naglalarawan Paano ang datos na ulat ay pinagsunod-sunod.

Sa _Filters_ na seksyon ay maaari kang tumukoy ng gagamitin batayan na tutukoy sa kung ano ang nakatala sa iyong report. Pwede kang gumamit ng logikal na operators kagaya ng 'OR' at 'AND' dito.

_Runtime Filters_ nagpapahintulot sa iyo na tukuyin ang iba 't ibang mga filter bago ka maubusan ng ulat

Ang ulat na grid ay nagpapahintulot sa iyo na i-displey ang mga resulta sa paraan ng tsart. Merong following _chart types_: Bar (Horizontal), Bar (Vertical), Pie, Line.

Posibleng i-export ang mga resulta ng ulat na grid sa sa excel at csv na mga format.

## Mga Pagsala

### Larangan ng pagsala

Simpleng paggamit ng mga tipo ng mga pagsala. Maari mo din na piliin ang mga larangan na target na entidad pati na rin ang mga kaugnay na entitidades.

![Field filter](../_static/images/user-guide/reports/filter-field.png)

### OR na grupo

OR ay nangangahulugan na  hindi dapat bababa sa isang kalagayan sa ilalim ng grupo ang dapat matugunan.

![OR group](../_static/images/user-guide/reports/filter-or.png)

### AND na grupo

AND ay nangangahulugan na lahat dapat na kalagayan sa ilalim ng grupo ang dapat matugunan.

### NOT na grupo

Nagbibigay ng kakayahan na isala mga talaan na di kayang matugunan ang mga tinukoy na pamantayan. E.g. Paglilista ng mga account na wala na anumang pagkakataon saradong panalo o saradong talo na katayuan.

![NOT group](../_static/images/user-guide/reports/filter-not.png)

### Komplikadong Pagpapahayag

Para sa mas mga advanced na gumagamit. Maaari mong ilapat ang punksyon para sa ilang mga haligi ng database at ihambing ito sa resulta ng [formula](../administration/formula.md) na pamamahayag.

Paalala: Kung kailangan mong ikumpara lang sa isang simpleng string na halaga ay dapat na ilagay ito sa iisang sipi na `'some string'`.

Note: Functions intended to interact with entity record will not work here because formule is not applied to specific record.

![Komplikadong pamamahayag ng pagsala](../_static/images/user-guide/reports/filter-complex.png)

### Meron na grupo

Ang meron na grupo ay magbibigay ng abilidad na magsala gamit ang aggregate na mga punksyon na COUNT, SUM, MAX, MIN, AVG.

Ilan sa mga ginagamit na mga kaso:

* Ilista ang mga account na magkakaroon ng higit sa isang pagkakataon. `COUNT / opportunities.id / Grater Than / 1`.
* Ipinapakita sa salaysay na Nakagrupo ayon sa industriya kung saan ang kita ay higit sa 1,000 ang grid report. `SUM / opportunities.amount / Greater Than / 1000`.

Paalala: Kompatibol sa bersiyon ng EspoCRM 5.1.0 at mas mataas.

## Pag-displey sa dashboard

Maaari mong Idispley ang anumang report sa dashboard. Para sa dito ay kailangan mo na idagdag ang dashlet ng ulat at pagkatapos ay pumili ng kinakailangang report sa dashlet na mga pagpipilian.

## Pagpapadala ng Koreo

Posible na ipagawa sa sistema na magpadala ng mga ulat ng mga resulta sa ilang mga gumagamit sa regular na batayan ayon sa tinakdang oras. Ito ay dapat na isinaayos para sa ilang mga ulat nang paisa-isa.

## Isini-sync sa Target list

Posible na magkaroon ng target list naka-sync na sa listahan ang mga resulta ng ulat.Mas maginhawa ang maramihang koero kapag gusto mong magpadala ng mga koreo sa mga kontak lamang na kayang tugunan ang ilang pamantayan sa sandali ng pagpapadala. Ang feature na ito ay makukuha sa view ng mga detalye ng anumang target list sa 'Sync sa report' panel.
