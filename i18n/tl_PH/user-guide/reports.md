# Mga ulat

Ang tampok ng ulat ay makikita at makukuha sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

May dalawang uri ng ulat: List at Grid.  

## List na mga ulat

listahang pang-ulat ng mga resulta mula sa listahan ng mga talaan na kayang matugunan ang mga tinukoy na pamantayan.

Para lumikha ng listahang pang-ulat, i-click ang tab ng mga Ulat at i-click ang lumikha ng ulat na pindutan. Piliin ang kinakailangang tipo ng entidad at i-click ang Lumikha na pindutan at seksyon ng List Report.

Sa _Columns_ na patlang ay pumili ng mga patlang na gusto mong i-displey. Sa ibaba nito ay maaari mong tukuyin ang mga parameter ng displey para sa bawat hanay e.g. lapad at paghanay.

Piliin ang mga kinakailangan na mga pag-ayos sa  _List Order_ field. 

Sa _Filters_ na seksyon ay maaari mong tukuyin ang pamantayan na tumutukoy kung anong mga talaan ang maiilista sa iyong ulat. Maaari mong gamitin ang lohikal na na mga operator na 'OR' at 'AND' dito.

Ang _Runtime Filters_ ay nagbibigay-daan sa iyo upang tukuyin ang iba't ibang mga pagsasala bago mo patakbuhin ang iyong ulat.

pwede mong i-export ang listahan ng mga reulta ng iyong ulat sa excel at csv na mga format.

## Ang mga ulat na grid

ang resulta ng mga ulat na grid ay nagbubuod ng mga halaga na nakagrupo batay sa tukoy na larangan. Ang mga ulat na ito ay pwedeng i-displey bilang isang tsart .

![Mga ulat na grid](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/grid.png)

Para gumawa ng bogaong ulat na grid ay i-klik ang tab ng mga ulat at pagkatapos ay i-klik ang Gumawa ng bagong ulat na button. Piliin ang kakailanganing tukoy na entidad at pagkatapos ay i-klik ang Gumawa na button at seksyon ng ulat na grid.

Ang _Group By_ na na patlang ay pwede kang pumili ng isa o dalawa na mga patlang na gusto mo na makita sa datos ng iyong report na nakagrupo. posibleng igrupo ayon sa taon, buwan, at araw sa mga patlang ng panahon. Kung binuo mo ayon sa dalawang larangan ang iyong report ay ituturing ito bilang three-dimensional.

Sa _Columns_ na patlang ay pumili ng isa o dalawang aggregate na mga punksiyon kagaya ng  COUNT, SUM (summation), MIN, MAX, AVG (average).

Ang _Order by_ na patlang ay naglalarawan kung paano ang datos na ulat ay pinagsunod-sunod.

Sa _Filters_ na seksyon ay maaari kang tumukoy ng gagamitin na batayan na tutukoy sa kung ano ang nakatala sa iyong report. Pwede kang gumamit ng lohikal na operators kagaya ng 'OR' at 'AND' dito.

Ang _Runtime Filters_ ay nagpapahintulot sa iyo na tukuyin ang iba't ibang mga pagsala bago ka maubusan ng ulat

Ang ulat na grid ay nagpapahintulot sa iyo na i-displey ang mga resulta sa paraan ng tsart. Mayroong following _chart types_: Bar (Horizontal), Bar (Vertical), Pie, at Line.

Posibleng i-export ang mga resulta ng ulat na grid sa excel at csv na mga format.

## Mga Pagsala

### Patlang ng pagsala

Simpleng gamitin ang mga tipo ng mga pagsala. Maari mo din na piliin ang mga larangan na target na entidad pati na rin ang mga kaugnay na  mga entidad.

![Pagsala ng patlang](../_static/images/user-guide/reports/filter-field.png)


### OR na grupo

Ang OR ay nangangahulugan na hindi dapat bababa sa isang kalagayan sa ilalim ng grupo ang dapat matugunan.

![OR group](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-or.png)

### AND na grupo

Ang AND ay nangangahulugan na lahat dapat na kalagayan sa ilalim ng grupo ang dapat matugunan.

### NOT na grupo

Nagbibigay ng kakayahan na isala ang mga talaan na di kayang matugunan ang mga tinukoy na pamantayan. E.g. Paglilista ng mga account na wala ni anumang pagkakataon na saradong panalo o saradong talo na katayuan.

![NOT group](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-not.png)

### Komplikadong Pagpapahayag

Para sa mas mga advanced na gumagamit. Maaari mong ilapat ang punksyon para sa ilang mga haligi ng database at ihambing ito sa resulta ng [formula](../administration/formula.md) na pamamahayag.

Paalala: Kung kailangan mong ikumpara lang sa isang simpleng string na halaga ay dapat na ilagay ito sa iisang quote na `'some string'`.

Paalala: Ang mga punksyon na nilayon upang makipag-ugnayan sa talaaan ng entidad ay hindi gagana dito dahil ang formula ay hindi nailapat sa tiyak na talaaan.

![Komplikadong pamamahayag ng pagsala](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-complex.png)

### Meron na grupo

Ang meron na grupo ay magbibigay ng abilidad na magsala gamit ang aggregate na mga punksyon na COUNT, SUM, MAX, MIN, at AVG.

Ilan sa mga ginagamit na mga kaso:

* Ilista ang mga account na magkakaroon ng higit sa isang pagkakataon. `COUNT / opportunities.id / Grater Than / 1`.
* Ipinapakita sa salaysay na Nakagrupo ayon sa industriya kung saan ang kita ay higit sa 1,000 ang ulat na grid. `SUM / opportunities.amount / Greater Than / 1000`.

Paalala: Kompatibol sa bersiyon ng EspoCRM 5.1.0 at mas mataas.

## Pag-displey sa dashboard

Maaari mong i-displey ang anumang ulat sa dashboard. Para dito ay kailangan mo na idagdag ang dashlet ng ulat at pagkatapos ay pumili ng kinakailangang ulat sa dashlet na mga pagpipilian.

## Pagpapadala ng Koreo

May posibilidad na ipagawa sa sistema na magpadala ng mga ulat ng mga resulta sa ilang mga gumagamit sa regular na batayan ayon sa tinakdang oras. Ito ay dapat na isinaayos para sa ilang mga ulat na paisa-isa.

## Isini-sync sa Target list

May posibilidad na magkaroon ng listahan ng mga target na naka-sync sa listahan ng mga resulta ng ulat. Mas maginhawa ang maramihang koreo kapag gusto mong magpadala ng mga koreo sa mga kontak lamang na kayang tugunan ang ilang pamantayan sa sandali ng pagpapadala. Ang tampok na ito ay makukuha sa view na mga detalye ng anumang listahan ng target sa 'Sync sa report' na panel.
