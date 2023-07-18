*** Settings ***

Resource    ./page_objects/client_form.robot

Test Setup           Browser is open
Test Teardown        Close Browser

*** Test Cases ***

Test Case 01 - Submit form with correct data
    Given The user is on the form page
    When Input first name
    And Input last name
    And Input email
    And Input address
    And Input city
    And Input state
    And Input postal code
    And Input phone number
    And Submit form
    Then Confirmation page is shown