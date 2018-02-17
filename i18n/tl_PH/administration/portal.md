# Ang Portal

Ang portal ay nagbibigay kakayahan na ma-access ang partikular na crm data at mga tungkulin para sa iyong mga kostomer at kasosyo. Ang administrador ay maaaring lumikha ng maramihang portal. Ang bawat portal ay maaaring magkaroon nga sarili nitong mga setting, dashboard, listahan ng user, mga access control setting.

Upang lumikha ng portal ay sundin ang Administration > Portals, i-click ang buton ng Create Portal.

* `Is Active`. Kung hindi naka-check, ang portal ay hindi magagamit ng kahit na sino.
* `Is Default`. Nangangahulugang ang portal ay magagamit sa pamamagitan ng mas maikling url: http(s)://YOUR_ESPO_URL/portal.
* `Roles`. Tumutukoy ng isa o maramihang mga tungkulin ng portal na ina-apply sa mga user na naka-log in sa portal. Karagdagang impormasyon tungkol sa mga tungkulin ng portal ay nasa ibaba.
* `Tab List`. Ang mga tab na ipapakita sa navigation bar.
* `Dashboard Layout`. Tumutukoy ng mga dashlet na idi-display sa home page ng portal. Tandaan na ang mga user ng portal ay hindi maaaring mag-configure ng kanilang dashboard.
* `URL`. Read only field na nagdi-display ng link na maaari mong ma-access gamit ang portal.

## Mga User ng Portal

Ang mga administrador ay maaaring lumikha nga mga user ng portal.

1. Administrasyon > Mga User.
2. I-click ang dropdown sa kanan malapit sa Create User.
3. I-click ang Create Portal User.
4. Piliin ang contact na uugnayan ng portal user.
5. Punan ang form at i-click ang save.

Ang portal user ay dapat nakaugnay sa Portal record upang ma-access ang portal na iyon.

## Mga Tungkulin ng Portal

Ang mga tungkulin ng portal ay katulad ng regular na mga tungkulin sa EspoCRM ngunit may ilang mga pagkakaiba.

* `not-set` lebel ay tumatanggi ng isang access.
* `own` lebel ay nangangahulugang ang rekord ay nilikha ng user. E.g. ang portal user ay nag-case ng ilang mga kaso at ang kaso na ito ay pag-aari ng user.
* `account` lebel ay nangangahulugang ang rekord ay nakaugnay sa account na may kaugnayan sa portal user.
* `contact` lebel ay nangangahulugang ang rekord ay nakaugnay sa kontact na may kaugnayan sa portal user.

Ang Assigned User at mga Teams field ay read only para sa mga portal user.

### Halimbawa

`Ang mga user ng portal ay dapat makagawa ng mga kaso, tingnan ang mga kaso na may kaugnayan sa kanilang mga account; dapat din nilang makita ang knowledge base.`

1. Buksan ang form ng Create Portal Role (Administrasyon > mga tungkulin ng Portal > Create Role).
2. I-enable ang access sa mga kaso, i-set ang: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. I-enable ang access sa Knowledge Base, i-set ang `create - no, read - account, edit - no, delete - no`.
4. I-edit ang rekord ng iyong portal (Administration > mga Portal). Piliin ang mga tungkulin ng iyong portal sa Roles field at pagkatapos ay i-save.

## Ang Access sa Portal

Maaari mong makita ang url para sa iyong portal sa field ng 'URL' ng rekord ng portal. Posible ding gamitin ang mga tool ng server configuration (gaya ng mod_rewrite) upang ma-access ng ibang url. Para sa kasong ito ay kailangan mong punan ang field ng 'Custom URL'.

### Ang Pag-access ng portal sa Pamamagitan ng Custom URL para sa Server ng Apache

Custom na URL: my-portal-host-name.com.

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

#### Mga Patakaran ng Mod rewrite

Tukuyin ang portal record ID sa halip ng `{PORTAL_ID}`. Ang Portal record ID ay makikita sa address bar ng iyong web browser kapag binuksan mo ang detail view ng rekord ng iyong portal. Gaya ng: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 ay isang portal record id.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
