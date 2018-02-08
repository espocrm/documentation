# Cópia de Segurança e Restauração

## Como fazer uma cópia de segurança do EspoCRM manualmente

EspoCRM consiste em arquivos e informações da base de dados. Todas essas informações são necessárias para criar uma cópia de segurança completa do EspoCRM. Aqui estão as instruções de como fazer isso em servidor Ubunto com MySQL.

### Passo 1. Cópia de segurança dos arquivos

Criar um arquivo com o conteúdo do diretório do EspoCRM instalado. Para Ubuntu o caminho padrão é `/var/www/html`. Você pode usar esse comando:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Passo 2. Cópia de segurança da base de dados

Para salvar todas as suas informações, você deve saber o nome e as credenciais de acesso da base de dados. Você pode encontrar o nome da base de dados no arquivo de configuração `/ESPOCRM_DIRECTORY/data/config.php` sob a sessão `database`. Você pode usar esse comando para salvar seu banco de dados:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Passo 3. Copiar a cópia de segurança

Isso é tudo. Agora, você deve copiar a cópia de segurança criada para um local seguro.


## Como fazer uma cópia de segurança do EspoCRM com um script

Você pode usar um script para salvar todas as informações necessárias. Faça login através de SSH e execute os comandos (testados em servidor Ubuntu).

### Baixe um script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Execute o script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
where
 * `PATH_TO_ESPOCRM` é um caminho para o diretório do EspoCRM instalado.
 * `BACKUP_PATH` é um caminho para o diretório da cópia de segurança.

Para servidor Ubuntu é:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Nota: Se seu usuário MySQL não tem os direitos necessários para despejar sua base de dados, será solicitado que você entre com as credenciais de outro usuário MySQL.

Após a criação bem sucedida, você receberá um caminho para a cópia de segurança criada.

## Restauração do EspoCRM a partir de uma cópia de segurança

Você pode restaurar EspoCRM de uma cópia de segurança criada como descrito acima.

### Passo 1. Extraia os arquivos da cópia de segurança

Para extrair arquivos, você pode usar o Archive Manager ou executar o comando abaixo. Os arquivos precisam ser colocados em um diretório de servidor na web.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
onde:
 * `/var/www/html` é um diretório do servidor da web.

### Passo 2. Definir permissões requeridas

Os arquivos deveriam ser propriedade de um usuário do servidor da web e ter as permissões corretas. Por favor, defina as permissões necessárias através das instruções: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Passo 3. Importar o despejo da base de dados

O despejo da base de dados deve ser importando para a mesma base de dados com a mesma credencial de usuário, caso contrário a correção deve ser feita no arquivo de configuração `ESPOCRM_DIRECTORY/data/config.php`. Para importar seu banco de dados do despejo, execute o comando abaixo em um terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Passo 4. Verificar/configurar crontab

Verifique se seu crontab está configurado apropriadamente. Execute o comando abaixo e verifique se o caminho para EspoCRM está correto:

```bash
sudo crontab -l -u www-data
```
where:
 * `www-data` é seu usuário do servidor de web.

Se você tem que fazer quaisquer mudanças, use esse comando:

```bash
sudo crontab -l -u www-data
```

Mais detalhes sobre configurar crontab para EspoCRM está descrito aqui [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
