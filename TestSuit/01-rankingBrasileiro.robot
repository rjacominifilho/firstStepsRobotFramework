*** Settings ***

Resource   ../Pages/01-rankingBrasileiroBDD.robot

*** Test Cases ***

Test Case 01 - Open championship ranking of 2022
    Given sports page is open
    When search for "Brasileiro"
    And choose "Serie A" option
    And select the year 2022
    Then 2022 championship ranking is displayed