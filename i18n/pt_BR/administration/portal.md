# Portal

Portal fornece uma capacidade de acessar dados de crm e funções específicas para seus clientes e parceiros. O Administrador pode criar múltiplos portais. Cada portal pode ter suas próprias configurações, painel de controle, lista de usuários, configurações de controle de acesso.

Para criar um portal vá em: Administração > Portais, clique no botão Criar Portal.

* `Está Ativo`. Se não for marcado, o portal não estará disponível para ninguém.
* `É Padrão`. Significa que o portal estará disponível através de uma URL mais curta: http(s)://SUA_ESPO_URL/portal.
* `Funções`. Especifique um ou múltiplas funções do portal que serão aplicados aos usuários logados no portal. Mais informações sobre funções do portal estão abaixo.
* `Lista de Abas`. Abas que serão mostradas na barra de navegação.
* `Layout do Painel de Controle`. Especifica dashlets que serão mostradas na página inicial do portal. Note que os usuários do portal não podem configurar o painel de controle deles.
* `URL`. Campo somente leitura que mostra o link pelo qual você pode acessar o portal.

## Usuários do Portal

Administradores podem criar usuários do portal.

1. Administração > Usuários
2. Clique no menu suspenso à direita próximo a Criar Usuário.
3. Clique em Criar Usuário do Portal.
4. Selecione o contato em que o usuário do portal vai estar ligado.
5. Preencha o formulário e clique em salvar.

O usuário do portal deve estar ligado ao registro do Portal para ser capaz de acessar aquele portal.

## Funções do Portal

As funções do portal são similares à funções regulares no EspoCRM, mas com algumas distinções

* o nível `não-definido` nega um acesso.
* o nível `próprio` significa que o registro é criado pelo usuário. Ex: o usuário do portal empacotou um caso e esse caso é propriedade desse usuário.
* o nível `conta` significa que o registro está relacionado à conta que o usuário do portal está relacionado.
* o nível 'contato' significa que aquele registro está relacionado ao contato que usuário do portal está relacionado.

Os campos Usuário Designado e Times são somente leitura para usuários do portal.

### Exemplo

`Os usuários do portal devem ser capazes de criar casos, ver casos relacionados à conta deles; eles devem ser capazes de ver a base de conhecimentos.`

1. Abra o fomulário Criar Função do Portal (Administração > Funções do Portal > Criar Função).
2. Habilitar acesso aos Casos, defina: `criar - sim, ler - conta, editar - não, apagar - não, transmitir - conta`.
3. Habilitar acesso à Base de Conhecimentos, defina: `criar - não, ler - conta, editar - não, apagar - não`.
4. Editar seu registro no portal (Administração > Portais). Selecione a função de seu portal no campo Funções e então salve.

## Acesso ao Portal

Você pode encontrar a URL para seu portal no campo 'URL' no registro do portal. Também é possível usar as ferramentas de configuração do servidor (como mod_rewrite) para ser capaz de acessar através de uma URL diferente. Nesse caso, você precisa preencher o campo 'URL Personalizada'.

### Acessar o portal através de uma URL Personalizada para servidor Apache

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

Especifique o ID do registro do portal em vez de `{PORTAL_ID}`. O ID do registro do portal está disponível na barra de endereços de seu navegador quando você abre a visualização detalhada do registro do portal. Como em: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 é um ID de registro do portal.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
