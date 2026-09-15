# RottenPotatoes

Aplicação de catálogo de filmes desenvolvida em Ruby on Rails
para o Homework 2, partes 1 e 2.

Permite cadastrar, listar, visualizar, editar e excluir filmes.
Possui validações de título, classificação e data de lançamento,
além de ordenação por título ou data, com destaque visual da
coluna selecionada. Utiliza SQLite, views em Haml e testes
automatizados com Minitest.

## Pré-requisitos

- Ruby 3.3.12
- Rails 8.1.3.1
- Git

Demais dependências são instalados com `bundle install`.
O banco utilizado é SQLite.

## Como executar o projeto

### Clonar o repositório

```bash
git clone https://github.com/annalujansen/rottenpotatoes.git
cd rottenpotatoes
```

### Instalar as dependências

Na pasta do projeto, execute:

```bash
bundle install
```

### Preparar o banco de dados

Execute:

```bash
bin/rails db:prepare
bin/rails db:seed
```

### Executar os testes

Execute:

```bash
bin/rails test
```

### Iniciar o servidor

Execute:

```bash
bin/rails server
```

Depois, acesse no navegador:

http://localhost:3000/movies