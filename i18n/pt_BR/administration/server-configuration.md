# Configuração de Servidor para EspoCRM

EspoCRM pode ser instalado no Apache ([instruções](apache-server-configuration.md)), Nginx ([instruções](nginx-server-configuration.md)), ou servidor IIS com suporte para  PHP versão 5.6 ou superior e MySQL versão 5.1 ou superior.

## Recomendações de Configuração

### Requisitos PHP

EspoCRM requer PHP versão 5.6 ou superior, com as seguintes extensões habilitadas:

* [PDO](http://php.net/manual/en/book.pdo.php) – para acessar MySQL em PHP;
* [JSON](http://php.net/manual/en/book.json.php) – os recursos usam este formato (metadados, layout, idiomas, e outros);
* [GD](http://php.net/manual/en/book.image.php) – para manipular imagens;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – para garantir o maior nível de proteção;
* [Zip](http://php.net/manual/en/book.zip.php) – para ser capaz de atualizar o EspoCRM e instalar extensões;
* [IMAP](http://php.net/manual/en/book.imap.php) – para monitorar caixas de correspondência no EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Também é recomendado ter a extensão pecl [mailparse](https://pecl.php.net/package/mailparse) instalada. É necessário para um trabalho fluído do recurso de busca de email 

configurações php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Requisitos MySQL

EspoCRM suporta MySQL versão 5.1 ou superior.
Esses não são peculiaridades especiais. Todas as configurações padrões são boas para o EspoCRM.

## Permissões Requeridas para Sistemas Baseados em Unix

Os arquivos e diretórios devem ter as seguintes permissões:

* `/data`, `/custom`, `/client/custom` – devem poder modificar todos os arquivos, diretórios e subdiretórios (664 para arquivos, 775 para diretórios, incluindo todos os subdiretórios e arquivos);
* `/application/Espo/Modules`, `/client/modules` – devem poder modificar o diretório atual (775 para o diretório atual, 644 para arquivos, 755 para diretórios e subdiretórios);
* Todos os outros arquivos e diretórios devem poder serem lidos (644 para arquivos, 755 para diretórios).

Para definir permissões, execute esses comandos no terminal:

```
cd <CAMINHO-PARA-O-DIRETORIO-DO-ESPOCRM>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Todos os arquivos devem pertencer e grupo-pertencer ao processo do servidor de web. Ele pode ser “www-data”, “daemon”, “apache”, “www”, etc.  
Nota: No Bitnami Stack, os arquivos devem pertencer e grupo-pertencer ao usuário "daemon".  
Nota: Em hosts compartilhados, os arquivos devem pertencer e grupo-pertencer à conta de seu usuário.

Para definir o proprietário e grupo-proprietário, execute esses comandos no terminal:

```
cd <CAMINHO-PARA-O-DIRETORIO-DO-ESPOCRM>
chown -R <PROPRIETARIO>:<GROUPO-PROPRIETARIO> .;
```

## Configure um crontab

Para configurar um crontab em um sistema UNIX, siga os seguintes passos:

* 1. Faça login como um administrador em sua instância EspoCRM
* 2. Vá para a sessão Trabalhos Agendados no painel de administrador (Menu > Administração > Trabalhos Agendados) e copie a sequência de caracteres para o crontab. Ela se parece com isso:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Abra um terminal e execute esse comando:
```
crontab -e -u USUARIO_SERVIDOR_DA_WEB
```
USUARIO_SERVIDOR_DA_WEB pode ser um dos seguintes “www”, “www-data”, “apache”, etc (dependendo do seu servidor da web).
* 4. Cole a sequência de caracteres copiada (do passo 2) e salve o arquivo crontab (Ctrl+O, então Ctrl+X para o editor nano).

## Instruções de configuração baseadas em seu servidor:

* [Configuração em servidor Apache](apache-server-configuration.md).
* [Configuração em servidor Nginx](nginx-server-configuration.md).
