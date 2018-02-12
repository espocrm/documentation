# Cópia de Segurança e Restauração

## Como fazer uma cópia de segurança do EspoCRM manualmente

EspoCRM consiste em arquivos e informações da base de dados. Todas essas informações são necessárias para criar uma cópia de segurança completa do EspoCRM. Aqui estão as instruções de como fazer isso num servidor Ubuntu com MySQL.

### Passo 1. Cópia de segurança dos arquivos

Criar um arquivo com o conteúdo do diretório do EspoCRM instalado. Para Ubuntu o caminho padrão é `/var/www/html`. Podes usar este comando:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Passo 2. Cópia de segurança da base de dados

Para salvar todas as suas informações, tu deves saber o nome e as credenciais de acesso da base de dados. Podes encontrar o nome da base de dados no arquivo de configuração `/ESPOCRM_DIRECTORY/data/config.php` sob a sessão `database`. Podes usar este comando para salvar o teu banco de dados:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Passo 3. Copiar a cópia de segurança

Isto é tudo. Agora, tu deves copiar a cópia de segurança criada para um local seguro.


## Como fazer uma cópia de segurança do EspoCRM com um script

Podes usar um script para salvar todas as informações necessárias. Faça login através de SSH e executa os comandos (testados em servidor Ubuntu).

### Descarrega um script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Executa o script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
onde
 * `PATH_TO_ESPOCRM` é um caminho para o diretório do EspoCRM instalado.
 * `BACKUP_PATH` é um caminho para o diretório da cópia de segurança.

Para servidor Ubuntu é:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Nota: Se o teu utilizador MySQL não tem os direitos necessários para despejar a tua base de dados, será solicitado que entres com as credenciais de outro utilizador MySQL.

Após a criação bem-sucedida, irás receber um caminho para a cópia de segurança criada.

## Restauração do EspoCRM a partir de uma cópia de segurança

Podes restaurar EspoCRM de uma cópia de segurança criada como descrito acima.

### Passo 1. Extraia os arquivos da cópia de segurança

Para extrair arquivos, podes usar o Archive Manager ou executar o comando abaixo. Os arquivos precisam ser colocados num diretório de servidor na web.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
onde:
 * `/var/www/html` é um diretório do servidor da web.

### Passo 2. Definir permissões requeridas

Os arquivos deveriam ser propriedade de um utilizador do servidor da web e ter as permissões corretas. Por favor, define as permissões necessárias através das instruções: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Passo 3. Importar o despejo da base de dados

O despejo da base de dados deve ser importando para a mesma base de dados com a mesma credencial de utilizador, caso contrário a correção deve ser feita no arquivo de configuração `ESPOCRM_DIRECTORY/data/config.php`. Para importar a tua base de dados do despejo, executa o comando abaixo num terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Passo 4. Verificar/configurar crontab

Verifica se o teu crontab está configurado apropriadamente. Executa o comando abaixo e verifica se o caminho para EspoCRM está correto:

```bash
sudo crontab -l -u www-data
```
onde:
 * `www-data` é teu utilizador do servidor de web.

Se tiveres que fazer quaisquer mudanças, usa este comando:

```bash
sudo crontab -l -u www-data
```

Mais detalhes sobre configurar crontab para EspoCRM está descrito aqui [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
