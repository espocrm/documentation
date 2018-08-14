# Pacotes de extensão

As extensões permitem adicionar funcionalidades adicionais ao EspoCRM. Elas podem ser instaladas pelo painel Administrador na seção `Personalização`.



## Como criar o pacote de extensão

Uma estrutura de Arquivo do pacote:

* `/manifest.json` – um arquivo que contém propriedades de extensão;
* `/files` – um diretório que contém os arquivos de extensão;
* `/scripts` – contém os scripts da extensão.

### Manifesto
```json
{
 "nome": "Nome da Extensão",
 "versão": "1.0.0",
 "acceptableVersions": [
   ">=3.7.2"
 ],
 "releaseDate": "2015-10-15",
 "autor": "Teu Nome",
 "descrição": "Descrição da sua extensão",
 "eliminar": []
}
```

* A Sintaxe da `versão' e 'acceptableVersions` é descrita pela especificação v2.0.0 encontrada em http://semver.org.
* `eliminar` - é a lista de arquivos principais que precisam ser excluídos. Este parâmetro não é recomendado para usar. Tu podes omiti-lo.

### Arquivos

Todos os arquivos de extensão devem ser colocados no diretório `arquivos`. Eles serão copiados para o diretório principal do EspoCRM.

### Scripts

Para diferentes fins, o EspoCRM suporta os seguintes tipos de scripts. Todos devem ser inseridos no diretório `scripts`.

* `BeforeInstall.php` – um script executado antes de um processo de instalação;
* `AfterInstall.php` – executado uma vez finalizado o processo de instalação;
* `BeforeUninstall.php` – executado antes do processo de desinstalação;
* `AfterUninstall.php` – executado uma vez que o processo de desinstalação está concluído.

Exemplo:

```php
class AfterInstall
{
  public function run($conatiner)
  {
    $config = $conatiner->get('config');
 
    $tabList = $config->get('tabList');
    if (!in_array('My Custom Entity', $tabList)) {
      $tabList[] = 'My Custom Entity';
      $config->set('tabList', $tabList);
    }
 
    $config->save();
  }
}
```

### Pacote

No final, precisamos empacotar todos estes arquivos num arquivo .z
