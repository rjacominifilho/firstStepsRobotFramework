*** Settings ***

Library    SeleniumLibrary

*** Variables ***

##########TABELA BRASILEIRO##############

${BROWSER}                chrome

*** Keywords ***

Browser is open
    Open Browser                          ${BROWSER}            options=add_experimental_option("detach", True)
    Maximize Browser Window
    