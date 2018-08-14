
# Portale

Portale fornisce una capacità di accesso a specifici dati CRM e funzioni per i vostri clienti e partner. L'amministratore può creare più portali. Ogni portale può avere le proprie impostazioni, dashlboard, elenco utenti e le impostazioni di controllo degli accessi.

Per creare il portale seguire Administration > Portali, fare clic su Crea pulsante Portale.

* 'Attivo'. In caso contrario controllare il portale non sarà disponibile per chiunque.
* 'È predefinito'. Significa che il portale sarà disponibile entro breve url: http(s)://la_vostra_ESPO_URL/portale.
* 'Ruoli'. Specificare uno o più ruoli del portale che verrà applicato agli utenti registrati nel portale. Ulteriori informazioni sui ruoli del portale è riportato di seguito.
* 'Tab elenco'. Le linguette che verrà mostrato nella barra di navigazione.
* 'Dashboard Layout'. Specificare dashlets che verrà visualizzato sulla home page del portale. Notare che gli utenti del portale non è in grado di configurare il proprio cruscotto.
* 'URL'. Campo di sola lettura che visualizza il link è possibile accedere al portale con l.

## Gli utenti del Portale

gli amministratori possono creare gli utenti del portale.

1. Amministrazione > Utenti.
2. Fai clic con il pulsante destro menu a discesa accanto a creare l'utente.
3. Fare clic su Crea utente del portale.
4. Selezionare il contatto al portale utente sarà legata a.
5. Compilare il modulo e fare clic su Salva.

Utente del portale deve essere legata al record del portale per essere in grado di accedere a questo portale.

## Portale

portale ruoli i ruoli sono simili ai ruoli regolari in EspoCRM ma con alcune distinzioni.

* 'Non-set' livello nega accesso..
* 'Propria' livello significa che il record viene creato dall'utente. Ad esempio utente portale incassato qualche caso e in questo caso è di proprietà di questo utente.
* 'Account' livello significa che il record è relativo al conto dell'utente del portale è correlato a.
* 'Contatto' livello significa che il record è relativo al contatto il portale utente è correlato a.

Utente assegnato i team e i campi sono di sola lettura per gli utenti del portale.

### Esempio

"Portale gli utenti dovrebbero essere in grado di creare casi, visualizzare i casi relativi al loro account; essi dovrebbero essere in grado di visualizzare la base della conoscenza."

1. Aprire Crea ruolo Portale forma (Amministrazione > Portale ruoli > Crea ruolo).
2. Abilitare l'accesso ai casi, impostare: "creare - sì, leggere - account, modifica - no, eliminare - no, stream - account'.
3. Consentono di accedere alla Knowledge Base, impostare 'crea - no, leggere - account, modifica - no, eliminare - no'.
4. Modificare il record del portale (Amministrazione > Portali). Seleziona il tuo portale ruolo nel campo dei ruoli e quindi salvare.
# Accesso al portale

potrete trovare l'url per il tuo portale in 'URL' campo del record del portale. Inoltre è possibile utilizzare gli strumenti di configurazione del server (tali mod_rewrite) per essere in grado di accedere da diversi url. In questo caso è necessario riempire in 'URL personalizzato' campo.

### Il portale di accesso tramite URL personalizzato per il server Apache

URL personalizzato: my-portal-host-name.com.

#### Crm.portal.conf
'''
<VirtualHost *:80>
DocumentRoot /percorso/al/espocrm/esempio/
ServerName my-portal-host-name.com

<Directory /percorso/di/espocrm/esempio/>
Options Indexes FollowSymLinks
AllowOverride tutti
per consentire,negare
lasciare da tutti
</Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combinati
</VirtualHost>

ServerAlias my-portal-host-name.com

'''

#### mod rewrite regole

specificano portal ID record invece di '{PORTAL_ID}'. Record del portale ID può è disponibile nella barra degli indirizzi del browser web quando si apre la vista dettagli del record del portale. Come: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9HM41C069e6j24 è un record del portale id.

'''
RewriteCond %{HTTP_HOST} ^portal-host-name.com$
RewriteRule ^client - [L]

RewriteCond %{HTTP_HOST} ^portal-host-name.com$
RewriteCond %{REQUEST_URI} !^/portale/{PORTAL_ID}/.*$
RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]