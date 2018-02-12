#Configurando EspoCRM para B2C (Business-to-Client)

Por padrão, EspoCRM está configurado para ser usado como negócios B2B. Entretanto, tu podes facilmente configurá-lo para B2C.

* Muda `b2cMode` para 'true' no seu arquivo de configuração `data/config.php`. Desde a versão 4.3.0, isto pode ser configurado em Administration > Seetings.
* Remove a aba *Account* do menu de navegação (Administration > User Interface).
* Remove os campos *Account* dos seus layouts (Administation > Layout Manager).
* Desabilita o acesso para o escopo *Account* para todas as suas funções (Administration > Roles).
* Remove a conta das listas de seleção para todos os campos principais (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
