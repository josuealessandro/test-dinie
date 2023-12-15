# Teste para vaga da Dinie

## Requisitos
#### Ruby 3.0.2
#### Rails 7.1.2
#### Bundler 2.4.22
#### SQLite 3

## Preparação do ambiente
```
bundle install
rails db:create
rails db:migrate
rails db:seed
```

## Execução do ambiente

para execução do servidor
```
rails serve
```
após a inicialiização do servidor a aplicação está rodando nesse link http://localhost:3000/customers

para execução do console
```
rails c
```

para execução dos testes
```
rspec
```