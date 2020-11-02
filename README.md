# Automation Practice Site and API Fake
Automação do site Practice Automation e API REST Fake

##  Criador
 - [Gabriel Ribeiro Schmitt](https://github.com/gabrielschmitt1)

### Pré-Requisitos

Pré-requisitos:
- Python
- Robotframework
- Robotframework-selenium-library
- Robotframawork-requests

### BAIXAR O PROJETO NO GITHUB

Se não tiver o projeto na máquina, navegue até a pasta que deseja criar:
- `git clone https://github.com/gabrielschmitt1/robotframwork-sitepractice` 

Após baixar o projeto, e instalar o framework
1. `pip install robotframework`

Instale as Library's do projeto
Para testes WEB (SeleniumLibrary)
- `pip install --upgrade robotframework-seleniumlibrary`
Para testes de API (Requests)
- `pip install robotframework-requests`

Para instalar as depencias do projeto já especificadas, execute
- `pip install -r requirements.txt`

### EXECUTAR O PROJETO

1. Executar os testes
Na pasta do seu projeto executar, para os testes de API e Site:
- `robot -d results tests`

Testes da API REST Fake Books 
- `robot -d results tests/API`

Testes do Site Practice
- `robot -d results tests/Web`