*** Settings ***

Library        SeleniumLibrary
Library        FakerLibrary    locale=pt_BR
Library        String
Resource       ../keywords/global_keywords.robot

*** Variables ***

${FORM_PAGE}                         https://form.jotform.com/231974179778072
${FIRST_NAME_FIELD}                  id:first_3
${LAST_NAME_FIELD}                   id:last_3
${EMAIL_FIELD}                       id:input_4
${ADDRESS_FIELD}                     id:input_5_addr_line1
${CITY_FIELD}                        id:input_5_city
${STATE_FIELD}                       id:input_5_state
${POSTAL_CODE_FIELD}                 id:input_5_postal
${PHONE_NUMBER_FIELD}                id:input_6_full
${SUBMIT_BUTTON}                     id:input_2
${CLEAN_BUTTON}                      id:input_reset_2
${SMALL_TIMEOUT}                     10

*** Keywords ***

The user is on the form page
    Go To                            ${FORM_PAGE}
    Title Should Be                  Cadastro de Clientes
    Capture Page Screenshot          01-Form_Page.png

Populate and submit form
    ${FIRST_NAME}                    FakerLibrary.First Name
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}           ${SMALL_TIMEOUT}
    Input Text                       ${FIRST_NAME_FIELD}           ${FIRST_NAME}
    Sleep    1

    ${LAST_NAME}                     FakerLibrary.Last Name 
    Wait Until Element Is Visible    ${LAST_NAME_FIELD}            ${SMALL_TIMEOUT}
    Input Text                       ${LAST_NAME_FIELD}            ${LAST_NAME}   
    Sleep    1

    ${EMAIL}                         FakerLibrary.Email
    Wait Until Element Is Visible    ${EMAIL_FIELD}                ${SMALL_TIMEOUT}
    Input Text                       ${EMAIL_FIELD}                ${EMAIL}
    Sleep    1

    ${ADDRESS}                       FakerLibrary.Street Address
    Wait Until Element Is Visible    ${ADDRESS_FIELD}              ${SMALL_TIMEOUT}
    Input Text                       ${ADDRESS_FIELD}              ${ADDRESS}
    Sleep    1

    ${CITY}                          FakerLibrary.City
    Wait Until Element Is Visible    ${CITY_FIELD}                 ${SMALL_TIMEOUT}
    Input Text                       ${CITY_FIELD}                 ${CITY}
    Sleep    1

    ${STATE}                         FakerLibrary.State
    Wait Until Element Is Visible    ${STATE_FIELD}                ${SMALL_TIMEOUT}
    Input Text                       ${STATE_FIELD}                ${STATE}
    Sleep    1

    ${POSTAL_CODE}                   FakerLibrary.Postcode
    Wait Until Element Is Visible    ${POSTAL_CODE_FIELD}           ${SMALL_TIMEOUT}
    Input Text                       ${POSTAL_CODE_FIELD}           ${POSTAL_CODE}
    Sleep    1

    #GET PHONE NUMBER
    ${PHONE_NUMBER}                  FakerLibrary.Msisdn
    #CONVERT TO STRING
    Convert To String    ${PHONE_NUMBER}
    #REPLACE POSITION 2 TO 8
    ${NEW_PHONE_NUMBER}    Replace String    ${PHONE_NUMBER}        ${PHONE_NUMBER[2]}    8
    #CHECK IF POSITION  3 IS 0 AND REPLACE TO NUMBER 1 IF TRUE    
    IF  ${NEW_PHONE_NUMBER[3]} == 0
        ${NEW_PHONE_NUMBER}    Replace String    ${PHONE_NUMBER}    ${PHONE_NUMBER[3]}    1
    END    
    Wait Until Element Is Visible    ${PHONE_NUMBER_FIELD}          ${SMALL_TIMEOUT}
    Input Text                       ${PHONE_NUMBER_FIELD}          ${NEW_PHONE_NUMBER}
    Sleep    1
    
    Scroll Element Into View         ${CLEAN_BUTTON}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}               ${SMALL_TIMEOUT}
    Click Element                    ${SUBMIT_BUTTON}

Confirmation page is shown
    Wait Until Page Contains         Obrigado!                      ${SMALL_TIMEOUT}
    Capture Page Screenshot          01-Sucess_Page.png