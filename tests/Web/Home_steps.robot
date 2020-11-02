*** Settings ***
Resource            ../../resources/Resource.robot
Resource            ../../resources/Pages/Home.robot
Resource            ../../resources/Pages/Carrinho.robot
Resource            ../../resources/Pages/Login.robot
Resource            ../../resources/Pages/Account.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Cenário 01: Pesquisar Produtos Existentes
    Dado que estou na página home do site
    Quando eu pesquiso pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca 

Cenário 02: Pesquisar Produtos não Existentes
    Dado que estou na página home do site
    Quando eu pesquiso pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

Cenário 03: Listar Produtos
    Dado que estou na página home do site
    Quando eu passo o mouse por cima da categoria "Women" no menu principal superior de categorias.
    E Clico na sub categoria "Summer Dresses"
    Então a página com os produtos da categoria selecionada deve ser exibida. 

Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquiso pelo produto "t-shirt"
    E Clico no botão "Add to cart" do produto.
    E Clico no botão "Proceed to checkout"
    Então a tela do carrinho deve ser exibida com seus dados

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquiso pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MESSAGE}"
    Conferir mensagem de erro "${MESSAGE}"

E Clico no botão "Add to cart" do produto.
    Clicar no botão "Add to Cart" do produto

E Clico no botão "Proceed to checkout"
    Clicar no botão "Proceed to checkout"

