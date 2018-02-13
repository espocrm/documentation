# Mover o EspoCRM para outro servidor

Segue estes passos para mover o EspoCRM para outro servidor:

### Passo 1. Cópia de segurança dos arquivos

Abre um gestor de arquivos ou faz login através de SSH para arquivar todos os arquivos disponíveis do diretório EspoCRM. Para mais detalhes: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Passo 2. Faz uma cópia de segurança da tua base de dados

Os dados guardados na base de dados (MySQL, MariaDB) devem ser salvos numa cópia de segurança. Por favor, sige esta recomendação: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Passo 3. Copia os arquivos e cópias de segurança das bases de dados para outro servidor

Copia os arquivos da cópia de segurança e da tua base de dados para um novo servidor.

### Passo 4. Extrai os arquivos da cópia de segurança

Para extrair os arquivos da cópia de segurança, podes usar o Gestor de Arquivos ou estas intruções: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Nota: Os arquivos precisam ser colocados no diretório do servidor da web.

### Passo 5. Configura um servidor

Configura um novo servidor baseado nas recomendações aqui: https://www.espocrm.com/documentation/administration/server-configuration/.

### Passo 6. Corrije as permissões

Define as permissões requeridas e proprietários dos arquivos, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Passo 7. Importa a tua cópia de segurança da base de dados

Primeiro, deves criar uma nova base de dados com um utilizador no MySQL. Para importar a tua base de dados da cópia de segurança, segue as instruções: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Passo 8. Corrije as configurações do EspoCRM

Após importar com sucesso e configurar o servidor, por favor, corrije as configurações do EspoCRM no arquivo `ESPOCRM_DIRECTORY/data/config.php`:

 * configurações de conexão da base de dados:
  
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

  onde `www-data` é teu utilizador do servidor da web.

### Passo 9. Configura um crontab

Configura um crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Nota: ele deveria ser configurado pelo utilizador do servidor da web.

Isto é tudo. Agora a tua instância do EspoCRM está a ser executada num novo servidor.
