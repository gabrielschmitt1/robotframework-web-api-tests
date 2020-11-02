*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${LOGIN_CREATE_EMAIL}          id=email_create
${LOGIN_SUBMIT}                id=SubmitCreate                 

*** Keywords ***
Informar um e-mail válido
    Wait Until Element Is Visible   ${LOGIN_CREATE_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${LOGIN_CREATE_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button              ${LOGIN_SUBMIT}    
