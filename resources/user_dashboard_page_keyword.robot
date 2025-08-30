*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HighlightLibrary.py
Library    DebugLibrary
Library    Collections
Resource   ../resources/locators.robot
Resource   variables.robot


*** Keywords ***
# 0. Home Page
Open Landing Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window



# 1. Login User Dashboard Page

    
    Highlight Element    ${LOGIN_LINK}
    Click Element        ${LOGIN_LINK}

    Sleep    3
    
    Input Text           ${PHONE_INPUT}    ${PHONE_NUMBER}
    Highlight Element    ${PHONE_INPUT}
    Input Text           ${PASSWORD_INPUT}    ${PASSWORD}
    Highlight Element    ${PASSWORD_INPUT}

    Highlight Element    ${CONTINUE_BUTTON}
    Click Element        ${CONTINUE_BUTTON}
    Sleep    5
    Highlight Element    ${profile_link}
   
 


# 2. Login User Dashboard Page
Verify Login User Dashboard Page
    
    Highlight Element    ${LOGIN_LINK}
    Click Element        ${LOGIN_LINK}

    Sleep    3
    
    Input Text           ${PHONE_INPUT}    ${PHONE_NUMBER}
    Highlight Element    ${PHONE_INPUT}
    Input Text           ${PASSWORD_INPUT}    ${PASSWORD}
    Highlight Element    ${PASSWORD_INPUT}

    Highlight Element    ${CONTINUE_BUTTON}
    Click Element        ${CONTINUE_BUTTON}
    Sleep    5
    Highlight Element    ${profile_link}
   
   Click Element    ${dashboard}
   Highlight Element    ${dashboard}
   Set Browser Implicit Wait    2

    Wait Until Location Is    ${dashboard_url}   10s
    Location Should Be    ${dashboard_url} 
    Wait Until Element Is Visible    ${home_title_check}     10s
    Element Text Should Be    ${home_title_check}     Meet Your Matrimonial Soulmate
    Set Selenium Implicit Wait    5
    Highlight Element    ${home_title_check} 

    Highlight Element    ${AGE_DROPDOWN} 
    Highlight Element     ${EDUCATION_INPUT} 
    Highlight Element     ${PROFESSION_INPUT} 
    Highlight Element     ${FIND_BUTTON} 
    Set Selenium Implicit Wait    5

    Highlight Element     ${profile_link}
    Highlight Element     ${VIP_link}
    Highlight Element     ${Connections_link}
    Set Selenium Implicit Wait    5

    Wait Until Element Is Visible    ${Profiles_which_match_your_preferences_headline} 
    Highlight Element  ${Profiles_which_match_your_preferences_headline}






  Set Browser Implicit Wait    2

Close Browser Session
    Close Browser
