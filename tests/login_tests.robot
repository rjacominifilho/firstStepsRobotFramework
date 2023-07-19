*** Settings ***

Resource          ./page_objects/login.robot

Test Setup        Browser is open
Task Teardown     Close Browser

*** Test Cases ***

Login with correct user and password
    Given The login page is open