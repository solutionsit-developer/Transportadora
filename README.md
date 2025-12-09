# 🚛 Transportadora

Sistema Web desenvolvido com Django e MySQL para gerenciamento de clientes, motoristas, pedidos e entregas de uma transportadora.

## 💡 Sobre o Projeto

Este projeto foi criado como parte da disciplina de Práticas Extensionistas III, com foco em banco de dados relacionais, autenticação, formulários e interface web utilizando o framework Django.

A aplicação permite o cadastro e gerenciamento de clientes e motoristas, além de conter um formulário de contato e autenticação de usuários com login e logout. O sistema conta com uma interface responsiva desenvolvida com Bootstrap.

## 🔐 Funcionalidades

- Autenticação de usuários (login e logout)
- Cadastro unificado de Cliente e Motorista
- Listagem, edição e exclusão de registros (CRUD)
- Interface de contato com os desenvolvedores
- Interface com Bootstrap responsiva
- Banco de dados relacional em MySQL

## 🧰 Requisitos

- Python 3.10 ou superior
- Django 4.x
- MySQL
- Bootstrap 5
- Arquivo `.env` com variáveis sensíveis

## ⚙️ Como Executar Localmente

### 1. Clone o repositório

```bash
git clone https://github.com/solutionsit-developer/Transportadora.git
cd Transportadora
```

### 2. Crie e ative o ambiente virtual

```bash
python -m venv venv
venv\Scripts\activate  # Para Windows
```

### 3. Instale as dependências

```bash
pip install -r requirements.txt
```

### 4. Configure o arquivo `.env`

Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```
DB_NAME=transportadora_db
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_HOST=localhost
DB_PORT=3306
SECRET_KEY=sua_chave_secreta_django
```

### 5. Aplique as migrações

```bash
python manage.py migrate
```

### 6. Execute o servidor

```bash
python manage.py runserver
```

Abra o navegador e acesse `http://localhost:8000`.

## 🗃️ Estrutura do Banco de Dados

O banco foi modelado de forma relacional em MySQL, com as seguintes tabelas:

- **Cliente**: Armazena dados pessoais e empresariais dos clientes.
- **Motorista**: Contém dados dos motoristas, inclusive CNH.
- **Pedido**: Representa pedidos feitos por clientes, com previsão e status de entrega.
- **Entrega**: Registra os dados das entregas realizadas, motoristas envolvidos e CT-e.

As tabelas estão relacionadas com chaves estrangeiras, garantindo integridade referencial. O banco foi criado no MySQL Workbench e testado com dados de exemplo.

## 🖼️ Interface Web

A interface foi desenvolvida com Django + Bootstrap 5. Conta com:

- Tela de login
- Cadastro de usuários
- Página inicial com menu de navegação
- CRUD completo para clientes
- Formulário de contato com os desenvolvedores
- Validações de formulário com mensagens de sucesso

**Observação:** as interfaces de Pedido e Entrega estão desativadas na navegação, pois ainda não foram implementadas.

## 📬 Contato com Desenvolvedores

Usuários autenticados podem acessar um formulário de contato para enviar mensagens diretamente à equipe de desenvolvimento. Após o envio, uma mensagem de sucesso é exibida e o usuário é redirecionado para a página inicial.

## Desenvolvedores

- Ana Clara Perosa  
- Tiago Pegorini
