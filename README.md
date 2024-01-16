## Instruções de uso das API's e banco de dados em container

1. Após clonar este repositório, clone os repositórios abaixo dentro da pasta `apis`:
  - Usuários: https://github.com/tiagolopesdev/scage-users-api.git
  - Escalas: https://github.com/tiagolopesdev/scage-scale-api.git

2. Após o clone, acesse cada repositório, via terminal, e mude para branch `develop`, exemplo:
    - Acessando o repositório: `cd .\apis\scage-scale-api\`
    - Mudando de branch `git checkout develop`

2. Certifique-se que a string de conexão (a string de conexão se encontra no arquivo appsettings.json) está da seguinte forma: `"DefaultConnection": "server=database;database=scage;uid=root;pwd=bd1374"`

3. No terminal, execute o seguinte comando: `docker-compose -f .\docker-compose.yml up -d`