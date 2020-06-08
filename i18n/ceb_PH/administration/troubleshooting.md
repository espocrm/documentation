# Pag-troubleshoot

## I-check ang mga log

Para masakpan ang problema, gikinahanglan nimong i-check ang mga error log file.

#### Mga EspoCRM error log

Ang mga EspoCRM log kay makit-an sa `<ESPOCRM_DIRECTORY>/logs/*.log` ug naay sulod nga mga impormasyon sa mga sayop o pagkaguba.

#### Mga Apache error log

Para sa Ubuntu server, ang apache error log kay makit-an sa `/var/log/apache2/error.log` ug naa kini sulod nga mga impormasyon sa mga sayop o pagkaguba. Ang lokasyon sa mga log file kay pwede maglahilahi sa ubang mga sistema.

## I-enable ang debugging mode

Para i-enable ang mode para maka debug, adto sa installed EspoCRM nga direktoryo, ablihi ang file `data/config.php` ug usba ang balor:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
ngadto sa
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Ang mga Scheduled Job kay wala nang-gana

#### Problema #1: Ang imong crontab kay wala nakonpigyur

1. Pag-login gamit ang SSH ngadto sa imohang server.

2. I-konpigyur ang imohang [crontab](server-configuration.md#pag-setup-og-crontab) gamit sa mga musunod nga mga lakang.

Timan-e: Ang crontab kay gikinahanglang i-konpigyura sa ubos sa web-server nga user, e.g. `crontab -e -u www-data`.

3. Huwat ug pipila ka oras ug i-check ang mga Sheduled Job para matan-aw kung ang mga trabahoonon kay nabuhat na (tan-aw og usa ka Log nga panel).

#### Problema #2. Ang Crontab kay nakonpigyura na, pero ang mga Scheduled Job kay wala nigana

Para siguradohon nga walay error nga nahitabo samtang nagdagan si cron, suwayi og padagan ang musunod nga cron command sa usa ka terminal:

1. Pag-login gamit ang SSH ngadto sa imohang server.

2. Adto sa imohang direktoryo kung asa naka-instolar ang EspoCRM. E.g. para sa `/var/www/html/espocrm` nga direktoryo ang command kay:

```bash
cd /var/www/html/espocrm
```

3. Ipadagan ang crontab command:

```bash
php cron.php
```

Timan-e: Gikinahanglan kini nga i-eksekyut ubos sa web-server nga user. Kung wala ka naka-login isip root, ang command kay gikinahanlan ni (e.g para sa Ubuntu):

```bash
sudo -u www-data php cron.php
```

kung asa ang `www-data` kay usa ka web-server nga user.

4. Kung walay mga error, i-check ang mga Scheduled Job aron tan-awon kung naay mga na-eksekyut (tan-awa ang Log panel).

## Ang EspoCRM wala ni-load pagkahuman ug updgare

Pwede ni mahitabo sa ubang mga shared nga hosting.

Tan-awa ang mga permiso sa mga kani nga file:
/index.php
/api/v1/index.php

Gikinahanglan ni nga 644. Kung naay bisan usa ka file nga naay permiso nga 664, gikinahanglan nimo ni usbon ngadto sa 644. Gamita imohang kontrol panel sa hosting o chmod nga command.

```
chmod 644 /path/to/file
```
Para sa dugang nga impormasyon bahin sa mga permiso sa file: [diri](server-configuration.md#mga-gikinahanlang-permiso-para-sa-mga-unix-based-nga-mga-sistema).
