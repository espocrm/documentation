# Mga Report

Ang Reports nga feature kay naa makit-an sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Naay duha ka tipo sa mga report: List ug Grid.  

## Mga List Report

Ang list report muresulta sa lista sa mga rekord nga nasugat ang mga gitakda nga mga kriterya.

Para ug muhimo og bag-o nga list report, i-click ang Reports nga tab ug i-click ang Create Report nga pindutanan. Pilia ang gikinahanglan nga Entity Type dayon i-click ang Create nga pindutanan sa List Report.

Sa _Columns_ nga field, pagpili og mga field nga gusto nimong ipadisplay. Sa ubos, pwede kang mutakda ug mga display nga parametro para sa kada usa ka column e.g. hilapdon ug align.

Pilia ang gikinahanglang paghan-ay sa _List Order_ nga field.

Sa _Filters_ nga seksiyon pwede nimong itakda ang kriterya nga mudetermina kung unsa nga rekord ang malista sa imohang report. Pwede ka mugamit og lohikal nga mga operator parehas sa 'OR' ug 'AND' dinhi.

Ang mga _Runtime Filters_ mutugot nga mutakda ka og bisan unsang filter sa dili pa ipadagan nimo ang report.

Pwede kang mu - __export__ sa list report results ngadto sa excel ug csv nga mga format.

## Mga Grid Report

Ang grid reports result muhata ug sumaryo sa mga balor nga gigrupo pinaagi sa mga gitakda nga mga field. Ang kaning mga report kay pwede idisplay isip usa ka chart.

![Mga grid report](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/grid.png)

Para muhimo og bag-o nga grid report, i-click ang Reports nga tab ug dayon i-click ang Create Report nga pindutanan. Pilia ang gikinahanglan nga Entity Type dayon i-click ang Create nga pindutanan sa Grid Report.

Sa _Group By_ field, pili ug usa o duha ka mga field nga gusto nimong mag-grupo sa imohang datos. Posible pud nga mag-grupo base sa tuig, buwan, adlaw para sa mga date field.

Sa _Columns_ nga field, pili og usa o mas daghan pa nga mga aggregate ng punsyon parehas sa COUNT, SUM (sumasyon), MIN, MAX, AVG (average).

Ang _Order by_ field muset kung unsaon paghan-ay sa mga report nga datos.

Sa _Filters_ nga seksyon, makatukma ka ug kriterya nga mudetermina kung unsa nga mga rekord ang gamiton para sa imohang report. Pwede kang mugamit sa mga lohikal nga mga operator parehas sa 'OR' ug 'AND'.

Ang _Runtime Filters_ mutugot nga mutukma ka og nagkalainlaing mga filter sa dili pa nimo ipadagan ang report.

It's possible to __export__ grid report results to excel and csv formats.
Posible usab nga mu __export__ ug mga grid report nga resulta ngadto sa excel ug csv nga mga format.

## Mga Filter

### Field filter

Sayon gamiton nga tipo sa mga filter. Pwede sad ka mupili og mga field sa gitarget nga entity ug usab mga naay kalabotan nga mga entity.

![Field filter](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-field.png)

### OR na grupo

Ang OR nagpasabot nga dili mu menos usa ka kondisyon ubos sa grupo ang gikinahanglan nga maabot.

![OR na grupo](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-or.png)

### AND na grupo

Ang AND nagpasabot nga ang tanan kondisyon ubos sa grupo gikinahanglang maabot.

### NOT nga grupo

Naghatag og abilidad nga mufilter sa mga rekord nga wala nakaabot sa gitakda nga mga kriterya. E.g. paglista sa mga account nga walay opportunidad nga naay Closed Won o Closed Lost nga estado.

![NOT nga grupo](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-not.png)

### Komplikado nga Ekspresyon

Para sa mas abanse pa nga paggamit. Pwede nimong gamiton ang usa ka punsyon para sa database column og ikompara ni sa resulta sa [pormula](../administration/formula.md) nga ekspresyon.

Timan-e: Kug gikinahanglan nimo mukompara og simple nga string nga balor, gikinahanglan nimo ibutang ngadto sa nag-inusara nga mga quote `'bisan unsa nga string'`.

Timan-e: Ang mga punsyon nga gitakda nga makig-istorya sa mga entity rekord kay dili mugana diri kay ang pormula wala giapply sa espisipiko nga rekord.

![Complex Expression filter](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-complex.png)

### Having na grupo

Ang having nga grupo kay muhatag og abilidad nga mufilter gamit ang mga aggregate nga punsyon sama sa COUNT, SUM, MAX, MIN, og AVG.

Mga lain nga kaso:

* Mga list account nga naay labaw pa sa usa ka oportunidad. `COUNT / opportunities.id / Grater Than / 1`.
* Ang grid report nga mupakita sa mga account nga gigrupo ngadto sa industry kung asa ang halin kay mas dako pa sa 1,000. `SUM / opportunities.amount / Greater Than / 1000`.

Timan-e: Kompatibol sa EspoCRM bersiyon 5.1.0 ug mas labaw pa.

## Pagpadisplay sa dashboard

Pwede ka mudisplay sa bisan unsang report sa dashboard. Para ani, gikinahanglan ka mupuno og Report dashlet ug pili sa gikinahanglan nga report sa dashlet nga opsyon.

## Pagpadala og email

Posible nga himoon ang sistema nga mupadala og report nga resulta ngadto sa mga user sa regular nga panahon basi sa gitakda nga oras. Gikinahanglan ni makonpigyur para sa tagsa tagsang mga report.

## Pagsyn sa mga Target List

Posible nga ang mga target list kay masync sa mga list report result. Hayahay kini para sa dinaghang email kung gusto nimo mupadala ug mga email ngadto ra sa mga kontak nga nakaabot sa kriterya nianang orasa sa pagpadala. Ang kani nga feature kay makit-an sa detail view sa bisan unsa nga target list sa 'Sync with Reports' nga panel.

