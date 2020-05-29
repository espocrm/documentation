# Mover o EspoCRM para outro servidor

Segue estes passos para mover o EspoCRM para outro servidor:

### Passo 1. Cópia de segurança dos arquivos

Abre um gestor de arquivos ou faz login através de SSH para arquivar todos os arquivos disponíveis do diretório EspoCRM. Para mais [detalhes](backup-and-restore.md#passo-1-c%C3%B3pia-de-seguran%C3%A7a-dos-arquivos).

### Passo 2. Faz uma cópia de segurança da tua base de dados

Os dados guardados na base de dados (MySQL, MariaDB) devem ser salvos numa cópia de segurança. Por favor, sige esta [recomendação](backup-and-restore.md#passo-2-c%C3%B3pia-de-seguran%C3%A7a-da-base-de-dados).

### Passo 3. Copia os arquivos e cópias de segurança das bases de dados para outro servidor

Copia os arquivos da cópia de segurança e da tua base de dados para um novo servidor.

### Passo 4. Extrai os arquivos da cópia de segurança

Para extrair os arquivos da cópia de segurança, podes usar o Gestor de Arquivos ou estas [intruções](backup-and-restore.md#passo-1-extraia-os-arquivos-da-c%C3%B3pia-de-seguran%C3%A7a). 

Nota: Os arquivos precisam ser colocados no diretório do servidor da web.

### Passo 5. Configura um servidor

Configura um novo servidor baseado nas recomendações [aqui](server-configuration.md).

### Passo 6. Corrije as permissões

Define as permissões requeridas e proprietários dos [arquivos](server-configuration.md#permissões-requeridas-para-sistemas-baseados-em-unix).

### Passo 7. Importa a tua cópia de segurança da base de dados

Primeiro, deves criar uma nova base de dados com um utilizador no MySQL. Para importar a tua base de dados da cópia de segurança, segue as [instruções](backup-and-restore.md#passo-3-importar-o-despejo-da-base-de-dados).

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

Configura um [crontab](server-configuration.md#configure-um-crontab).

Nota: ele deveria ser configurado pelo utilizador do servidor da web.

Isto é tudo. Agora a tua instância do EspoCRM está a ser executada num novo servidor.
