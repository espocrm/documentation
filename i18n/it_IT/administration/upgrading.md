# Come aggiornare EspoCRM

EspoCRM può essere aggiornato alla versione più recente tramite le seguenti fasi:

### Passo 1. Verificare la versione corrente

per controllare la vostra versione attuale andare a Amministrazione > pagina di aggiornamento.

### Passo 2. È necessario scaricare i pacchetti di aggiornamento

vai alla pagina [upgrade](https://www.espocrm.com/download/upgrades/) e basato sulla vostra attuale versione download pacchetti richiesti.

### Passo 3. Creare una copia di backup (opzionale)

consente di creare un backup del vostro EspoCRM dei file e dei dati prima di eseguire l'aggiornamento. [Seguire queste istruzioni](../../../docs/administration/backup-and-restore.md) per averlo fatto.

### Passo 4. Processo di aggiornamento

Vai su Amministrazione > Aggiornamento. Caricare e installare uno per uno i pacchetti di aggiornamento.

È possibile verificare se si dispone della versione più recente in corrispondenza di Menu > Informazioni su.

## Upgrade tramite CLI

è anche possibile eseguire upgrade tramite interfaccia a riga di comando. È necessario eseguire il seguente comando da root EspoCRM directory:

'''
php upgrade.php /percorso/al/aggiornamento/package.zip
'''
