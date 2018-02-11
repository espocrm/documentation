# Emails
#E-mails

> Importante. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) deveria ser configurado em seu sistema para fazer buscas de email funcionar. Você pode achar as informações em seu EspoCRM em Administration > Scheduled Jobs.

>Wichtig. Cron sollte in Ihrem System so konfiguriert sein, dass E-Mail-Abruf funktioniert. Sie finden die Informationen in Ihrem EspoCRM unter Administration> Geplante Jobs.



## Panorama
## Überblick
EspoCRM tem uma habilidade de monitorar caixas de email IMAP. O email pode ser arquivado de dois modos: Grupo de Contas de Email e Contas de Email Pessoais. Contas de Entrada para Grupo são pretendidas para caixas de email de grupos: o caso mais comum é uma caixa para o suporte. Contas de Email Pessoal são pretendidas para as caixas de email pessoais dos usuários.

EspoCRM kann IMAP-Postfächer überwachen. E-Mails können auf zwei Arten archiviert werden: Gruppen-E-Mail-Konten und Persönliche E-Mail-Konten. Gruppeneingangskonten sind für Gruppenpostfächer gedacht: Der häufigste Fall ist eine Supportbox. Persönliche E-Mail-Konten sind für persönliche Postfächer der Benutzer gedacht.

Enquanto um email está sendo recebido, o sistema tenta ligá-lo com o registro apropriado (Contas, Condução, Oportunidade, Caso). Os usuários que seguem aquele registro vão receber notificação sobre um novo email no sistema, mesmo que ele não esteja no 'Para' ou 'CC'.
Wenn eine E-Mail kommt, versucht das System, sie mit dem entsprechenden Datensatz (Accounts, Lead, Opportunity, Case) zu verknüpfen. Benutzer, die diesem Datensatz folgen, erhalten eine Benachrichtigung über eine neue E-Mail im System, auch wenn sie nicht in An oder CC sind.



## Grupo de Contas de Email
##E-Mail-Konten gruppieren

Somente o administrador pode configurar Grupo de Contas de Email. Os Grupo de Contas de Email podem ser usados para emails que estão sendo recebidos ou enviados. Enviar emails de contas de grupos está disponível desde a versão 4.9.0.
ur der Administrator kann Gruppen-E-Mail-Konten einrichten. Gruppen-E-Mail-Konten können sowohl zum Empfangen als auch zum Senden von E-Mails verwendet werden. Das Senden von E-Mails von Gruppenkonten ist seit Version 4.9.0 verfügbar.

O campo 'times' determina a quais times serão atribuídos os emails que estão chegando. 
Das Feld "Teams" legt fest, welchen Teams eingehende E-Mails zugewiesen werden.

Se o grupo de contas de email tem SMTP e está verificado como divididos, então um acesso será controlado por Papéis através da permissão do Grupo de Contas de Email. O campo 'times' será usado se o nível de permissão estiver definido como 'time'.
Wenn das E-Mail-Konto der Gruppe über SMTP verfügt und als freigegeben markiert ist, wird der Zugriff über die Berechtigung Rollen durch Gruppen-E-Mail-Konto gesteuert. Das Feld Teams wird verwendet, wenn die Berechtigungsstufe auf "Team" eingestellt ist. 

Existe uma habilidade de fazer o sistema enviar uma mensagem automática para emails recebidos.
Es besteht die Möglichkeit, dass das System eine automatische Antwort für eingehende E-Mails sendet.

## Email-para-Caixa
## E-Mail-zu-Fall

Há uma opção de fazer o sistema criar caixas de emails de grupo recebidos. 
Essa característica é intencionada para times de suporte. 
As caixas podem ser distribuídas para usuários de um time específico de acordo com esses caminhos: 'atribuição direta', 'um usuário por turno' e 'menos ocupado'. 
Somente o primeiro email na sequência cria uma nova caixa. 
Cada email subsequente será ligado a um registro de caixa existente e mostrado no seu painel 'Transmissão'.
Es gibt eine Option, mit der das System Fälle aus eingehenden Gruppen-E-Mails erstellen kann. Diese Funktion ist für Supportteams vorgesehen. Die Fälle können nach den folgenden Methoden an Benutzer eines bestimmten Teams verteilt werden: direkte Zuweisung, Round-Robin und weniger ausgelastet. Nur die erste E-Mail im Thread erstellt einen neuen Fall. Jeder nachfolgende wird mit dem bestehenden Falldatensatz verknüpft und im Stream-Bereich angezeigt.

Quando usuários querem enviar uma resposta para o cliente, eles precisam ter certeza que a caixa está selecionada como um superior do email que está sendo enviado. Isso fará com que o cliente responda para o endereço de email do grupo em vez de para o email do usuário.
Wenn Benutzer eine Antwort an den Kunden senden möchten, müssen sie sicherstellen, dass der Fall als übergeordnetes Element der gesendeten E-Mail ausgewählt ist. Dadurch wird der Kunde eher auf die E-Mail-Adresse der Gruppe als auf die des Benutzers antworten.

## Contas de Email Pessoal
##Persönliche E-Mail-Konten

Os usuários podem configurar as suas próprias contas de email que necessitem de monitoramento. Emails > Top Right Dropdown Menu > Personal Email Accounts. O administrador também pode gerenciar as contas de email dos usuários.
Benutzer können ihre eigenen E-Mail-Konten einrichten, die überwacht werden müssen. E-Mails> Oben rechts Dropdown-Menü> Persönliche E-Mail-Konten. Der Administrator kann auch die E-Mail-Konten der Benutzer verwalten.
## Filtros de Email
##E-Mail-Filter

Esses permitem que ocorra a filtragem dos emails recebidos de acordo com critérios específicos Por exemplo, se você não quer mensagens de notificação enviadas por alguma aplicação seja importada para o EspoCRM, você pode criar um filtro para fazer EspoCRM ignorá-las.
Diese ermöglichen das Filtern eingehender E-Mails nach festgelegten Kriterien. Z.B. Wenn Sie nicht möchten, dass Benachrichtigungen von bestimmten Anwendungen an EspoCRM importiert werden, können Sie einen Filter erstellen, damit EspoCRM sie überspringt.


O administrador pode criar filtros globais, aplicados para todas as contas de email. Os usuários podem criar filtros para suas próprias contas de email e para uma caixa de entrada inteira.
Der Administrator kann globale Filter erstellen, die auf alle E-Mail-Konten angewendet werden. Benutzer können Filter für ihren eigenen persönlichen E-Mail-Account und für den gesamten Posteingang erstellen.


