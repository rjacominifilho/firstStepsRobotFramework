*** Settings ***

Library    SeleniumLibrary

*** Variables ***

##########TABELA BRASILEIRO##############

${TC01_URL}               https://www.sofascore.com/pt/
${BROWSER}                chrome
${TC01_LOGO}              //img[contains(@height,'48')]

*** Keywords ***

Open Page
    Open Browser                          ${TC01_URL}                  ${BROWSER}            options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains Element      ${TC01_LOGO}                 10
    Capture Page Screenshot               .\\TC01\\01-sportspage.png