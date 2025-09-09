*** Settings ***
Resource    ../resources/user_recent_profile_visitors_keyword.robot

Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User perference Settings Page
    Open Landing Page
    Verify Login User recent-visitors Page
    Verify User recent-visitors URL
    Verify recent-visitors Title

