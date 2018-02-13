# Como atualizar o EspoCRM

O EspoCRM pode ser atualizado para a sua última versão seguindo os seguintes passos:

### Passo 1. Verifica a tua versão atual

Para verificar a tua versão atual, vai para a página Administração > Atualizar.

### Passo 2. Descarregue os pacotes de atualizações necessários

Vai para a página de atualização https://www.espocrm.com/download/upgrades/ e, baseado na tua versão atual, descarrega os pacotes necessários.

### Passo 3. Cria uma cópia de segurança (opcional)

Cria uma cópia de segurança dos teus arquivos do EspoCRM e dados antes de atualizar. Segue [estas instruções](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) para concluir esse processo.

### Passo 4. Processo de atualização

Vai para Administração > Atualizar. Faz o upload e instala os pacotes de atualizações um por um.

Podes verificar se you tem a última versão em Menu > Sobre.

## Atualização através de CLI

Podes também executar a atualização através da interface da linha de comando. Precisas executar os seguintes comandos do diretório raiz do EspoCRM:

```
php upgrade.php /path/to/upgrade/package.zip
```
