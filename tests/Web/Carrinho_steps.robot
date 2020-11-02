*** Settings ***
Resource            ../../resources/Resource.robot
Resource            ../../resources/Pages/Home.robot
Resource            ../../resources/Pages/Carrinho.robot
Resource            ../../resources/Pages/Login.robot
Resource            ../../resources/Pages/Account.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Test Case 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio