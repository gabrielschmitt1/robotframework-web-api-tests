*** Settings ***
Library  Collections
Library  DiffLibrary
Library  OperatingSystem
Library  String

*** Variables ***
${datadir}  ${CURDIR}${/}data

*** Test Cases ***
Cenario 01: Comparando dois arquivos iguais
    Diffing two files that are the same

Cenario 02: Comparando dois arquivos sendo um diferente
    Diffing two files one being different

Cenario 03: Comparando arquivos onde um não existe
    Diff two files one doesnt exist

Cenario 04: Comparando arquivos sendo que o segundo é diferente
    Diff two files as the second file is different  

Cenario 05: Comparando dois arquivos com conteudo diferente no segundo
    Diff two files with content as the second file is different  

Cenario 06: Comparando duas saidas
    Diff two outputs

*** Keywords ***
Diffing two files that are the same
    Diff Files  ${datadir}/input/diff1.txt  ${datadir}/input/diff2.txt

Diffing two files one being different
    Run Keyword And Expect Error  differences*  Diff Files  ${datadir}/input/diff3.txt  ${datadir}/input/diff2.txt

Diff two files one doesnt exist
    Run Keyword And Expect Error  *doesn't*  Diff Files  ${datadir}/input/diff2.txt  ${datadir}${datadir}/input/diff4.txt

Diff two files as the second file is different
    Run Keyword And Expect Error  *differences*  Diff Files  ${datadir}/input/diff2.txt  ${datadir}/input/diff3.txt

Diff two files with content as the second file is different
    ${filename} =  Generate Random String   8  [LOWER]
    ${content} =  Get File  ${datadir}/input/diff1.txt
    Create File  ${TEMPDIR}/${filename}.txt  ${content}
    Run Keyword And Expect Error  *differences*   Diff Files  ${TEMPDIR}/${filename}.txt   ${datadir}/input/diff3.txt
    Remove File  ${TEMPDIR}/${filename}.txt

Diff two outputs
    ${text1} =  Get File  ${datadir}/input/diff1.txt
    ${text2} =  Get File  ${datadir}/input/diff2.txt
    Diff Outputs  ${text1}   ${text2}  ${False}