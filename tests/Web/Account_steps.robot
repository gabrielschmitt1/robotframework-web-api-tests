*** Settings ***
Resource            ../../resources/Resource.robot
Resource            ../../resources/Pages/Home.robot
Resource            ../../resources/Pages/Carrinho.robot
Resource            ../../resources/Pages/Login.robot
Resource            ../../resources/Pages/Account.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Test Case 01: Adicionar Cliente
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    #Conferir se o cadastro foi efetuado com sucesso