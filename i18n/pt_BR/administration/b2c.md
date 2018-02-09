#Configurando EspoCRM para B2C (Business-to-Client)

Por padrão, EspoCRM está configurado para usar como negócios B2B. Entretanto, você pode facilmente configurá-lo para B2C.

* Mude `b2cMode` para 'true' em seu arquivo de configuração `data/config.php`. Desde a versão 4.3.0, isso pode ser configurado em Administration > Seetings.
* Remova a aba *Account* do menu de navegação (Administration > User Interface).
* Remova os campos *Account* de seus layouts (Administation > Layout Manager).
* Disabilite um acesso para o escopo *Account* para todas as suas funções (Administration > Roles).
* Remova a conta das listas de seleção para todos os campos principais (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
