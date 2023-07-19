*** Settings ***

Resource   ./page_objects/2022_brazilian_Ranking.robot

Test Setup        Browser is open
Test Teardown     Close Browser

*** Test Cases ***

Test Case 01 - Open 2022 Brazilian Championship Ranking
    [Documentation]   
    ...    This test case have the objective to show the 2022 Brazilian championship ranking
    [Tags]    sports_rankings
    Given The user is on the sports page
    When Search for "Brasileiro"
    And Choose "Serie A" option
    And Select 2022 year
    Then 2022 championship ranking is shown 