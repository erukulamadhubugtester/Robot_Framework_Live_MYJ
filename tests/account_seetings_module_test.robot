*** Settings ***
Resource    ../resources/user_account_settings_page_keyword.robot

Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Account Settings Page
    Open Landing Page
    Verify Login User Account Settings Page
    Verify User Account Settings URL 
    Verify Account Settings Title
    Verify Plans Title
    Verify User Plan And Expiry
    Validate Plan Button
    Verify Account Access Title
    Verify User Account Details
    Verify Privacy Title
    Verify Privacy Mobile Number Section
    Verify Privacy Email Section
    Verify DOB Section
    Verify Privacy Photo Section
    Verify Privacy Astro Section
    Verify Alerts Section
    Verify Personalized Profile Section ALERTS_TOGGLE
    Verify Recent Visitor Section ALERTS_TOGGLE
    Verify Chat Alerts Section ALERTS_TOGGLE
    Verify Message Section
    Verify Automated Message Section
    Verify Automated Message Acceptance Section
    Verify Automated Message Reminder Section
    Verify Hide Delete Profile Section
    # Verify Hide Profile Section
    # Verify Delete Profile Section
    Verify Logout Button









   

