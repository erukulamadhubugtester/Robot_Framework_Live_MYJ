*** Settings ***
Resource    ../../resources/ui_keywords.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login Button On Landing Page
    Open Landing Page
    Verify Login Button Is Displayed

