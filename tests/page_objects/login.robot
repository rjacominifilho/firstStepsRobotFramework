*** Settings ***

Library          SeleniumLibrary
Library          JSONLibrary
Library          String
Resource         ../keywords/global_keywords.robot

*** Variables ***

${LOGIN_PAGE}                          file:///C:/Users/Windows11/Documents/teste/login/login_page.html
${USER_FIELD}                          id:username
${PASSWORD_FIELD}                      id:password
${SUBMIT_BTN}                          id:submit
${ERROR_MESSAGE}                       id:message
${SMALL_TIMEOUT}                       10        

*** Keywords ***

GetJSONArguments
    [Arguments]                        ${user}    ${argument}
    ${json_file}                       Load Json From File        ./tests/data/login.json
    ${DATA}                            Get Value From Json        ${json_file}    $.${user}.${argument}
    ${DATA}                            Convert To String          ${DATA}
    ${DATA}                            Replace String             ${DATA}    [    ${EMPTY}
    ${DATA}                            Replace String             ${DATA}    ]    ${EMPTY}
    ${DATA}                            Replace String             ${DATA}    "    ${EMPTY}
    ${DATA}                            Replace String             ${DATA}    '    ${EMPTY}
    [Return]                           ${DATA}     
        
The login page is open           
    Go To                              ${LOGIN_PAGE}    
    Title Should Be                    Login    
        
Submit login with correct data        
    ${CORRECT_USER}                    GetJSONArguments           correctUser    user
    ${CORRECT_PASSWORD}                GetJSONArguments           correctUser    password
    Input Text                         ${USER_FIELD}              ${CORRECT_USER}
    Input Password                     ${PASSWORD_FIELD}          ${CORRECT_PASSWORD}
    Sleep    1    
    Click Element                      ${SUBMIT_BTN}
        
The secret page is shown        
    Title Should Be                    Login bem-sucedido
    Wait Until Page Contains           Parabéns, você fez login com sucesso!
    Sleep    1    
    
Submit login with wrong data    
    ${INCORRECT_USER}                  GetJSONArguments           incorrectUser    user
    ${INCORRECT_PASSWORD}              GetJSONArguments           incorrectUser    password
    Input Text                         ${USER_FIELD}              ${INCORRECT_USER}
    Input Password                     ${PASSWORD_FIELD}          ${INCORRECT_PASSWORD}
    Sleep    1          
    Click Element                      ${SUBMIT_BTN}      
      
Submit login with user only      
    ${USER}                            GetJSONArguments           correctUser    user
    Input Text                         ${USER_FIELD}              ${USER}
    Sleep    1          
    Click Element                      ${SUBMIT_BTN}      
      
Submit login with password only      
    ${PASSWORD}                        GetJSONArguments           correctUser    password
    Input Password                     ${PASSWORD_FIELD}          ${PASSWORD}
    Sleep    1          
    Click Element                      ${SUBMIT_BTN}      
      
Submit without data      
    Sleep    1          
    Click Element                      ${SUBMIT_BTN}      
              
The error message is shown          
    Wait Until Element Is Visible      ${ERROR_MESSAGE}           ${SMALL_TIMEOUT} 
    Sleep    1         