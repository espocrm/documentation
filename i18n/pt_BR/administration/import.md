# Importar

Importar é acessível somente a usuários administradores. Administração > Importar. Você será capaz de importar somente arquivos CSV.

## Passo 1

Selecione qual o tipo de registro você precisa importar (campo Tipo de Entidade).
Selecione um arquivo CSV. Um arquivo deveria estar formatado com 'UTF-8'.
Selecione 'O que fazer?'. Opções disponíveis: 'Somente Criar', 'Criar & Atualizar', 'Somente Atualizar'.

* `Somente Criar` - selecione se você quiser que o registro seja apenas criado.
* `Criar & Atualizar` - os registros serão criados, mas se registros campo de valores coincidentes forem encontrados, eles serão atualizados. Você será capaz de verificar quais campos coincidir no _Passo 2_.
* `Somente Atualizar` - apenas registros com valores de campos coincidentes serão encontrados e serão atualizados.

Uma vez que você selecionar um arquivo csv, você será capaz de ver como ele deveria ser analisado no painel de pré-visualização. Quando você muda as propriedades, a pré-visualização será atualizada. 

* `Linha do Cabeçalho' - se o arquivo CSV tem a primeira linha com nomes dos campos.
* `Executar em segundo plano' - recomendado se você tem uma grande quantidade de registros a serem importados. Importar será processado através de cron. O estado será definido como 'Completo' quando o processo de importação finalizar.
* `Pular pesquisa por duplicações` - isso vai diminuir o tempo de execução da importação. 

Clique no botão _Próximo_ para seguir para o _Passo 2_.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/import/step-1.png)

## Passo 2

Configure o mapeamento de campo: como os campos correspondem à colunas no arquivo CSV. Você pode pular colunas não necessárias aqui.
Em caso de 'Criar & Atualizar' e 'Somente Atualização' você precisa verificar os campos pelos quais os registros que devem ser atualizados serão encontrados.
Adicione valores padrões novos que você deseja e atualize os registros para defini-los. Ex: você pode especificar os campos Usuário Designado ou Times.

Após completar a importação você será capaz de reverter registros criados, ver duplicatas e atualizar registros. Duplicata significa que existia um registro similar no sistema. Você pode remover todas as duplicatas importadas de uma vez. Nota: Reverter não funciona com registros atualizados.

Clique no botão _Executar Importação_ para seguir. Pode levar algum tempo até que o processo de importação seja finalizado. Se você precisar importar uma grande quantidade de registros (dependendo das configurações do servidor, normalmente mais que 200 registros) você precisa ter certeza que o parâmetro php 'set_time_limit' tem tamanho suficiente.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/import/step-2.png)

## Como importar para Listas Destino

Quando você importa Contatos, Conduções ou Contas, você pode adicioná-las a uma lista destino. No Passo 2 você precisa adicionar o campo Lista Destino no painel 'Valores Padrões' e selecionar um registro de lista destino desejada. Você pode também usar a importação 'Somente Atualizar' ou 'Criar & Atualizar' para adicionar destinos existentes a uma lista destino.
