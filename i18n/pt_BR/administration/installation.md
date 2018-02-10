# Instalação

### Requisitos
EspoCRM é executado na maioria dos fornecedores de hospedagem. Os requisitos são os seguintes:

* PHP 5.6 ou versão mais recente de PHO com pdo habilitado, json, biblioteca GD, extensões mcrypt (normalmente habilitado por padrão);
* MySQL 5.5.3 ou mais recente.

Veja o artigo [Configurações do Servidor](server-configuration.md) para mais informações.

### 1. Baixe o pacote de instalação do EspoCRM
Para baixar a última versão do EspoCRM, acesso o link [página de download](http://www.espocrm.com/download/)

### 2. Faça o upload dos arquivos do EspoCRM para Seu Servidor.

Uma vez que o download esteja concluído, faça o upload do pacote para seu servidor de web. 
Para fazer o upload você pode usar SSH, FTP ou o painel de administração da hospedagem.
Extraia os arquivos para o diretório de seu servidor de web público (ex: `public_html`, `www`, etc.).

_Nota: Para FTP, você precisará extrair os arquivos antes de fazer o upload para seu servidor de web._

### 3. Criar um Banco de Dados MySQL para o EspoCRM usar

Vá para o painel de administração da hospedagem, ou para o SSH, e crie um novo banco de dados e um usuário para o EspoCRM (ex: 'Banco de Dados MySQL' no cPanel).

### 4. Execute o processo de instalação do EspoCRM.

Agora, abra seu navegador e vá para a URL com os arquivos do EspoCRM (ex: 'http://seudominio.com/espo`).

Se você ver essa tela, você teve um erro "Permissão negada". 
Logo, você precisa executar o comando mostrado no terminal através de SSH, ou definir as permissões corretas. 
Deveria ser 755 para diretórios, 644 para arquivos, e 755 para o diretório 'dados'. 
Além disso, tenha certeza que você tem o _proprietário_ e o _grupo_ corretos.

![1](../_static/images/administration/installation/1.png)

Se você ver a tela seguinte, o problema com a permissão foi resolvido e você pode começar a instalação do EspoCRM.

![2](../_static/images/administration/installation/2.png)

Nessa página, você pode ler e aceitar os Termos de Uso.

![3](../_static/images/administration/installation/3.png)

Digite os detalhes para seu recém-criado banco de dados MySQL.

![4](../_static/images/administration/installation/4.png)

Digite o seu nome de usuário e senha de Administrador EspoCRM.

![5](../_static/images/administration/installation/5.png)

Nessa página você pode definir as configurações padrões do EspoCRM, como formato de data e hora, fuso horário, moeda e outros.

![6](../_static/images/administration/installation/6.png)

Digite as configurações SMTP para a saída de emails, se você deseja que seja possível o envio de emails. 
Esse passo pode ser pulado ao clicar no botão _Próximo_. 
Todas essas opções podem ser adicionadas/modificadas no EspoCRM após a instalação.

![7](../_static/images/administration/installation/7.png)

Parabéns! A instalação foi finalizada. 
O último item é configurar as Tarefas Agendadas para serem executadas pelo seu sistema. Isso pode ser feito através da execução 'crontab -e' em linux cli e em _Agendador de Tarefas do Windows_ nos sistemas Windows.

![8](../_static/images/administration/installation/8.png)

Nós esperamos que você fique satisfeito ao trabalhar com o EspoCRM.







