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



# 2. Login User recent-visitors Page
Verify Login User recent-visitors Page
    
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
Verify User recent-visitors URL    

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${recent_profile_visitors_link}    10s
    Highlight Element    ${recent_profile_visitors_link}
    Click Element    ${recent_profile_visitors_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${recent_profile_visitors_URL}    msg=❌ URL Mismatch! Expected: ${recent_profile_visitors_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!


Verify recent-visitors Title
    Wait Until Element Is Visible    ${recent_profile_visitors_TITLE}    10s
    ${title_text}=    Get Text    ${recent_profile_visitors_TITLE}
    Log To Console    \n📌 Recent Profile Visitors Title: ${title_text}
    Should Be Equal As Strings    ${title_text}    Recent Profile Visitors
    Highlight Element    ${recent_profile_visitors_TITLE}


Get Visitor Profile Count
    ${count}=    Get Element Count    ${VISITOR_PROFILE_CARD}
    Log To Console    🔹 Total visitor profiles: ${count}

Verify Recent Visitors Page
    ${is_message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${RECENT_VISITOR_MESSAGE}
    Run Keyword If    ${is_message_visible}    Log To Console    ⚠️ Free User → Message visible
    Run Keyword If    ${is_message_visible}    Element Should Be Visible    ${UPGRADE_BUTTON}
    Run Keyword If    ${is_message_visible}    Log To Console    🟣 Upgrade button is displayed

    ${is_profile_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${VISITOR_PROFILE_CARD}
    Run Keyword If    ${is_profile_visible}    Log To Console    ✅ VIP User → Visitor profiles displayed
    Run Keyword If    ${is_profile_visible}    Get Visitor Profile Count

    Run Keyword If    not ${is_message_visible} and not ${is_profile_visible}    Fail    ❌ Neither free user message nor profiles found!

