# CineFavorite - Formativa
Construindo um aplicativo do Zero - O CineFavorite permitirá criar uma conta e buscar filmes em uma api e montar uma galeria pessoal de filmes favoritos, com capas e notas.

## Objetivos
- Integrar o Aplicativo a uam API
- Criar uma conta pessoal no FireBase
- Armazenar informações para Cada usuários das preferencias solicitadas
- consultar informações de Filmes (Capas, Título)

## Levantamentos de Requisitos

- Funcionais

- Não Funcionais

## Diagramas

1. ### Diagrama de Classe
    Diagrama de que demonstra as entidades da aplicação

    - usuário (user) : classe criada pelo FireBase
        - email
        - senha
        - id
        - create()
        - login()
        - logout()

    - Filme (Movie) : Classe modelada pelo dev
        - number id:
        - String titulo:
        - String PosterPath
        - boolean favorito
        - double Nota
        - adicionar()
        - update()
        - remover()
        - listarFavoritos()

```mermaid

classDiagram
    class User{
        +String uid
        +String email
        +String password
        +createUser()
        +login()
        +logout()
    }

    class Movie{
        +String id
        +String title
        +String posterPath
        +Boolean Favorite
        +double Rating
        +addFavorite()
        +removeFavorite()
        +updateRating()
        +read()
    } 

    User "1"--"1+" Movie : "selecionar"

```
 2. ### Diagrama de Uso

Ações que o Atores fazem

- Usúario:
- Registrar
- Login
- Logout
- Buscar filmes na API  
- Adicionar aos Favoritos
- Dar nota ao filmes
- Remover dos Favoritos

```mermaid

graph TD
subgraph "Ações"
    uc1([Registrar])
    uc2([Login])
    uc3([LogOut])
    uc4([Search Movie])
    uc5([Favorite Movie])
    uc6([Rating Movie])
    c7([Remove Favorite Movie])
    end

    User([Usuario])

      user --> uc1
      user --> uc2
      user --> uc3
      user --> uc4
      user --> uc5
      user --> uc6
      user --> uc7

     uc1 --> uc2
     uc2 --> uc4
     uc2 --> uc5
     uc2 --> uc6
     uc2 --> uc7

  
```



 3. ### Diagrama de Fluxo

Determina o caminho que o ator percorre para realizar uma ação

- Ação de Login

```mermaid

A[Inicio] -->B{Tela de Login}
B -->C[Inserir email e senha]
C -->D[Validar as Credenciais do Usuario]
D -->SIM --> E[Tela de favoritos]
D -->Não --> F[Mensagem de Erro]

```

## Prototipagem

-- o Link do figma 
https://www.figma.com/design/Ef8i8DwEmk4RRhRDk9Jqwe/Untitled?node-id=0-1&t=DiWU1UKUDnZTi8sQ-1

## Codificação
