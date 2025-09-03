*** Settings ***
Resource    ../resources/user_account_settings_page_keyword.robot

Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Account Settings Page
    Open Landing Page
    Verify Login User Account Settings Page
    Verify User Account Settings URL 
    



   

