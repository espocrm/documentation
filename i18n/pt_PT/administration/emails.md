# Emails

Importante. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) deveria ser configurado no teu sistema para fazer com que as pesquisas de email funcione. Podes encontrar as informações no teu EspoCRM em Administration > Scheduled Jobs.

## Panorama

EspoCRM tem uma habilidade de monitorizar caixas de email IMAP. O email pode ser arquivado de dois modos: Grupo de Contas de Email e Contas de Email Pessoais. Contas de Entrada para Grupo são pretendidas para caixas de email de grupos: o caso mais comum é uma caixa para o suporte. Contas de Email Pessoal são pretendidas para as caixas de email pessoais dos utilizadores.

Enquanto um email está a ser recebido, o sistema tenta ligá-lo com o registro apropriado (Contas, Condução, Oportunidade, Caso). Os utilizadores que seguem aquele registro vão receber uma notificação sobre um novo email no sistema, mesmo que ele não esteja no 'Para' ou 'CC'.

## Grupo de Contas de Email

Somente o administrador pode configurar Grupo de Contas de Email. Os Grupo de Contas de Email podem ser usados para emails que estão a ser recebidos ou enviados. Enviar emails de contas de grupos está disponível desde a versão 4.9.0.

O campo equipas determina a quais equipas serão atribuídos os emails que estão a chegar. 

Se o grupo de contas de email tem SMTP e está verificado como divididos, então um acesso será controlado por Papéis através da permissão do Grupo de Contas de Email. O campo equipas será usado se o nível de permissão estiver definido como equipa.

Existe uma habilidade de fazer o sistema enviar uma mensagem automática para emails recebidos.

## Email-para-Caixa

Há uma opção de fazer o sistema criar caixas de emails de grupo recebidos. 
Essa característica é intencionada para as equipas de suporte. 
As caixas podem ser distribuídas para utilizadores de uma equipa específico de acordo com esses caminhos: 'atribuição direta', 'um utilizador por turno' e 'menos ocupado'. 
Somente o primeiro email na sequência cria uma nova caixa. 
Cada email subsequente será ligado a um registro de caixa existente e mostrado no seu painel 'Transmissão'.

Quando os utilizadores pretendem enviar uma resposta para o cliente, eles precisam de ter a certeza que a caixa está selecionada como um superior do email que está sendo enviado. Isso fará com que o cliente responda para o endereço de email do grupo em vez de para o email do utilizador.

## Contas de Email Pessoal

Os utilizadores podem configurar as suas próprias contas de email que necessitem de monitorização. Emails > Top Right Dropdown Menu > Personal Email Accounts. O administrador também pode gerir as contas de email dos utilizadores.

## Filtros de Email

Esses permitem que ocorra a filtragem dos emails recebidos de acordo com critérios específicos Por exemplo, se tu não quiseres mensagens de notificação enviadas por alguma aplicação seja importada para o EspoCRM, podes criar um filtro para fazer EspoCRM ignorá-las.

O administrador pode criar filtros globais, aplicados para todas as contas de email. Os utilizadores podem criar filtros para suas próprias contas de email e para uma caixa de entrada inteira.
