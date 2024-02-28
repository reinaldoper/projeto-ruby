# Resumo das Implementações no Projeto

## Requisitos:
- ruby-3.1.4
- sqlite3


## Clone o projeto e execute os comandos:

```shell
bundle install
rails db:migrate
rails db:seed
rails server
```

## Rota de Importação de Filmes
- Foi adicionada uma rota import no controlador de filmes (MoviesController) para permitir a importação de filmes a partir de um arquivo JSON. 
- Ao acessar essa rota, os usuários podem enviar um arquivo contendo dados de filmes para serem processados em segundo plano.

### Exemplo de Uso:

```shell
# POST /movies/import
# Envia um arquivo JSON para importação de filmes em segundo plano
```

### Exemplo do payload .json

```shell
[
  {
    "title": "Inception",
    "director": "Christopher Nolan"
  },
  {
    "title": "The Shawshank Redemption",
    "director": "Frank Darabont"
  },
  {
    "title": "The Godfather",
    "director": "Francis Ford Coppola"
  }
]
```

## Rota de Submissão de Notas em Lote

- Uma rota submit_scores_in_bulk foi introduzida no controlador de filmes (MoviesController) para facilitar a submissão de notas em lote para vários filmes de uma só vez. 
- Os usuários podem acessar essa rota para atribuir notas a diversos filmes simultaneamente.

### Exemplo de Uso:

```shell
# POST /movies/submit_scores_in_bulk
# Submete notas em lote para filmes específicos
```

## Página de Formulário de Importação

- Foi criada uma página de formulário para a importação de filmes. 
- Os usuários podem acessar a rota new_import para exibir o formulário, selecionar um arquivo JSON ou colar dados JSON e, em seguida, iniciar o processo de importação.

### Exemplo de Uso:

```shell
# GET /movies/new_import
# Exibe a página de formulário para importação de filmes
```


## Página de Formulário de Submissão de Notas em Lote

- Uma página de formulário foi implementada para facilitar a submissão de notas em lote. 
- Os usuários podem acessar a rota new_bulk_score_submission para visualizar e preencher o formulário, atribuindo notas a vários filmes de uma vez.

### Exemplo de Uso:

```shell
# GET /movies/new_bulk_score_submission
# Exibe o formulário para a submissão de notas em lote
```

## Validações de Arquivos e Campos

- Foram implementadas validações para garantir a correta manipulação de arquivos e a entrada de dados nos formulários. 
- Mensagens de erro apropriadas são exibidas para orientar os usuários em caso de problemas.
