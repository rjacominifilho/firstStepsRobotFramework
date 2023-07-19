*** Settings ***

Resource          ./page_objects/login.robot

Test Setup        Browser is open
Task Teardown     Close Browser

*** Test Cases ***

Login with correct user and password
    [Documentation]    
    ...    This test case have the objective to do login with correct data using json file
    [Tags]    login
    Given The login page is open
    When Submit login with correct data
    Then The secret page is shown

Login with incorrect user and password
    [Documentation]    
    ...    This test case have the objective to shown an error message when submit login
    [Tags]    login
    Given The login page is open
    When Submit login with wrong data
    Then The error message is shown

Login with user only
    [Documentation]     
    ...    This test case have the objective to shown an error message when submit login with user only
    [Tags]    login
    Given The login page is open
    When Submit login with user only
    Then The error message is shown

Login with password only
    [Documentation]     
    ...    This test case have the objective to shown an error message when submit login with password only
    [Tags]    login
    Given The login page is open
    When Submit login with password only
    Then The error message is shown

Login without data
    [Documentation]     
    ...    This test case have the objective to shown an error message when submit login without data
    [Tags]    login
    Given The login page is open
    When Submit without data
    Then The error message is shown