# Como atualizar o EspoCRM

O EspoCRM pode ser atualizado para sua última versão seguindo os seguintes passos:

### Passo 1. Verifique sua versão atual

Para verificar sua versão atual, vá para a página Administração > Atualizar.

### Passo 2. Baixe os pacotes de atualizações necessários

Vá para a página de atualização https://www.espocrm.com/download/upgrades/ e, baseado em sua versão atual, baixe os pacotes necessários.

### Passo 3. Crie uma cópia de segurança (opcional)

Crie uma cópia de segurança de seus arquivos do EspoCRM e dados antes de atualizar. Siga [essas instruções](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) para concluir esse processo.

### Passo 4. Processo de atualização

Vá para Administração > Atualizar. Faça o upload e instale os pacotes de atualizações um por um.

Você pode verificar se you tem a última versão em Menu > Sobre.

## Atualização através de CLI

Você pode também executar a atualização através da interface da linha de comando. Você precisa executar os seguintes comandos do diretório raiz do EspoCRM:

```
php upgrade.php /path/to/upgrade/package.zip
```
