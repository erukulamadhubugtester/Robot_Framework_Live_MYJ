*** Settings ***
Resource    ../resources/user_notifications_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Notifications Page
   Open Landing Page
   Verify Login User Notifications Page
   Verify Notifications 
   Verify List Notifications


  


   

