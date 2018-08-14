# Gestão do Caso

Os casos fornecem uma capacidade de rastreamento de problemas. É um aspecto principal do serviço ao cliente no EspoCRM. O termo Ticket também pode ser usado para os casos.

A entidade de caso pode ser associada a uma Conta e/ou a vários Contatos.

Os novos casos devem ser criados pelos seguintes cenários:

* Manualmente por usuários de CRM;
* Manualmente por usuários do portal de clientes;
* Através da API (por exemplo, através do formulário web);
* Automaticamente quando um novo e-mail entrou para uma caixa de correio específica.
* Automaticamente por uma regra do Fluxo de trabalho.

A gravação do caso tem um fluxo que pode ser utilizado para uma comunicação entre o cliente e o serviço. Os utilizadores de CRM também podem fazer postagens internas que não serão visíveis num portal de clientes.

Quando o novo caso é criado por um usuário do portal, ele não é atribuído a nenhum usuário. Ao usuário [Fluxos de trabalho] (https://github.com/espocrm/documentation/blob/master/administration/workflows.md) o administrador pode criar uma regra que notificará certos usuários sobre um novo caso no sistema. Os fluxos de trabalho também fornecem uma capacidade para aplicar a regra de atribuição a novos casos, ou seja, regras Round-Robin e Least-Busy. Para fluxos de negócios mais complexos é recomendável utilizar [ferramenta BPM] (https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

Para evitar a negligência de novos casos, os usuários podem adicionar o tipo de entidade de Caso à lista de Auto-seguimento Global em Preferências. Então, eles seguirão automaticamente cada novo caso.

Nota: Se não houver nenhum usuário do portal associado a um contato vinculado, o cliente não receberá notificações por e-mail sobre as atualizações no Stream. Você precisa de usar e-mails para comunicar com o cliente.

### Email-para-Caso

O administrador pode configurar a conta de e-mail do grupo que criará um novo caso em cada novo e-mail de entrada. Para mais informações [veja aqui] (https://github.com/espocrm/documentation/blob/master/administration/emails.md).

### Conhecimento Base

Os usuários podem relacionar artigos da base de conhecimento ao registro do caso.

### Portal do cliente

O administrador pode criar um [portal](https://github.com/espocrm/documentation/blob/master/administration/portal.md) onde os clientes poderão criar casos.

Como os usuários do portal seguem automaticamente os seus casos, eles receberão notificações por e-mail sobre as novas mensagens no Stream.
