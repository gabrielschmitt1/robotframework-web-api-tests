*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL_API}      https://fakerestapi.azurewebsites.net
&{BOOK_15}      id=15
...             title=Book 15
...             pageCount=1500
&{BOOK_201}     id=201
...             title=Meu novo Book
...             description=Meu novo livro conta coisas fantásticas
...             pageCount=523
...             excerpt=Meu Novo livro é massa
...             publishDate=2018-04-26T17:58:14.765Z
&{BOOK_150}     id=150
...             title=Book 150 alterado
...             description=Descrição do book 150 alteada
...             pageCount=600
...             excerpt=Resumo do book 150 alteado
...             publishDate=2017-04-26T15:58:14.765Z

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

#### Ações
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    api/v1/Books
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    api/v1/Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro
    ${RESPOSTA}    Post Request   fakeAPI    api/v1/Books
    ...                           data={"id": ${BOOK_201.id},"title": "${BOOK_201.title}","description": "${BOOK_201.description}","pageCount": ${BOOK_201.pageCount},"excerpt": "${BOOK_201.excerpt}","publishDate": "${BOOK_201.publishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Alterar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Put Request    fakeAPI    api/v1/Books/${ID_LIVRO}
    ...                           data={"id": ${BOOK_150.id},"title": "${BOOK_150.title}","description": "${BOOK_150.description}","pageCount": ${BOOK_150.pageCount},"excerpt": "${BOOK_150.excerpt}","publishDate": "${BOOK_150.publishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Excluir o livro "${ID_LIVRO}"
    ${RESPOSTA}    Delete Request    fakeAPI    api/v1/Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

#### Conferências
Conferir o status code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be      ${RESPOSTA.json()}     ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_15.pageCount}
    Should Not Be Empty    ${RESPOSTA.json()["description"]}
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados do livro "${ID_LIVRO}"
    Conferir livro    ${ID_LIVRO}

Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    Conferir livro    ${ID_LIVRO}

Conferir livro
    [Arguments]     ${ID_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_${ID_LIVRO}.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_${ID_LIVRO}.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${BOOK_${ID_LIVRO}.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_${ID_LIVRO}.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${BOOK_${ID_LIVRO}.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${BOOK_${ID_LIVRO}.publishDate}

Conferir se excluiu o livro "${ID_LIVRO}"
    Should Be Empty     ${RESPOSTA.content}
