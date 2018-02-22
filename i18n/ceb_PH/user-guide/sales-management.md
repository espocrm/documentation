# Pagdumala sa Pagpamaligya

## Mga Lead

Ang lead nagrepresentar sa usa ka tawo o usa ka organisasyon nga dili pa usa ka kostumer sa pagkakaron, apan adunay potensyal nga mahimong usa. Ang pagmugna og usa ka lead record kasagaran mao ang unang lakang sa proseso sa pagbaligya. Samtang ang dugang nga kasayuran mahitungod sa lead kay gitigum, gituuhan nga ang lead makabig isip usa ka account, contact ug oportunidad.

Ang mga bag-ong lead kinahanglan nga lihukon sa mosunod nga mga sitwasyon:

* Sa manual nga pamaagi sa mga tiggamit sa CRM;
* Pinaagi sa API (e.g. pinaagi sa web form);
* Awtomatiko gumikan sa lagda sa Workflow.

Pinaagi sa paggamit sa [Workflows](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) ang administrador mamahimong maka-set up sa sistema para maka-apply ug espesipikong assignment rule sa mga bag.o nga lead, i.e. Round-Robin ug Least-Busy nga mga lagda. Alang sa mas komplikadong mga business flow, girekomendar kini nga gamiton [BPM tool](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

Aron mapugngan nga di masal-angan mga bag-ong lead, ang mga tiggamit makadugang ug klase sa Lead entity ngadto sa listahan sa Global Auto-follow sa Preferences. Dayon kini awtomatikong mosunod sa matag bag-ong kaso. 

## Mga Oportunidad

Ang oportunidad nagrepresentar sa usa ka potensyal o sirado nga deal. Ang oportunidad nga adunay 'Closed Won' nga yugto giisip nga alang sa pagkalkula sa kita sa pagbaligya.

Ang mga mosunod nga mga hugna mabatunan pinaagi sa default:

* Pagpangita;
* Kwalipikasyon;
* Proposal;
* Negosasyon;
* Closed Won;
* Closed Lost.

Ang administrador makatakda ug mga kostumbre nga mga yugto depende sa business flow sa kompanya. Apan wala kini girekomendar nga kuhaon ang 'Closed Won' nga yugto tungod kay kini gigamit sa pagkalkulo sa usa ka kita.

## Sales analytics

Ang mosunod nga mga tsart anaa sa dashboard pinaagi sa default:

* Sales sa Bulan;
* Mga Oportunidad gumikan sa Lead Source;
* Mga Oportunidad gumikan sa yugto;
* Sales Pipeline.

Pinaagi sa paggamit sa [Reports tool](https://github.com/espocrm/documentation/blob/master/user-guide/reports.md) posible nga makita ang mga istatistika sa pagpamaligya nga gibase sa espesipiko nga criteria. Ang tsart sa mga report mahimong ipakita sa dashboard.

### Forecast sa Kita

1. Paghimo og bag-ong grid report alang sa Opportunity entity type.
2. Idugang ang 'MONTH: Close Date' sa Group By field. 
3. Idugang ang 'SUM: Amount Weighted' sa Columns field.
4. Idguang ang 'Close Date' sa Runtime Filters field.
5. Pilia ang 'Bar (vertical)' nga matang sa tsart.

Kini nga report magpakita sa mga forecast sa kita nga gibase sa mga kalagimitan sa mga oportunidad.

Ang mga tiggamit nga adunay access niini nga report makahimo sa pagdugang niini sa ilang mga dashboard.
