*** Settings ***
Resource    ../resources/user_connections_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Connections Page
   Open Landing Page
   Verify Login User Connections Page
   Verify Connections URL
   Verify And Click Connection Tabs


  


   

