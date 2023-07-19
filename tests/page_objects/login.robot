*** Settings ***

Library          SeleniumLibrary
Library          JSONLibrary
Library          String
Resource         ../keywords/global_keywords.robot

*** Variables ***

${LOGIN_PAGE}                      file:///C:/Users/Windows11/Documents/teste/login/login_page.html
${USER_FIELD}                      id:username
${PASSWORD_FIELD}                  id:password
${SUBMIT_BTN}                      id:submit        

*** Keywords ***

GetJSONArguments
    [Arguments]                    ${user}    ${argument}
    ${json_file}                   Load Json From File    ./data/login.json
    ${DATA}                        Get Value From Json    ${json_file}    $.${user}.${argument}
    ${DATA}                        Convert To String     ${DATA}
    ${DATA}                        Replace String        ${DATA}    [    ${EMPTY}
    ${DATA}                        Replace String        ${DATA}    ]    ${EMPTY}
    ${DATA}                        Replace String        ${DATA}    "    ${EMPTY}
    ${DATA}                        Replace String        ${DATA}    '    ${EMPTY}
    [Return]                       ${DATA} 

The login page is open   
    Go To                          ${LOGIN_PAGE}
    Title Should Be                Login

Submit login with correct data
    ${CORRECT_USER}                GetJSONArguments    correctUser    user
    ${CORRECT_PASSWORD}            GetJSONArguments    correctUser    password
    Log To Console    ${CORRECT_USER}
    Log To Console    ${CORRECT_PASSWORD}
    Input Text                     ${USER_FIELD}    ${CORRECT_USER}
    Sleep    3
    Input Password                 ${PASSWORD_FIELD}    ${CORRECT_PASSWORD}
    Sleep    3
    Click Element                  ${SUBMIT_BTN}
    
The secret page is shown    
    Title Should Be                Login bem-sucedido
    Wait Until Page Contains       Parabéns, você fez login com sucesso!
    