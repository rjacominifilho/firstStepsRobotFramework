*** Settings ***

Library      SeleniumLibrary

Resource     ./2022_brazilian_Ranking.robot

*** Variables ***

${TC01_SEARCH_FIELD}      //input[contains(@type,'text')]
${TC01_SEARCH_WORD}       Brasileiro
${TC01_INSERTED_TEXT}     //input[contains(@value,'Brasileiro')]
${PC01_SERIE_A_CHAMP}     //div[1]/div/div/div[2]/div/div/div/div[1]/div[1]/a/div
${PC_01_SELECT_YEAR}      //div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div/button
${PC_01_CHOICE_YEAR}      //li[@role='option'][contains(.,'2022')]

*** Keywords ***

Given sports page is open
    

Search for "Brasileiro"
    Input Text                             ${TC01_SEARCH_FIELD}        ${TC01_SEARCH_WORD}
    Wait Until Page Contains Element       ${TC01_INSERTED_TEXT}       10
    Capture Page Screenshot               .\\TC01\\02-search.png

Choose "Serie A" option
    Wait Until Page Contains Element       ${PC01_SERIE_A_CHAMP}       10
    Click Element                          ${PC01_SERIE_A_CHAMP}
    Wait Until Page Contains               Classificações
    Capture Page Screenshot               .\\TC01\\03-atualChampionship.png

Select the year 2022
    Wait Until Page Contains Element       ${PC_01_SELECT_YEAR}    10
    Click Element                          ${PC_01_SELECT_YEAR}
    Wait Until Page Contains Element       ${PC_01_CHOICE_YEAR}    10
    Click Element                          ${PC_01_CHOICE_YEAR}

Show 2022 championship ranking
    Wait Until Page Contains    2022
    Capture Page Screenshot                 .\\TC01\\04-2022Championship.png
    Close Browser