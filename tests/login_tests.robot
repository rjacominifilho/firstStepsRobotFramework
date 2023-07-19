*** Settings ***

Resource          ./page_objects/login.robot

Test Setup        Browser is open
Task Teardown     Close Browser

*** Test Cases ***

Login with correct user and password
    [Documentation]    
    ...    This test case have objective to do login with correct data using json file
    [Tags]    login
    Given The login page is open
    When Submit login with correct data
    #Then The secret page is shown