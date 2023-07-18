*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${BROWSER}                chrome
${BASE_URL}               http://google.com.br

*** Keywords ***

Browser is open
    Open Browser                 ${BASE_URL}     ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    