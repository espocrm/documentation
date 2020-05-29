# Gestor de Vendas

## Leads

A Lead representa uma pessoa ou uma organização que atualmente não é um cliente, mas que tem potencial para ser. Criar um registro principal geralmente é o primeiro passo do processo de venda. À medida que mais informações são reunidas sobre a Lead, é suposto que a liderança será convertida em Conta, Contato e Oportunidade.

Novas leads devem ser criadas pelos seguintes cenários:

* Manualmente por usuários de CRM;
* Através da API (por exemplo, através do formulário web);
* Automaticamente por uma regra do fluxo de trabalho.

Ao utilizar [Fluxos de trabalho](../administration/workflows.md), o administrador pode configurar no sistema para aplicar uma regra de atribuição específica aos novos leads, ou seja, Round-Robin e Least-Busy regras. Para fluxos de negócios mais complexos é recomendável utilizar [ferramenta BPM](../administration/bpm.md).
Para evitar a negligência de novas leads, os usuários podem adicionar o tipo de entidade principal à lista de seguimento automático global em Preferências. Então, eles seguirão automaticamente todas as novas leads.

## Oportunidades

A oportunidade representa um acordo potencial ou fechado. A oportunidade com o estágio 'Fechado Won' é levada em consideração para um cálculo de receita de vendas.

Os estágios seguintes estão disponíveis por padrão:

* Prospecção;
* Qualificação;
* Proposta;
* Negociação;
* Fechado Ganhou;
* Fechado Perdido.

O administrador pode definir estágios personalizados dependendo do fluxo de negócios da empresa. Mas não é recomendado remover o estágio 'Fechado Won', pois é usado para calcular uma receita.

## Análise de vendas

Os gráficos a seguir estão disponíveis no painel por padrão:

* Vendas por mês;
* Oportunidades por fonte principal;
* Oportunidades por fase;
* Pipeline de vendas.

Ao utilizar [Ferramenta Relatórios](reports.md), é possível visualizar estatísticas de vendas com base em critérios específicos. Os gráficos de relatório podem ser exibidos no painel.

### Previsão de receita

1. Crie um novo relatório de grade para o tipo de entidade Oportunidade.
2. Adicione 'MONTH: Close Date' ao Grupo de campo.
3. Adicione o campo 'SUM: valor ponderado' para as colunas.
4. Adicione o campo 'Fechar data' ao Filtro de tempo de execução.
5. Selecione o tipo de gráfico 'Barra (vertical)'.

Este relatório mostrará previsões de receita com base em probabilidades de oportunidades.

Os usuários que tenham acesso a este relatório poderão adicioná-lo em seus painéis.
