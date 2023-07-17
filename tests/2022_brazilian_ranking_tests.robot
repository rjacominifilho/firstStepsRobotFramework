*** Settings ***

Resource   ./page_objects/2022_brazilian_Ranking.robot
Resource   ./keywords/global_keywords.robot

Test Setup        Browser is open
Test Teardown     Close Browser

*** Test Cases ***

Test Case 01 - Open 2022 Brazilian Championship Ranking
    The user is on the sports page
    Search for "Brasileiro"
    Choose "Serie A" option
    Select 2022 year
    2022 championship ranking is shown 