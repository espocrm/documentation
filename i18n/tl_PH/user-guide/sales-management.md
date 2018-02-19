# Pamamahala ng mga nabenta

## Mga Lead

Ang lead ay nagrerepresenta ng isa tao o isang organisasyon na sa kasalukuyan ay hindi isang mamimili, pero may potensyal na maging mamimili. Sa paglilikha ng isang talaan ng lead ay karaniwang unang hakbang sa proseso ng pagbenta. Habang dumadami ang impormasyon na nakakalap ukol sa Lead, pwedeng mangyari na ang lead ay magiging isang account, contact at opurtunity.

ang mga bagong lead ay dapat nilikha sa pamamagitan ng sumusunod na mga sitwasyon:

* Nang manu-mano sa pamamagitan ng mga gumagamit ng CRM;
* Sa pamamagitan ng API (e.g. sa pamamagitan ng mga for ng web);
* Awtomatiko sa pamamagitan ng isang patakaran sa daloy ng trabaho.

Sa pamamagitan ng pagamit ng [Mga daloy ng trabaho](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) ang mga namumuno ay may kayang maset-up ang sistema at mag-aplay ng isang patakaran ng partikular na tungkulin sa mga bagong leads, i.e. Round-Robin at Least-Busy na mga tungkulin. Para sa mga mas kumplikadong daloy ng negosyo nirerekomendang gumamit ng [BPM tool](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

Para maiwasan ang sobrang pagtingin sa mga bagong lead. Ang mga gumagamit ay pwede magdagdag ng mga Lead na tipo ng entidad sa Global Auto-follow na listahan at mga preperensiya. Pagkatapos ay awtomatik nilang susundan ang bawat lead na bago. 

## Mga Opurtunity

Ang opportunity ay nagrerepresenta ng mga potensiyal oh saradong kalakaran. Ang mga opportunity na nasa istage ng 'Saradong Panalo' ay tinatandaan para sa pagkalkula ng mga kita ng pagbenta. 

Ang mga sumusunod na yugto ay makukuha sa pamamagitan ng default:

* Pagmamanupaktura;
* Kwalipikasyon;
* Panukala;
* Negosasyon;
* Saradong panalo;
* Saradong talo.

Maitatakda ng tagapangasiwa ang mga pasadyang yugto depende sa daloy ng negosyo ng kumpanya. Ngunit ito ay hindi inirerekomenda na alisin ang 'Saradong panalo' na yugto dahil ito ay ginagamit para kalkulahin ang isang kita.

## Analitiks sa mga benta

Ang sumusunod na tsart ay makukuha sa dashboard bilang default:

* Mga benta na naka-ayos ayon sa buwan;
* Mga opportunity na nakaayos ayon sa Lead Source;
* Mga opportunity na nakaayos ayon sa yugto;
* Pipeline ng mga pagbenta.

Sa paggamit ng [Kagamitang pang-tala](https://github.com/espocrm/documentation/blob/master/user-guide/reports.md) Posibleng matingnan ang Istatistika ng mga benta na batay sa mga tiyak na pamantayan. Ang mga tsart ng mga ulat ay maaaring maipakita sa dashboard.

### Ulat ng mga kita

1. Lumikha ng isang bagong ulat ng grid para sa tipo ng entidad ng pagkakataon.
2. Magdagdag ng ' buwan: malapit na petsa ' sa grupo sa patlang. 
3. Magdagdag ng ' SUM: halaga Weighted' sa patlang ng kolum.
4. Magdagdag ng mga 'Malapit petsa' sa patlang ng oras ng takbo ng salaan.
5. i-select ang'Bar (vertical)' na tipo ng tsart.

Ang ulat na ito ay magpapakita sa ulat ng kita batay sa mga probabilidad ng pagkakataon.

Pwedeng idagdag ng mga gumagamit ang ulat na ito sa kanilang mga dashboard kung sila ay may akses dito
