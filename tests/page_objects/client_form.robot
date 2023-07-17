*** Settings ***

Library  SeleniumLibrary

Resource    ../keywords/global_keywords.robot

*** Variables ***

${FORM_PAGE}            https://form.jotform.com/231974179778072


*** Keywords ***

The user is on the form page
    Go To    ${FORM_PAGE}
    Title Should Be    Cadastro de Clientes
    Capture Page Screenshot    01-Form_Page.png

Input first name

Input last name

Input email

Input address

Input city

Input state

Input postal code

Submit form

Confirmation page