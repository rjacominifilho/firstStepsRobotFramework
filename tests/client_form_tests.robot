*** Settings ***

Resource    ./page_objects/client_form.robot

Test Setup           Browser is open
Test Teardown        Close Browser

*** Test Cases ***

Submit form with correct data
    [Documentation]   
    ...    This test case have the objective to submit a client form using correct data
    [Tags]    client_form
    Given The user is on the form page
    When Populate and submit form
    Then Confirmation page is shown