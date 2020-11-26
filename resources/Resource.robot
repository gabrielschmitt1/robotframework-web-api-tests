*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
### Opções necessárias para rodar headless no Linux do CI (runner)
##${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}    #options=${OPTIONS}
    Maximize Browser Window

Fechar navegador
    Close Browser
#### Ações
