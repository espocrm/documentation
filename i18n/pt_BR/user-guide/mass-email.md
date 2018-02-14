# Email Massivo

## Como enviar e-mails massivos

Você necesita de ter pelo menos uma Lista de Destinos com registros de destinos e um Modelo de E-mail em sua crm.

1. Crie uma nova campanha com um `E-mail` ou `Newsletter`. Selecione uma ou algumas listas de destinos no campo `Listas de Destino`.

2. Depois de o registro da campanha estiver criado, crie um E-mail Massivo para esta campanha: Faça mais um clique  no painel de E-mail Massivo. Especifique _Data de Inicio_ - de quando se devem enviar os e-mails, e selecione _Modelo de E-mailo_. certifique-se que o _Estado_ está configurado como `Pendente`.

Se tudo estiver configurado corretamente, os e-mails devem ser desligados. Eles devem ser enviados a cada hora com porções (você pode alterar o tamanho da parcela em Administração> E-mails de saída). O administrador pode alterá-lo atualizando o campo `Agendamento` da tarefa agendada 'Verifique as Contas de E-mail do Grupo'.

Você pode verificar se os e-mails são enviados em painel de registro.

## Teste o que vai ser enviado aos destinatários

Clique no menu suspenso direito na linha de e-mail massivo no painel _E-mail Massivo_ e em seguida, clique em _Enviar teste_.

## Iniciar Sessão

No registro você pode ver:
* E-mail enviado;
* E-mails abertos pelo destinatário;
* Links clicados pelo destinatário;
* Destinatários que optaram por sair;
* Mensagens de E-mails devolvidos (não foram entregues ao destinatário).

## Link de exclusão

De uma maneira predefinida, o sistema agregará a opção de exclusão voluntária a todos os e-mails enviados. Mas você pode usar um personalizado no seu Modelo de E-mail.

Exemplo:
```html
<a href="{optOutUrl}">Cancelar a subscrição da lista de correio.</a>
```

O administrador pode desabilitar o link de exclusão obrigatória que está a ser adicionado pelo sistema em Administração> E-mails de Saída.

## URL de Acompanhamento

Se você quiser saber se o seu destinatário abriu o link do teu e-mail, você precisa de criar um URL de acompanhamento. Especifique qualquer _Nome_ e _URL_ para onde o seu link deve conduzir. Então, você precisa de colocar o código gerado no teu Modelo de E-mail.

Exemplo:
  ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Teste à nossa demonstração</a>
  ```

## Listas de Destinos

As Listas de Destinos contem as listas de contas, Contatos, Potenciais Clientes r Registros de Usuários.

Os usuários podem preencher manualmente as listas de destinos usando a ação _Selecionar_ no painel correspondente na exibição de detalhes da Lista de Destinos. Existe a capacidade de fazer filtragem e em seguida selecionar todos os resultados da pesquisa.

## Preencher Listas de Destinos com Relatórios

O recurso de [Relatórios](reports.md#syncing-with-target-lists) fornece a capacidade de preencher as listas de destino com registros que correspondem a critérios específicos.

## Excluir Listas de Destinos

Especifique a Exclusão de Listas de Destinos para evitar o envio de email massivo para determinados destinatários. Se houver um registro com o endereço de e-mail que corresponda ao endereço de e-mail de qualquer registro excluído, o primeiro registro também será excluído.

## Registro de Campanha

No Registro de Campanhas, você pode consultar os e-mails que foram enviados, e-mails abertos, e-mails devolvidos, os que optaram por sair e quem clicou no link do e-mail. É possível você utilizar este log criando Lista de Destinos (menu suspenso no canto superior direito no painel) com base nos registros do log. Por exemplo, você pode escolher apenas contatos que clicaram no link (URL de rastreamento).

## Solução de Problemas

_Para os Administradores_

#### ¿Que fazer se os e-mails não são enviados?

1. Verifique se funciona _Envio de Teste_. Se não funcionar, verifique se as configurações de SMTP do sistema estão corretas.
2. Verifique se configuraste o cron para seu sistema.
3. Verifique se você tem o Trabalho Programado de `Enviar e-mails massivos` e está `Ativo` (Administração > Trabalhos Programados > Enviar E-mails Massivos). Verifique se há alguma coisa no Log.

#### ¿O que acontece se o URL de acompanhamento tiver uma URL incorreta que não leve ao seu crm?

Verifique o parâmetro 'siteUrl' no arquivo `data/config.php`. Deve ser configurado como URL do seu EspoCRM acessível a partir do mundo externo.

#### Os e-mails devolvidos não se encontram a ser registrados

Os e-mails devolvidos podem ser manuseados apenas pela conta de e-mail de grupo. Certifique-se de que você tem uma conta de e-mail de grupo que monitorize quais os e-mails enviados para a caixa de correio são enviados.

Além disso, alguns provedores do servidor do correio podem desviar-se dos padrões, por isso os e-mails devolvidos não podem ser distinguidos.
