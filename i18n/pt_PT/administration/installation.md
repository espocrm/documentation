# Instalação

### Requisitos
EspoCRM é executado na maioria dos fornecedores de hospedagem. Os requisitos são os seguintes:

* PHP 5.6 ou versão mais recente de PHO com pdo habilitado, json, biblioteca GD, extensões mcrypt (normalmente habilitado por padrão);
* MySQL 5.5.3 ou mais recente.

Vê o artigo [Configurações do Servidor](server-configuration.md) para mais informações.

### 1. Descarrea o pacote de instalação do EspoCRM
Para descarreares a última versão do EspoCRM, acede o link [página de download](http://www.espocrm.com/download/)

### 2. Faz o upload dos arquivos do EspoCRM para o Teu Servidor.

Uma vez que o download esteja concluído, faz o upload do pacote para o teu servidor de web. 
Para fazeres o upload podes usar SSH, FTP ou o painel de administração da hospedagem.
Extrai os arquivos para o diretório do teu servidor de web público (ex: `public_html`, `www`, etc.).

_Nota: Para FTP, precisarás de extrair os arquivos antes de fazer o upload para o teu servidor de web._

### 3. Cria uma Base de Dados MySQL para o EspoCRM usar

Vai para o painel de administração da hospedagem, ou para o SSH, e cria uma nova base de dados e um utilizador para o EspoCRM (ex: 'Base de Dados MySQL' no cPanel).

### 4. Executa o processo de instalação do EspoCRM.

Agora, abre o teu navegador e vai para a URL com os arquivos do EspoCRM (ex: 'http://seudominio.com/espo`).

Se viaulizares este ecrã, é porque deu um erro "Permissão negada". 
Logo, precisas de executar o comando mostrado no terminal através de SSH, ou definir as permissões corretas. 
Deveria ser 755 para diretórios, 644 para arquivos, e 755 para o diretório 'dados'. 
Além disso, tens que ter a certeza que possuis o _proprietário_ e o _grupo_ corretos.

![1](../_static/images/administration/installation/1.png)

Se viaulizares este ecrã seguinte, o problema com a permissão foi resolvido e podes começar a instalação do EspoCRM.

![2](../_static/images/administration/installation/2.png)

Nesta página, podes ler e aceitar os Termos de Uso.

![3](../_static/images/administration/installation/3.png)

Digita os detalhes para tua recém-criada base de dados MySQL.

![4](../_static/images/administration/installation/4.png)

Digita o teu nome de utilizador e senha de Administrador EspoCRM.

![5](../_static/images/administration/installation/5.png)

Nesta página podes definir as configurações padrões do EspoCRM, como formato de data e hora, fuso horário, moeda e outros.

![6](../_static/images/administration/installation/6.png)

Digita as configurações SMTP para a saída de emails, se desejares que seja possível o envio de emails. 
Este passo pode ser saltado ao clicares no botão _Próximo_. 
Todas estas opções podem ser adicionadas/modificadas no EspoCRM após a instalação.

![7](../_static/images/administration/installation/7.png)

Parabéns! A instalação foi finalizada. 
O último item é configurar as Tarefas Agendadas para serem executadas pelo seu sistema. Isto pode ser feito através da execução 'crontab -e' em linux cli e em _Agendador de Tarefas do Windows_ nos sistemas Windows.

![8](../_static/images/administration/installation/8.png)

Nós esperamos que tenhas ficado satisfeito ao trabalhares com o EspoCRM.







