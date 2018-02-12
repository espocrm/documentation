# Importar

Importar é acessível somente a utilizadores administradores. Administração > Importar. Serás capaz de importar somente arquivos CSV.

## Passo 1

Seleciona qual o tipo de registro que precisas importar (campo Tipo de Entidade).
Seleciona um arquivo CSV. Um arquivo deveria estar formatado com 'UTF-8'.
Seleciona 'O que fazer?'. Opções disponíveis: 'Somente Criar', 'Criar & Atualizar', 'Somente Atualizar'.

* `Somente Criar` - seleciona se quiseres que o registro seja apenas criado.
* `Criar & Atualizar` - os registros serão criados, mas se forem encontrados registros de campo de valores coincidentes, eles serão atualizados. Serás capaz de verificar quais os campos que coincidirem no _Passo 2_.
* `Somente Atualizar` - apenas registros com valores de campos coincidentes serão encontrados e serão atualizados.

Uma vez que selecionares um arquivo csv, serás capaz de ver como ele deveria ser analisado no painel de pré-visualização. Quando mudares as propriedades, a pré-visualização será atualizada. 

* `Linha do Cabeçalho' - se o arquivo CSV tem a primeira linha com nomes dos campos.
* `Executar em segundo plano' - recomendado se tiveres uma grande quantidade de registros a serem importados. Importar será processado através de cron. O estado será definido como 'Completo' quando o processo de importação finalizar.
* `Saltar pesquisa por duplicações` - isto vai diminuir o tempo de execução da importação. 

Clica no botão _Próximo_ para seguir para o _Passo 2_.

![1](../_static/images/administration/import/step-1.png)

## Passo 2

Configura o mapeamento do campo: como os campos correspondem a colunas no arquivo CSV. Podes saltar as colunas não necessárias aqui.
Em caso de 'Criar & Atualizar' e 'Somente Atualização' precisas de verificar os campos pelos quais os registros que devem ser atualizados serão encontrados.
Adiciona valores padrões novos que tu desejas e atualiza os registros para defini-los. Ex: podes especificar os campos Utilizador Designado ou Equipas.

Após completar a importação tu serás capaz de reverter registros criados, ver duplicatas e atualizar registros. Duplicata significa que existia um registro similar no sistema. Podes remover todas as duplicatas importadas de uma vez. Nota: Reverter não funciona com registros atualizados.

Clica no botão _Executar Importação_ para seguir. Pode levar algum tempo até que o processo de importação seja finalizado. Se precisares de importar uma grande quantidade de registros (dependendo das configurações do servidor, normalmente mais que 200 registros) precisas de ter a certeza que o parâmetro php 'set_time_limit' tem tamanho suficiente.

![2](../_static/images/administration/import/step-2.png)

## Como importar para Listas Destino

Quando importares Contatos, Conduções ou Contas, podes adicioná-las a uma lista destino. No Passo 2 precisas de adicionar o campo Lista Destino no painel 'Valores Padrões' e selecionar um registro de lista destino desejada. Podes também usar a importação 'Somente Atualizar' ou 'Criar & Atualizar' para adicionar destinos existentes a uma lista destino.
