*** Settings ***

Library      SeleniumLibrary

Resource     ../keywords/global_keywords.robot

*** Variables ***

${TC01_URL}               https://www.sofascore.com/pt/
${TC01_LOGO}              //img[contains(@height,'48')]
${TC01_SEARCH_FIELD}      //input[contains(@type,'text')]
${TC01_SEARCH_WORD}       Brasileiro
${TC01_INSERTED_TEXT}     //input[contains(@value,'Brasileiro')]
${PC01_SERIE_A_CHAMP}     //div[1]/div/div/div[2]/div/div/div/div[1]/div[1]/a/div
${PC_01_SELECT_YEAR}      //div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div/button
${PC_01_CHOICE_YEAR}      //li[@role='option'][contains(.,'2022')]
${SMALL_TIMEOUT}                     10

*** Keywords ***

The user is on the sports page
    Go To    ${TC01_URL}
    Wait Until Page Contains Element      ${TC01_LOGO}                 ${SMALL_TIMEOUT}
    Capture Page Screenshot               .\\TC01\\01-sportspage.png

Search for "Brasileiro"
    Input Text                             ${TC01_SEARCH_FIELD}        ${TC01_SEARCH_WORD}
    Wait Until Page Contains Element       ${TC01_INSERTED_TEXT}       ${SMALL_TIMEOUT}
    Capture Page Screenshot               .\\TC01\\02-search.png

Choose "Serie A" option
    Wait Until Page Contains Element       ${PC01_SERIE_A_CHAMP}       ${SMALL_TIMEOUT}
    Click Element                          ${PC01_SERIE_A_CHAMP}
    Wait Until Page Contains               Classificações
    Capture Page Screenshot               .\\TC01\\03-atualChampionship.png

Select 2022 year
    Wait Until Page Contains Element       ${PC_01_SELECT_YEAR}        ${SMALL_TIMEOUT}
    Click Element                          ${PC_01_SELECT_YEAR}
    Wait Until Page Contains Element       ${PC_01_CHOICE_YEAR}        ${SMALL_TIMEOUT}
    Click Element                          ${PC_01_CHOICE_YEAR}

2022 championship ranking is shown 
    Wait Until Page Contains    2022
    Capture Page Screenshot                 .\\TC01\\04-2022Championship.png