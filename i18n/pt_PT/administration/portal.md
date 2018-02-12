# Portal

Portal fornece uma capacidade de aceder dados de crm e funções específicas para os teus clientes e parceiros. O Administrador pode criar múltiplos portais. Cada portal pode ter as suas próprias configurações, painel de controle, lista de utilizadores, configurações de controle de acesso.

Para criar um portal vai em: Administração > Portais, clica no botão Criar Portal.

* `Está Ativo`. Se não for marcado, o portal não estará disponível para ninguém.
* `É Padrão`. Significa que o portal estará disponível através de uma URL mais curta: http(s)://SUA_ESPO_URL/portal.
* `Funções`. Especifica uma ou múltiplas funções do portal que serão aplicadas aos utilizadores ligados no portal. Mais informações sobre funções do portal estão a abaixo.
* `Lista de Abas`. Abas que serão mostradas na barra de navegação.
* `Layout do Painel de Controle`. Especifica dashlets que serão mostradas na página inicial do portal. Nota que os utilizadores do portal não podem configurar o painel de controle deles.
* `URL`. Campo somente leitura que mostra o link pelo qual tu podes aceder o portal.

## Utilizadores do Portal

Administradores podem criar utilizadores do portal.

1. Administração > Utilizadores
2. Clica no menu suspenso à direita próximo a Criar Utilizador.
3. Clica em Criar Utilizador do Portal.
4. Seleciona o contato em que o utilizador do portal vai estar ligado.
5. Preenche o formulário e clica em guardar.

O utilizador do portal deve estar ligado ao registro do Portal para ser capaz de aceder aquele portal.

## Funções do Portal

As funções do portal são similares à funções regulares no EspoCRM, mas com algumas distinções

* o nível `não-definido` nega um acesso.
* o nível `próprio` significa que o registro é criado pelo utilizador. Ex: o utilizador do portal empacotou um caso e este caso é propriedade deste utilizador.
* o nível `conta` significa que o registro está relacionado à conta que o utilizador do portal está relacionado.
* o nível 'contato' significa que aquele registro está relacionado ao contato que o utilizador do portal está relacionado.

Os campos Utilizador Designado e Equipas são somente de leitura para utilizadores do portal.

### Exemplo

`Os utilizadores do portal devem ser capazes de criar casos, ver casos relacionados à conta deles; eles devem ser capazes de ver a base de conhecimentos.`

1. Abre o fomulário Criar Função do Portal (Administração > Funções do Portal > Criar Função).
2. Habilitar acesso aos Casos, define: `criar - sim, ler - conta, editar - não, apagar - não, transmitir - conta`.
3. Habilitar acesso à Base de Conhecimentos, define: `criar - não, ler - conta, editar - não, apagar - não`.
4. Editar o seu registro no portal (Administração > Portais). Seleciona a função do teu portal no campo Funções e depois grave.

## Acesso ao Portal

Podes encontrar a URL para o teu portal no campo 'URL' no registro do portal. Também é possível usares as ferramentas de configuração do servidor (como mod_rewrite) para seres capaz de aceder através de uma URL diferente. Neste caso, precisas de preencher o campo 'URL Personalizada'.

### Aceder o portal através de uma URL Personalizada para servidor Apache

URL Personalizada: my-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName my-portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias my-portal-host-name.com

```

#### Regras de sobrescrita mod

Especifiqua o ID do registro do portal em vez de `{PORTAL_ID}`. O ID do registro do portal está disponível na barra de endereços do teu navegador quando abres a visualização detalhada do registro do portal. Como em: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 é um ID de registro do portal.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
