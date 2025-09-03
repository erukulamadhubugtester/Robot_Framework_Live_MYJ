*** Settings ***
Resource    ../resources/user_dashboard_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Dashboard/Home Page
   Open Landing Page
   Verify Login User Dashboard Page
   Verify User Profile
   Validate Footer Links
