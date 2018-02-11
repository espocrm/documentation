# Movendo o EspoCRM para outro servidor

Sigua esses passos para mover o EspoCRM para outro servidor:

### Passo 1. Cópia de segurança dos arquivos

Abra um gerenciador de arquivos ou faça login através de SSH para arquivar todos os arquivos disponíveis do diretório EspoCRM. Para mais detalhes: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Passo 2. Faça uma cópia de segurança de seu banco de dados

Os dados guardados no banco de dados (MySQL, MariaDB) devem ser salvos em uma cópia de segurança. Por favor, siga essa recomendação: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Passo 3. Copie os arquivos e cópias de segurança dos bancos de dados para outro servidor

Copie os arquivos da cópia de segurança e seu banco de dados para um novo servidor.

### Passo 4. Extraia os arquivos da cópia de segurança

Para extrair os arquivos da cópia de segurança, você pode usar o Gerenciador de Arquivos ou essas intruções: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Nota: Os arquivos precisam ser colocados no diretório do servidor da web.

### Passo 5. Configure um servidor

Configure um novo servidor baseado nas recomendações aqui: https://www.espocrm.com/documentation/administration/server-configuration/.

### Passo 6. Corrija as permissões

Defina as permissões requeridas e proprietários dos arquivos, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Passo 7. Importe a sua cópia de segurança do banco de dados

Primeiro, você deve criar um novo banco de dados com um usuário no MySQL. Para importar seu banco de dados da cópia de segurança, siga as instruções: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Passo 8. Corrija as configurações do EspoCRM

Após importar com sucesso e configurar o servidor, por favor, corrija as configurações do EspoCRM no arquivo `ESPOCRM_DIRECTORY/data/config.php`:

 * configurações de conexão do banco de dados:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'NOME_DO_BANCO_DE_DADOS',
        'user' => 'SEU_USUÁRIO',
        'password' => 'SENHA_DO_BANCO_DE_DADOS',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - se o nome de seu domínio (URL) mudou:
  
  ```php
  'siteUrl' => 'https://novo-link.com',
  ```
  
  * proprietário padrão dos arquivos (somente se há diferença):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  onde `www-data` é seu usuário do servidor da web.

### Passo 9. Configure um crontab

Configure um crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Nota: ele deveria ser configurado pelo usuário do servidor da web.

Isso é tudo. Agora sua instância do EspoCRM está sendo executada em um novo servidor.
