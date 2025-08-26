*** Settings ***
Resource    ../../resources/ui_keywords.robot
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User Home Page
   Open Landing Page
   Verify Login User Home Page

