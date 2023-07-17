*** Settings ***

Resource   ./page_objects/2022_brazilian_Ranking.robot
Resource   ./keywords/global_keywords.robot

*** Test Cases ***

Test Case 01 - Open championship ranking of 2022
    Open Page
    Search for "Brasileiro"
    Choose "Serie A" option
    Select the year 2022
    Show 2022 championship ranking