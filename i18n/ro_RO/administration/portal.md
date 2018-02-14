# Portal

Portal oferă posibilitatea de a accesa date și funcții specifice pentru clienții și partenerii dumneavoastră. Administratorul poate crea mai multe portaluri. Fiecare portal are propriile setări, dashlboard, listă utilizator, setări acces control.

Pentru a creea un portal mergi la Administrare > Portaluri, apasă pe butonul Creează Portal.

* `Is Active`. Dacă nu este bifat, portalul nu o să fie disponibil pentru nimeni.
* `Is Default`. Înseamnă că portalul o să fie dispnibil pe url-ul scurt: http(s)://YOUR_ESPO_URL/portal.
* `Roles`. Specificați unul sau mai multe roluri portal care vor fi aplicate utilizatorilor autentificați în portal. Mai multe informații despre rolurile portalului sunt mai jos.
* `Tab List`. Filele care vor fi afișate în bara de navigare.
* `Dashboard Layout`. Specificați dashlet-urile care vor fi afișate pe pagina de pornire a portalului. Rețineți că utilizatorii portalului nu își pot configura tabloul de bord.
* `URL`. Citește numai câmpul care afișează link-ul cu care poți accesa portalul.

## Utilizatori Portal

Administratorii pot crea utilizatori portal.

1. Administrare > Utilizatori.
2. Apasă dreapta pe dropdown next pentru a creea Utilizator.
3. Apasă Creează Utilizator Portal.
4. Selectează Contactați utilizatorul portalului cu care va fi conectat.
5. Completați formularul și apasă pe Salvează.

Utilizatorul portalului ar trebui să fie legat de înregistrarea portalului pentru a putea accesa acel portal.

## Roluri Portal

Roluri Portal sunt similare cu rolurile obișnuite în EspoCRM cu câteva deosebiri.

* `not-set` nivel refuză un acces.
* `own` nivel înseamnă că înregistrarea a fost creată de utilizator. Ex. utilizatorulul portalului are un caz, iar acest caz este deținut de utilizator.
* `account` nivel înseamnă că înregistrarea este asemănătoare cu contul pe care utilizatorul portalului este asemănător.
* `contact` nivel înseamnă că înregistrarea este legată de utilizatorul portalului asemănătoare cu acesta.

Campurile alocate utilizatorilor și echipelor sunt citite numai pentru utilizatorii portalului.

### Exemplu

`Utilizatorii de portal ar trebui să poată crea cazuri, să vizualizeze cazuri legate de contul lor; ar trebui să poată vedea baza de cunoștințe.`

1. Deschide Rol Creează Portal din (Administrare > Roluri Portal > Creează Rol).
2. Activează accesul la Cazuri, setează: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. Activează accesul la Baza de cunoștințe, set `create - no, read - account, edit - no, delete - no`.
4. Editare înregistrare portal (Administrare > Portaluri). Selectează rolul portalului în fișierul Roluri și apoi salvează.

## Acces la Portal

Poți găsi url pentru portalul tău în cțmpul 'URL' al înregistrării portalului. De asemenea, este posibil să utilizați instrumentele de configurare a serverului (cum ar fi mod_rewrite) pentru a putea accesa url diferite. Pentru acest caz trebuie să completezi câmpul 'URL Personalizat'.

### Acces portal de URL Personalizat pentru server Apache

URL Personalizat: my-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName my-portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias my-portal-host-name.com

```

#### Mod rescrie reguli

Specifică ID-ul înregistrării portalului, în loc de `{PORTAL_ID}`. ID-ul înregistrării portalului este disponibil în bara de adrese atunci când deschizi vizualizarea detaliată a înregitrării portalului. Cum ar fi: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 este un id al înregistrării portalului.
```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
