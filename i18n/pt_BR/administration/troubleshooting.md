# Resolução de Problemas

## Verificar logs

Para achar o problemas, você deve verificar o arquivo do log de erros.

#### Logs de erro do EspoCRM

Os logs do EspoCRM estão localizados no  `<DIRETORIO_ESPOCRM>/logs/*.log` e contém algumas informações sobre erros.

#### Logs de erro do Apache

Para o servidor Ubuntu um log de erro apache está localizado em `/var/log/apache2/error.log` e contém todas as informações de erro. A localização dos arquivos de log podem ser diferentes em outros sistemas. 

## Habilitar modo de depuração

Para habilitar o modo de depuração, vá para o diretório onde está instalado o EspoCRM, abra o arquivo `data/config.php` e mude o valor:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
para
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Tarefas Agendadas não estão funcionando

#### Problema #1: Seu crontab não está configurado

1. Faça login através do SSH para seu servidor.

2. Configure seu crontab seguindo os seguintes passos: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Nota: Crontab deve ser configurado por um usuário do servidor da web, ex: `crontab -e -u www-data`.

3. Espere por um tempo e verifique os Trabalhos Agendados para ver se qualquer trabalho foi executado (veja um painel de Log).

#### Problema #2. Crontab está configurado, mas os Trabalhos Agendados não estão funcionando

Para ter certeza que não existem erros quando cron está sendo executado, tente executar o comando cron em um terminal:

1. Faça login através do SSH para seu servidor.

2. Vá para o diretório onde o EspoCRM está instalado. Ex: para o diretório `/var/www/html/espocrm` o comando é:

```bash
cd /var/www/html/espocrm
```

3. Execute o comando crontab::

```bash
php cron.php
```

Nota: Ele deve ser executado por um usuário do servidor da web. Se você está logado como root, o comando deve ser (ex: para Ubuntu):

```bash
sudo -u www-data php cron.php
```

onde `www-data` é um usuário do servidor da web.

4. Se não há erros, verifique os Trabalhos Agendados para ver se qualquer trabalho foi executado (ver um painel de Log).

## EspoCRM não está carregando após updgare

Isso pode acontecer algumas vezes em algumas hospedagens compartilhadas.

Verifique os arquivos de permissões:
/index.php
/api/v1/index.php

Eles devem ser 644. Se qualquer desses arquivos tem permissão 664, você precisa mudá-la para 644. Use seu painel de controle da hospedagem ou comando chmod.

```
chmod 644 /path/to/file
```
Mais informação sobre permissões de arquivos: [aqui](server-configuration.md#required-permissions-for-unix-based-systems).
