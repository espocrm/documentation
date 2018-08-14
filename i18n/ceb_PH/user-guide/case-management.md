# Pagdumala sa Kaso

Ang mga kaso naghatag og abilidad sa pagsubay sa isyu. Kini usa ka labing mahinungdanon nga aspeto sa pagserbisyo sa customer sa EspoCRM. Ang termino sa tiket mahimo usab nga gamiton alang sa Mga Kaso.

Ang entity sa mga kaso mahimong mahilambigit sa usa ka Account ug / o adunay daghang mga Contact.

Ang bag-ong mga kaso kinahanglan nga lihukon sa mosunod nga mga sitwasyon:

* Sa manual nga pamaagi sa mga tiggamit sa CRM;
* Sa manual nga pamaagi sa tiggamit sa customer portal;
* Pinaagi sa API (e.g. pinaagi sa web form);
* Awtomatiko sa diha nga ang usa ka bag-ong email miabut sa usa ka espesipiko nga mailbox.
* Awtomatiko gumikan sa lagda sa Workflow.

Ang rekord sa kaso adunay usa ka stream nga mahimong magamit alang sa komunikasyon tali sa kustomer ug serbisyo. Ang mga tiggamit sa CRM makahimo usab ug mga internal nga post nga dili makita sa usa ka customer portal. 

Sa diha nga ang bag-ong kaso gimugna sa usa ka tiggamit sa portal, dili na kini igahin sa bisan kinsa nga tiggamit. Pinaagi sa paggamit sa [Workflows](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) ang administrador makahimo og lagda nga mopahibalo sa pipila ka mga tiggamit mahitungod sa bag-ong kaso sa sistema. Ang mga Workflow naghatag usab ug abilidad sa pag-apply ug assignment rule sa mga bag-ong kaso, i.e. Round-Robin ug Least-Busy nga mga lagda. Alang sa mas komplikado nga mga business flow, kini girekomendar nga gamiton [BPM tool](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

Aron mapugngan nga di masal-angan mga bag-ong kaso, ang mga tiggamit makadugang ug klase sa Case entity ngadto sa listahan sa Global Auto-follow sa Preferences. Dayon kini awtomatikong mosunod sa matag bag-ong kaso.

Pahinumdum: Kon walay user sa portal nga nalingkit sa usa ka nalambigit nga kontak, ang customer dili makadawat ug pahibalo nga email kabahin sa mga update sa stream. Kinahanglan nga gamiton ang mga email para sa komunikasyon sa customer.

### Email-to-Case

Ang administrador maka-set up ug Group Email Account nga maghimo og bag-ong kaso sa matag bag-ong inbound email. Alang sa dugang impormasyon [tan-awa dinhi](https://github.com/espocrm/documentation/blob/master/administration/emails.md).

### Base sa Kahibalo

Ang mga tiggamit makasaysay sa base sa kahibalo sa mga artikulo sa rekord sa kaso.

### Portal sa Customer

Ang administrador makahimu ug usa ka [portal](https://github.com/espocrm/documentation/blob/master/administration/portal.md) diin ang mga kustomer makahimo sa pagmugna og mga kaso.

Tungod kay ang mga tiggamit sa portal awtomatikong mosunod sa ilang mga kaso, sila makadawat sa mga pagpahibalo sa email bahin sa mga bag-ong mensahe sa Stream.