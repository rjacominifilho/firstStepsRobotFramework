*** Settings ***

Library          SeleniumLibrary
Library          JSONLibrary
Resource         ../keywords/global_keywords.robot

*** Variables ***

${LOGIN_PAGE}        file:///C:/Users/Windows11/Documents/teste/login/login_page.html

*** Keywords ***

The login page is open   
    Go To    ${LOGIN_PAGE}
    Title Should Be    Login