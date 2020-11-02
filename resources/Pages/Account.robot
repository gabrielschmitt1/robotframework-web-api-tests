*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${ACCOUNT_SUB_TITLE}        xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${ACCOUNT_CHECKBOX_MRS}     id=id_gender2
${ACCOUNT_FIRSTNAME}        id=customer_firstname
${ACCOUNT_LASTNAME}         id=customer_lastname
${ACCOUNT_PASSWORD}         id=passwd
${ACCOUNT_ADDRESS}          id=address1
${ACCOUNT_CITY}             id=city
${ACCOUNT_STATE}            id=id_state
${ACCOUNT_POSTCODE}         id=postcode
${ACCOUNT_PHONE}            id=phone_mobile
${ACCOUNT_SUBMIT}           submitAccount

*** Keywords ***
Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${ACCOUNT_SUB_TITLE}   
    Click Element                   ${ACCOUNT_CHECKBOX_MRS}             
    Input Text                      ${ACCOUNT_FIRSTNAME}        Gabriel
    Input Text                      ${ACCOUNT_LASTNAME}         Schmitt
    Input Text                      ${ACCOUNT_PASSWORD}         123456
    Input Text                      ${ACCOUNT_ADDRESS}          Rua Robot, Bairro Framework
    Input Text                      ${ACCOUNT_CITY}             Brasilia
    Set Focus To Element            ${ACCOUNT_STATE}
### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   ${ACCOUNT_STATE}
    Select From List By Index       ${ACCOUNT_STATE}         9
    Input Text                      ${ACCOUNT_POST_CODE}     12345
    Input Text                      ${ACCOUNT_PHONE}         99988877

Submeter cadastro
    Click Button      ${ACCOUNT_SUBMIT}

### Conferências
# Conferir se o cadastro foi efetuado com sucesso
#     Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
#     Element Text Should Be           xpath=//*[@id="center_column"]/p
# ...     Welcome to your account. Here you can manage all of your personal information and orders.
#     Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    May Fernandes
