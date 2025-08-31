*** Settings ***
Resource    ../resources/user_login_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login Button On Landing Page
    Open Landing Page
    Verify Login Button Is Displayed

