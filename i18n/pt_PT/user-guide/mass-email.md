# Correo Electrónico Massivo

## Como enviar e-mails massivos

Necesitas de ter pelo menos uma Lista de Destinos com registros de destinos e um Modelo de E-mail na tua crm.

1. Cria uma nova campanha com um `E-mail` ou `Newsletter`. Seleciona uma ou algumas listas de destinos no campo `Listas de Destino`.

2. Depois de o registro da campanha estiver criado, cria um E-mail Massivo para esta campanha: Faz mais um clique  no painel de E-mail Massivo. Especifica _Data de Inicio_ - de quando se devem enviar os e-mails, e seleciona _Modelo de E-mailo_. certifica-te que o _Estado_ está configurado como `Pendente`.

Se tiver tudo configurado corretamente, os e-mails devem desligar-se. Devem ser enviados a cada hora em parcelas (podes alterar o tamanho da parcela em Administração> E-mails de Saída). O administrador pode alterá-lo atualizando o campo `Programación` de la tarea programada `Verificar Cuentas de Correo Electrónico Grupales`.

Se tudo estiver configurado corretamente, os e-mails devem ser desligados. Eles devem ser enviados a cada hora com porções (você pode alterar o tamanho da parcela em Administração> E-mails de saída). O administrador pode alterá-lo atualizando o campo `Aendamento` da tarefa agendada 'Verifique as Contas de E-mail do Grupo'.

Podes verificar se os e-mails são enviados no painel de registro.

## Testa o que vai ser enviado aos destinatários

Clica no menu suspenso direito na linha de e-mail massivo no painel _E-mail Massivo_ e em seguida, clica em _Enviar teste_.

## Iniciar Sessão

No registro podes ver:
* E-mail enviado;
* E-mails abertos pelo destinatário;
* Links clicados pelo destinatário;
* Destinatários que optaram por sair;
* Mensagens de E-mails devolvidos (não foram entregues ao destinatário).

## Link de exclusão

De uma maneira predefinida, o sistema agregará a opção de exclusão voluntária a todos os e-mails enviados. Mas podes usar um personalizado no teu Modelo de E-mail.

Exemplo:
```html
<a href="{optOutUrl}">Cancelar a subscrição da lista de correio.</a>
```

O administrador pode desabilitar o link de exclusão obrigatória que está a ser adicionado pelo sistema em Administração> E-mails de Saída.

## URL de Acompanhamento

Se tu quiseres saber se o teu destinatário abriu o link do teu e-mail, precisas de criar um URL de acompanhamento. Especifica qualquer _Nome_ e _URL_ para onde o teu link deve conduzir. Então, precisas de colocar o código gerado no teu Modelo de E-mail.

Exemplo:
  ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Testa a nossa demonstração</a>
  ```

## Listas de Destinos

As Listas de Destinos contêm as listas de contas, Contatos, Potenciais Clientes r Registros de Utilizadores.

Os utilizadores podem preencher manualmente as listas de destinos usando a ação _Selecionar_ no painel correspondente na exibição de detalhes da Lista de Destinos. Existe a capacidade de fazer filtragem e em seguida selecionar todos os resultados da pesquisa.

## Preencher Listas de Destinos com Relatórios

O recurso de [Relatórios](reports.md#syncing-with-target-lists) fornece a capacidade de preencher as listas de destino com registros que correspondem a critérios específicos.

## Excluir Listas de Destinos

Especifica a Exclusão de Listas de Destinos para evitar o envio de email massivo para determinados destinatários. Se houver um registro com o endereço de e-mail que corresponda ao endereço de e-mail de qualquer registro excluído, o primeiro registro também será excluído.

## Registro de Campanha

No Registro de Campanhas, podes consultar os e-mails que foram enviados, e-mails abertos, e-mails devolvidos, os que optaram por sair e quem clicou no link do e-mail. É possível utilizares este log criando Lista de Destinos (menu suspenso no canto superior direito no painel) com base nos registros do log. Por exemplo, podes escolher apenas contatos que clicaram no link (URL de rastreamento).

## Solução de Problemas

_Para os Administradores_

#### ¿Que fazer se os e-mails não são enviados?

1. Verifica se funciona _Envio de Teste_. Se não funcionar, verifica se as configurações de SMTP do sistema estão corretas.
2. Verifica se configuraste o cron para o teu sistema.
3. Verifica se tens o Trabalho Proramado de `Enviar e-mails massivos` e está `Ativo` (Administração > Trabalhos Programados > Enviar E-mails Massivos). Verifique se há alguma coisa no Log.

#### ¿O que acontece se o URL de acompanhamento tiver uma URL incorreta que não leve ao seu crm?

Verifica o parâmetro 'siteUrl' no arquivo `data/config.php`. Deve ser configurado como URL do teu EspoCRM acessível a partir do mundo externo.

#### Os e-mails devolvidos não se encontram a ser registrados

Os e-mails devolvidos podem ser manuseados apenas pela conta de e-mail de grupo. Certifica-te de que tens uma conta de e-mail de grupo que monitorize quais os e-mails enviados para a caixa de correio são enviados.

Além disso, alguns provedores do servidor do correio podem desviar-se dos padrões, por isso os e-mails devolvidos não podem ser distinguidos.
