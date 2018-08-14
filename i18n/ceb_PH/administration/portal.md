# Portal

Ang portal kay muhatag og abilidad nga mu-access sa ispisipiko nga crm data ug mga function para sa inyohang mga kustomer og partner. Ang administrador kay makahimo og nagkalain-laing mga portal. Ang kada usa ka portal kay mamahimong manag-iya ug iyahang kaugalingong mga setting, dashboard, lista sa user, ug mga access kontrol nga setting.

Para muhimo og portal sunda ang Administration > Portals, i-click ang Create Portal nga pindutanan.

* `Is Active`. Kung wala na-check, ang portal kay dili magamit sa bisan kinsa.
* `Is Default`. Nagpasabot nga ang portal kay mamahimong mas mubo pa nga url: http(s)://YOUR_ESPO_URL/portal.
* `Roles`. I-specify ang usa o mas daghan pa nga mga portal role nga i-apply ngadto sa mga user nga naka-log sa imohang portal.
* `Tab List`. Mga tab nga ipakita sa navigation bar.
* `Dashboard Layout`. I-specify ang mga dashlet nga ipakita sa home page sa portal. Timan-e nga ang mga portal user kay dili ka-configure sa ilahang dashboard.
* `URL`. Read only field nga mupakita sa link kung asa maka-access ka sa portal.

## Mga Portal User

Ang mga administrador kay makahimo og mga portal user.

1. Administration > Users.
2. I-click ang tuo nga dropdown sunod sa Create User.
3. I-click ang Create Portal User.
4. Ipili ang Contact nga maoy i-link sa portal user.
5. Pun-a ang form og i-click ang save.

Ang portal user kay gikinahanglan i-link sa Portal nga rekord para maka-access sa kadto nga portal.

## Mga Portal Role

Ang mga portal role kay parehas ra sa regular nga mga role sa EspoCRM pero naay mga gagmay nga kalahian.

* `not-set` level nga mu-dili mutugot og access.
* `own` level kay nagpasabot nga ang rekord kay gihimo sa user. E.g. ang portal user kay ni-case sa ubang case ug ang kani nga case kay gitag-iya sa kani nga user.
* `account` level nga nagpasabot nga ang rekord kay naay relasyon sa account nga ang portal user kay naa puy relasyon.
* `contact` level nga nagpasabot nga ang rekord kay naay relasyon sa contact nga ang portal user kay naa puy relasyon.

Ang Assigned User ug ang Teams fields kay read-only ra para sa mga portal user.

### Example

`Ang mga portal user kay gikinahanglan muhimo og mga case, mutan-aw sa mga case nga naay relasyon sa ilahang account; gikinahanglan sila nga mutan-aw sa knowledge base.`

1. Abili sa Create Portal Role nga form (Administration > Portal Roles > Create Role).
2. I-enable ang access sa mga Case, i-set ang: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. I-enable ang access sa Knowledge Base, i-set ang: `create - no, read - account, edit - no, delete - no`.
4. I-edit ang imohang portal nga rekord (Administration > Portals). Pilia imohang portal role sa Roles field ug i-save.

## Access sa Portal

Pwede nimong makit-an ang url para sa portal sa 'URL' field sa portal record. Posible usab mugamit ug mga serve configuration tool (parehas sa mod_rewrite) para ma access ang lahi nga url. Para sa in-ani nga kaso, gikinahanglan nimo i-fill ang 'Custom URL' nga field.

### I-access ang portal gamit ang Custom URL para sa Apache server

Custom nga URL: akoang-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName akoang-portal-host-name.com

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

#### Mga Mod rewrite na balaod

I-specify ang portal record ID kaysa sa `{PORTAL_ID}`. Ang portal record ID kay naa makit-an sa address bar sa imohang web browser kung imohang ablihan ang detail view sa imohang portal record. Parehas sa: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. Ang 16b9hm41c069e6j24 kay usa ka portal record id.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
