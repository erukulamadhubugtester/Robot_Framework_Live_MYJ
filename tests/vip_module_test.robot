*** Settings ***
Resource    ../resources/user_vip_page_keyword.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User VIP Page
   Open Landing Page
   Verify Login User VIP Page
   Verify VIP URL 
   Verify Basic Plan 
   Verify sliver plan 
   Validate User Plan Button
   Validate Cart Page
   Validate Cart Features
   Verify Payment Frequency Title



   

