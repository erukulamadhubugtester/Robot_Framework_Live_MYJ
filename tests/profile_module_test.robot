*** Settings ***
Resource    ../resources/user_profile_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Profile Page
   Open Landing Page
   Verify Login User Profile Page
   Get User Profile ID
   Verify User Name And Age
   Verify Contact Info Section