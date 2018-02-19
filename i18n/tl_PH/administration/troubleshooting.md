# Pag-troubleshoot

## Ang Pag-check ng mga log

Upang malaman ang problema, kailangan mong suriin ang mga error ng log file.

#### Mga log ng EspoCRM na mga Error

Ang mga EspoCRM log ay matatagpuan sa `<ESPOCRM_DIRECTORY>/logs/*.log` at naglalaman ng ilang mga impormasyon ng error.

#### Mga log ng Apache na mga Error

Para sa Ubuntu serber, ang isang log ng apache error ay matatagpuan sa `/var/log/apache2/error.log` at naglalaman ng lahat ng impormasyon ng error. Ang lokasyon ng mga log file ay maaaring hindi magkapareho sa iba pang mga system.

## Pag-enable ng debugging mode

Upang i-enable ang debugging mode, pumunta sa mga naka-install na direktorya ng EspoCRM, buksan ang file `data/config.php` at baguhin ang value:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
to
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Ang mga Naka-iskedyul na Gawain ay Hindi Gumagana

#### Unang Problema: Ang iyong crontab ay hindi na-configure

1. Mag-login sa pamamagitan ng SSH sa iyong serber.

2. I-configure ang iyong crontab sa pamamagitan ng sumusunod na mga step: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Tandaan: Ang Crontab ay dapat i-configure sa ilalim ng user ng web-server, e.g. `crontab -e -u www-data`.

3. Maghintay ng ilang sandali at i-check ang mga naka-iskedyul na gawain upang makita kung ang anumang mga gawain ay naisakatuparan (tingnan ang Log panel).

#### Pangalawang Problema. Ang Crontab ay naka-configure, pero ang mga naka-iskedyul na mga gawain ay hindi gumagana

Upang masiguro na walang mga error kapag tumatakbo ang cron, subukang patakbuhin ang cron command sa isang terminal:

1. Mag-login sa pamamagitan ng SSH sa iyong serber.

2. Pumunta sa direktoryo kung saan naka-install ang EspoCRM. E.g. para sa `/var/www/html/espocrm` na direktoryo, ang command ay:

```bash
cd /var/www/html/espocrm
```

3. Patakkbuhin ang crontab command:

```bash
php cron.php
```

Tandaan: Ito ay dapat isinasagawa sa ilalim ng user ng web-server. Kung ikaw ay naka-login bilang root, ang command ay dapat na (e.g para sa Ubuntu):

```bash
sudo -u www-data php cron.php
```

kung saang ang `www-data` ay isang user ng web-server.

4. Kung walang mga error, i-check ang mga naka-iskedyul na gawain upang makita kung ang anumang gawain ay naisakatuparan. (tingnan ang Log panel).

## Ang EspoCRM ay hindi naglo-load pagkatapos mag-upgrade

Ito ay maaaring mangyari minsan sa ilang mga shared hosting.

I-check ang mga permiso ng mga file:
/index.php
/api/v1/index.php

Dapat silang 644. Kung alinman sa mga file na iyon ang may permiso na 664, kailangan mong baguhin ito sa 644. Gamitin ang control panel o chmod command ng iyong hosting.

```
chmod 644 /path/to/file
```
Karagdagang impormasyon tungkol sa mg permiso ng file: [dito](server-configuration.md#required-permissions-for-unix-based-systems).
