# Portal

Portal omogoča možnost, da dostopate do določenih crm podatkov in funkcij za vaše stranke in partnerje. Administrator lahko ustvari več portalov. Vsak portal ima lahko svoje nastavitve, nadzorno ploščo, seznam uporabnikov, nastavitve nadzora dostopa.

Za ustvaritev portala pojdite na Administracija > Portali, kliknite gumb Ustvari portal.

* `Je aktiven`. Če ni označen, potem portal ne bo na voljo nikomur.
* `Je privzet`. Pomeni, da bo portal na voljo po krajšem url-ju: http(s)://VAS_ESPO_URL/portal.
* `Vloge`. Določite eno ali več vlog na portalu, ki bodo dodeljene uporabnikom, prijavljenim v portal. Več informacij glede vlog na portalu najdete spodaj.
* `Seznam zavihkov`. Zavihki, ki bodo vidni v navigacijski vrstici.
* `Postavitev nadzorne plošče`. Določite elemente, ki bodo prikazani na domači strani portala. Upoštevajte, da uporabniki portala ne morejo konfigurirati svoje nadzorne plošče.
* `URL`. Samo bralno polje, ki vsebuje povezavo, s katero lahko dostopate do portala.

## Uporabniki portala

Administratorji lahko ustvarijo uporabnike portala.

1. Administracija > Uporabniki.
2. Kliknite desni padajoči meni poleg Ustvari uporabnika.
3. Kliknite na Ustvari uporabnika portala.
4. Izberite Kontakt, s katerim bo uporabnik povezan.
5. Izpolnite obrazen in kliknite Shrani.

Uporabnik portala bi moral biti povezan z zapisom portala, da bi lahko dostopal do njega.

## Vloge na portalu

Vloge na portalu so podobne običajnim vlogam v EspoCRM, toda z nekaj razlikami.

* Stopnja `ni določen` onemogoča dostop.
* Stopnja `lasten` pomeni, da je uporabnik tisti, ki ustvari zapis. Na primer, uporabnik portala je odprl nek primer in ta uporabnik je zdaj lastnik tega primera.
* Stopnja `račun` pomeni, da je zapis povezan z računom, s katerim je uporabnik portala povezan.
* Stopnja `kontakt` pomeni, da je zapis povezan z zapisom, s katerim je uporabnik portala povezan.

Polji Dodeljen uporabnik in Timi lahko uporabniki portala zgolj berejo.

### Primer

`Uporabniki portala naj bi imeli možnost ustvarjati primere, videti primere, ki so povezani z njihovim računom; imeli naj bi tudi možnost videti bazo znanja.`

1. Odprite obrazec Ustvari vlogo na portalu (Administracija > Vloge na portalu > Ustvari vlogo).
2. Omogočite dostop do Primerov, nastavite: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. Omogočite dostop do Baze podatkov, nastavite `create - no, read - account, edit - no, delete - no`.
4. Uredite svoj zapis portala (Administracija > Portali). Izberite svojo vlogo na portalu v polju Vloge in nato shranite.

## Dostop do portala

Url za vaš portal lahko najdete v polju 'URL' v zapisu portala. Prav tako je možno uporabiti orodja za konfiguracijo strežnika (kot je mod_rewrite), da bi do portala lahko dostopali z drugačnim url-jem. Za ta primer morate izpolniti polje 'URL po meri'.

### Dostop do portala z URL-jem po meri za Apache strežnik

URL po meri: ime-gostitelja-mojega-portala.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /pot/do/espocrm/
	ServerName ime-gostitelja-mojega-portala.com

    <Directory /pot/do/espocrm/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias ime-gostitelja-mojega-portala.com

```

#### Mod rewrite pravila

Določite številko zapisa portala namesto `{PORTAL_ID}`. Številka zapisa portala je na voljo v naslovni vrstici vašega brskalnika, ko odprete podrobnostni pogled zapisa portala. Primer: https://moj-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 je številka zapisa portala.

```
  RewriteCond %{HTTP_HOST} ^ime-gostitelja-postala.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^ime-gostitelja-postala.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
