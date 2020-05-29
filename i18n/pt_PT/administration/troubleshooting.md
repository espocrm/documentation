# Resolução de Problemas

## Verificar logs

Para achar o problemas, deves verificar o arquivo do log de erros.

#### Logs de erro do EspoCRM

Os logs do EspoCRM estão localizados no  `<DIRETORIO_ESPOCRM>/logs/*.log` e contém algumas informações sobre erros.

#### Logs de erro do Apache

Para o servidor Ubuntu um log de erro apache está localizado em `/var/log/apache2/error.log` e contém todas as informações de erro. A localização dos arquivos de log podem ser diferentes em outros sistemas. 

## Habilitar modo de depuração

Para habilitar o modo de depuração, vai para o diretório onde está instalado o EspoCRM, abra o arquivo `data/config.php` e muda o valor:

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

## Tarefas Agendadas não estão a funcionar

#### Problema #1: O Teu crontab não está configurado

1. Faz login através do SSH para o teu servidor.

2. Configura o teu [crontab](server-configuration.md#configure-um-crontab) seguindo os seguintes passos.

Nota: Crontab deve ser configurado por um utilizador do servidor da web, ex: `crontab -e -u www-data`.

3. Aguarda algum tempo e verifica os Trabalhos Agendados para ver se qualquer trabalho foi executado (veja um painel de Log).

#### Problema #2. Crontab está configurado, mas os Trabalhos Agendados não estão a funcionar

Para ter certeza que não existem erros quando cron está a ser executado, tenta executar o comando cron num terminal:

1. Faz login através do SSH para o teu servidor.

2. Vai para o diretório onde o EspoCRM está instalado. Ex: para o diretório `/var/www/html/espocrm` o comando é:

```bash
cd /var/www/html/espocrm
```

3. Executa o comando crontab::

```bash
php cron.php
```

Nota: Ele deve ser executado por um utilizador do servidor da web. Se estás ligado como root, o comando deve ser (ex: para Ubuntu):

```bash
sudo -u www-data php cron.php
```

onde `www-data` é um utilizador do servidor da web.

4. Se não há erros, verifica os Trabalhos Agendados para ver se qualquer trabalho foi executado (ver um painel de Log).

## EspoCRM não está carregando após updgare

Isto pode acontecer algumas vezes em algumas hospedagens compartilhadas.

Verifique os arquivos de permissões:
/index.php
/api/v1/index.php

Eles devem ser 644. Se qualquer desses arquivos tem permissão 664, precisas mudá-la para 644. Usa o teu painel de controle da hospedagem ou comando chmod.

```
chmod 644 /path/to/file
```
Mais informação sobre permissões de arquivos: [aqui](server-configuration.md#permissões-requeridas-para-sistemas-baseados-em-unix).
