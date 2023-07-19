*** Settings ***

Resource    ./page_objects/client_form.robot

Test Setup           Browser is open
Test Teardown        Close Browser

*** Test Cases ***

Submit form with correct data
    Given The user is on the form page
    When Populate and submit form
    Then Confirmation page is shown