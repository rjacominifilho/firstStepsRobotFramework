*** Variables ***

##########TABELA BRASILEIRO##############

${TC01_URL}               https://www.sofascore.com/pt/
${BROWSER}                chrome
${TC01_LOGO}              //img[contains(@height,'48')]
${TC01_SEARCH_FIELD}      //input[contains(@type,'text')]
${TC01_SEARCH_WORD}       Brasileiro
${TC01_INSERTED_TEXT}     //input[contains(@value,'Brasileiro')]
${PC01_SERIE_A_CHAMP}     //div[1]/div/div/div[2]/div/div/div/div[1]/div[1]/a/div
${PC_01_SELECT_YEAR}      //div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div/button
${PC_01_CHOICE_YEAR}      //li[@role='option'][contains(.,'2022')]