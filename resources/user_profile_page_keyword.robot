*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HighlightLibrary.py
Library    DebugLibrary
Library    Collections
Library    String
Resource   ../resources/locators.robot
Resource   variables.robot


*** Keywords ***
Close Browser Session
    Close Browser
# 0. Home Page
Open Landing Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window



# 2. Login User Profile Page
Verify Login User Profile Page
    
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

Get User Profile ID
    wait Until Element Is Visible    ${USER_ID_H2}
    Highlight Element    locator=${USER_ID_H2}    
    ${user_id_text}    Get Text    ${USER_ID_H2}
    ${matches}    Get Regexp Matches    ${user_id_text}    [A-Z0-9]+
    ${user_id}    Set Variable    ${matches}[-1]
    Set Suite Variable    ${USER_ID}    ${user_id}
    Log To Console    Login User ID is: ${USER_ID}
Verify User Name And Age
    ${profile_text}    Get Text    ${USER_PROFILE_H3}
    Log To Console    User Profile: ${profile_text}

Verify Contact Info Section
    Sleep    5
    Wait Until Element Is Visible    ${CONTACT_TITLE}
    Element Text Should Be         ${CONTACT_TITLE}    Contact Info :
    Page Should Contain Element    ${PHONE_NO}
     Wait Until Element Is Visible   ${PHONE_NO}
    Page Should Contain Element    ${EMAIL_ID}
     Wait Until Element Is Visible     ${EMAIL_ID}

    ${phone}    Get Text    ${PHONE_NO}
    ${email}    Get Text    ${EMAIL_ID}
    Log To Console    Contact Title is displayed correctly
    Log To Console    Phone Number: ${phone}
    Log To Console    Email: ${email}
   


