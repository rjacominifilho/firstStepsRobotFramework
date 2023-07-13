*** Settings ***

Library      SeleniumLibrary

Resource     ../Resources/variables.robot

*** Keywords ***

Given sports page is open
    Open Browser                          ${TC01_URL}                  ${BROWSER}            options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains Element      ${TC01_LOGO}                 10
    Capture Page Screenshot               .\\TC01\\01-sportspage.png

When search for "Brasileiro"
    Input Text                             ${TC01_SEARCH_FIELD}        ${TC01_SEARCH_WORD}
    Wait Until Page Contains Element       ${TC01_INSERTED_TEXT}       10
    Capture Page Screenshot               .\\TC01\\02-search.png

And choose "Serie A" option
    Wait Until Page Contains Element       ${PC01_SERIE_A_CHAMP}       10
    Click Element                          ${PC01_SERIE_A_CHAMP}
    Wait Until Page Contains               Classificações
    Capture Page Screenshot               .\\TC01\\03-atualChampionship.png

And select the year 2022
    Wait Until Page Contains Element       ${PC_01_SELECT_YEAR}    10
    Click Element                          ${PC_01_SELECT_YEAR}
    Wait Until Page Contains Element       ${PC_01_CHOICE_YEAR}    10
    Click Element                          ${PC_01_CHOICE_YEAR}

Then 2022 championship ranking is displayed
    Wait Until Page Contains    2022
    Capture Page Screenshot                 .\\TC01\\04-2022Championship.png