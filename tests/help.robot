*** Settings ***
Resource    ../resources/user_help_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User help Page
   Open Landing Page
   Verify Login User help Page
   Verify User help URL
   Verify Help Centre Title
   Verify Help Page Contact Options
   Logout User



   

