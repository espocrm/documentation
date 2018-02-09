# Emails

> Importante. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) deveria ser configurado em seu sistema para fazer buscas de email funcionar. Você pode achar as informações em seu EspoCRM em Administration > Scheduled Jobs.

## Panorama

EspoCRM tem uma habilidade de monitorar caixas de email IMAP. O email pode ser arquivado de dois modos: Grupo de Contas de Email e Contas de Email Pessoais. Contas de Entrada para Grupo são pretendidas para caixas de email de grupos: o caso mais comum é uma caixa para o suporte. Contas de Email Pessoal são pretendidas para as caixas de email pessoais dos usuários.

Enquanto um email está sendo recebido, o sistema tenta ligá-lo com o registro apropriado (Contas, Condução, Oportunidade, Caso). Os usuários que seguem aquele registro vão receber notificação sobre um novo email no sistema, mesmo que ele não esteja no 'Para' ou 'CC'.

## Grupo de Contas de Email

Somente o administrador pode configurar Grupo de Contas de Email. Os Grupo de Contas de Email podem ser usados para emails que estão sendo recebidos ou enviados. Enviar emails de contas de grupos está disponível desde a versão 4.9.0.

O campo 'times' determina a quais times serão atribuídos os emails que estão chegando. 

Se o grupo de contas de email tem SMTP e está verificado como divididos, então um acesso será controlado por Papéis através da permissão do Grupo de Contas de Email. O campo 'times' será usado se o nível de permissão estiver definido como 'time'.

Existe uma habilidade de fazer o sistema enviar uma mensagem automática para emails recebidos.

## Email-para-Caixa

Há uma opção de fazer o sistema criar caixas de emails de grupo recebidos. 
Essa característica é intencionada para times de suporte. 
As caixas podem ser distribuídas para usuários de um time específico de acordo com esses caminhos: 'atribuição direta', 'um usuário por turno' e 'menos ocupado'. 
Somente o primeiro email na sequência cria uma nova caixa. 
Cada email subsequente será ligado a um registro de caixa existente e mostrado no seu painel 'Transmissão'.

Quando usuários querem enviar uma resposta para o cliente, eles precisam ter certeza que a caixa está selecionada como um superior do email que está sendo enviado. Isso fará com que o cliente responda para o endereço de email do grupo em vez de para o email do usuário.

## Contas de Email Pessoal

Os usuários podem configurar as suas próprias contas de email que necessitem de monitoramento. Emails > Top Right Dropdown Menu > Personal Email Accounts. O administrador também pode gerenciar as contas de email dos usuários.

## Filtros de Email

Esses permitem que ocorra a filtragem dos emails recebidos de acordo com critérios específicos Por exemplo, se você não quer mensagens de notificação enviadas por alguma aplicação seja importada para o EspoCRM, você pode criar um filtro para fazer EspoCRM ignorá-las.

O administrador pode criar filtros globais, aplicados para todas as contas de email. Os usuários podem criar filtros para suas próprias contas de email e para uma caixa de entrada inteira.
