*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${HOME_URL}                 http://automationpractice.com
${HOME_TITLE}               My Store
${HOME_FIELD_PESQUISAR}     name=search_query
${HOME_BTN_PESQUISAR}       name=submit_search
${HOME_TOPMENU}             xpath=//*[@id="block_top_menu"]/ul
${HOME_PRODUCT}             xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
${HOME_BTN_ADDCART}         xpath=//*[@id="add_to_cart"]/button
${HOME_BTN_CHECKOUT}        xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
${HOME_EL_SIGIN}            xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

*** Keywords ***
#### Ações
Adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to Cart" do produto
    Clicar no botão "Proceed to checkout"

Acessar a página home do site
    Go To                           ${HOME_URL}
    Wait Until Element Is Visible   ${HOME_TOPMENU}
    Title Should Be                 ${HOME_TITLE}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                      ${HOME_FIELD_PESQUISAR}    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                   ${HOME_BTN_PESQUISAR}

Clicar no botão "Add to Cart" do produto
    Wait Until Element Is Visible   ${HOME_PRODUCT}
    Click Element                   ${HOME_PRODUCT}
    Wait Until Element Is Visible   ${HOME_BTN_ADDCART}
    Click Button                    ${HOME_BTN_ADDCART}

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible   ${HOME_BTN_CHECKOUT}
    Click Element                   ${HOME_BTN_CHECKOUT}

Clicar em "Sign in"
    Click Element                   ${HOME_EL_SIGIN}    

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link        xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Conferir mensagem de erro "${MESSAGE}"
    Wait Until Element Is Visible   xpath=//p[@class='alert alert-warning']
    Element Text Should Be          xpath=//p[@class='alert alert-warning']     ${MESSAGE}

Quando eu passo o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias.
    Mouse Over                      xpath=//a[@title='Women']
    Page Should Contain Link        xpath=//a[@title='Tops']

E Clico na sub categoria "${SUB_CATEGORIA}"
    Click Link                      xpath=//a[@title='Summer Dresses']

Então a página com os produtos da categoria selecionada deve ser exibida.
    Wait Until Element Is Visible   xpath=//div[@class='cat_desc']//span[1]
    Element Should Be Visible       xpath=//div[@class='cat_desc']//span[1]

Então a tela do carrinho deve ser exibida com seus dados
    Wait Until Element Is Visible   xpath=//span[text()=' Summary']
    Title Should Be                 Order - My Store
    Element Should Be Visible       xpath=//span[text()=' Summary']

