# Cinemateque

Cinemateque é uma app web para gestão de salas de cinema, com recursos para
cadastro de cinemas e suas salas e cadastro de filmes em exibição.

Esta aplicação faz parte das entrevistas técnicas do programa TreinaDev. Você
receberá mais instruções da equipe da Campus Code, neste documento você vai
encontrar instruções sobre como instalar e executar o projeto em seu computador.

## Pré requisitos

Para executar o Cinemateque você deve ter instalado:

- Ruby 3.3.5
- SQLite

## Configuração

Para instalar o projeto, faça o `git clone` e, dentro do diretório `cinemateque`
execute:

- `bin/setup`

Ao fim da execução a aplicação já estará em execução em `htt://localhost:3000`

## Testes

Para executar todos os testes, execute:

- `bundle exec rspec`

## Execução

Para executar o projeto em seu computador, você deve utilizar o comando
`bin/dev`. Este comando irá instalar a gem `foreman` e executar o arquivo
`Procfile.dev`.

Dentro do arquivo `Procfile.dev` existem 2 comandos: o `rails server` para
executar a aplicação Rails e outro comando que garante que os recursos de
front-end do projeto serão compilados e atualizados caso sejam modificados
durante a navegação.


# cadastrar sessões

filme(movie_id)
day_of_week(enum: integer)
horario:(time)

- página de listagem de sessões;
ver todas as sessões de um cinema
remover / criar sessão

sala has_many: sessions

um usuário acessa página de listagem de sessões
testes 1:
ok e deve estar logado 
ok e se nao houver sessões cadastradas diz que ainda não existem e tem o botão de cadastrar nova
se houver, mostra as existentes e a opção de remover e de cadastrar
usuário acessa página de listagem e adiciona nova sessão com sucesso
usuário falha ao cadastrar sessão por ausencia de dados
usuário remove sessão com sucesso



