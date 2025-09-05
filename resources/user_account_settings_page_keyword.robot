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



# 2. Login User VIP Page
Verify Login User Account Settings Page
    
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
Verify User Account Settings URL 

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${account_settings_link}    10s
    Highlight Element    ${account_settings_link}
    Click Element    ${account_settings_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${account_settings_URL}    msg=❌ URL Mismatch! Expected: ${account_settings_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!


Verify Account Settings Title
    Wait Until Element Is Visible    ${ACCOUNT_SETTINGS_TITLE}    10s
    ${title_text}=    Get Text    ${ACCOUNT_SETTINGS_TITLE}
    Log To Console    \n📌 Account Settings Title: ${title_text}
    Should Be Equal As Strings    ${title_text}    Account settings
    Highlight Element    ${ACCOUNT_SETTINGS_TITLE}
Verify Plans Title
    Wait Until Element Is Visible    ${PLANS_TITLE}    10s
    ${title_text}=    Get Text    ${PLANS_TITLE}
    Log To Console    \n📌 Plans Page Title: ${title_text}
    Should Be Equal As Strings    ${title_text}    Plans
    Highlight Element    ${PLANS_TITLE}
Verify User Plan And Expiry
    Wait Until Element Is Visible    ${USER_PLAN}    10s
    ${plan_text}=    Get Text    ${USER_PLAN}
    Log To Console    \n📌 Current User Plan: ${plan_text}
    Highlight Element    ${USER_PLAN}

    Wait Until Element Is Visible    ${EXPIRY_DATE}    10s
    ${expiry_text}=    Get Text    ${EXPIRY_DATE}
    Log To Console    📅 Expiry Date: ${expiry_text}
    Highlight Element    ${EXPIRY_DATE}

Validate Plan Button
    ${is_upgrade}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//button[normalize-space(.)='Upgrade']    5s
    ${is_cancel}=     Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//button[normalize-space(.)='Cancel Plan']    5s

    IF    ${is_upgrade}
        Log To Console    \n🆓 Free Plan → ✅ 'Upgrade' button is displayed
        Highlight Element    xpath=//button[normalize-space(.)='Upgrade']
    ELSE IF    ${is_cancel}
        Log To Console    \n💎 VIP Plan → ✅ 'Cancel Plan' button is displayed
        Highlight Element    xpath=//button[normalize-space(.)='Cancel Plan']
    ELSE
        Fail    ❌ Neither 'Upgrade' nor 'Cancel Plan' button is visible
    END


Verify Account Access Title
    ${title}=    Get Text    ${ACCOUNT_ACCESS_TITLE}
    Log To Console    \n📌 Account Access Title: ${title}
    Should Be Equal As Strings    ${title}    Account access
    Highlight Element    locator=${ACCOUNT_SETTINGS_TITLE}


Verify User Account Details
    ${name}=    Get Text    ${USER_NAME}
    ${mobile}=  Get Text    ${MOBILE_NUMBER}

    Log To Console    \n👤 User Name: ${name}
    Log To Console    📱 Mobile Number: ${mobile}

    Highlight Element    ${USER_NAME}
    Highlight Element    ${MOBILE_NUMBER}

Verify Privacy Title
    ${title}=    Get Text    ${PRIVACY_TITLE}
    Log To Console    \n🔐 Privacy Section Title: ${title}
    Highlight Element    ${PRIVACY_TITLE}



Verify Privacy Mobile Number Section
    # --- Mobile ---
    ${heading}=    Get Text    ${MOBILE_HEADING}
    Log To Console    \n📌 Privacy Heading: ${heading}
    Highlight Element    ${MOBILE_HEADING}

    ${mobile_value}=    Get Element Attribute    ${MOBILE_INPUT}    value
    Log To Console    📞 User Mobile Number: ${mobile_value}
    Highlight Element    ${MOBILE_INPUT}

    ${selected}=    Get Selected List Label    ${PRIVACY_DROPDOWN}
    Log To Console    🔽 Selected Privacy Option: ${selected}
    Highlight Element    ${PRIVACY_DROPDOWN}
Verify Privacy Email Section
# Scroll further by 400px

    Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s
    ${email_heading}=    Get Text    ${EMAIL_HEADING}
    ${email_value}=      Get Element Attribute    ${EMAIL_INPUT}    value
    ${email_selected}=   Get Selected List Label    ${EMAIL_DROPDOWN}
    

    # Highlight Element    ${EMAIL_HEADING}
    Highlight Element    ${EMAIL_INPUT}
    Highlight Element    ${EMAIL_DROPDOWN}

    Log To Console    📌 Email Heading: ${email_heading}
    Log To Console    📧 User Email ID: ${email_value}
    Log To Console    🔽 Privacy Option: ${email_selected}


Verify DOB Section
    [Documentation]    Verifies DOB heading, value, privacy dropdown, logs and highlights them
    Sleep    2
    Scroll Element Into View    ${DOB_HEADING}
    Wait Until Element Is Visible    ${DOB_HEADING}    10s

    # --- Get values ---
    ${dob_heading}=    Get Text    ${DOB_HEADING}
    ${dob_value}=      Get Element Attribute    ${DOB_INPUT}    value
    ${dob_selected}=   Get Selected List Label    ${DOB_DROPDOWN}

    # --- Log values to console ---
    Log To Console    "📌 DOB Heading: ${dob_heading}"
    Log To Console    "🎂 User DOB: ${dob_value}"
    Log To Console    "🔽 Privacy Option: ${dob_selected}"

    # --- Highlight elements ---
    # Highlight Element    ${DOB_HEADING}
    Highlight Element    ${DOB_INPUT}
    Highlight Element    ${DOB_DROPDOWN}
Verify Privacy Photo Section
    # --- Photo ---
    ${photo_heading}=    Get Text    ${PHOTO_HEADING}
    ${photo_selected}=   Get Selected List Label    ${PHOTO_DROPDOWN}

    Log To Console    \n📌 Photo Heading: ${photo_heading}
    Log To Console    🖼️ Photo Privacy Option: ${photo_selected}

    # Highlight Element    ${PHOTO_HEADING}
    Highlight Element    ${PHOTO_DROPDOWN}
Verify Privacy Astro Section
    # --- Astro ---
    ${astro_heading}=    Get Text    ${ASTRO_HEADING}
    ${astro_selected}=   Get Selected List Label    ${ASTRO_DROPDOWN}

    Log To Console    \n📌 Astro Heading: ${astro_heading}
    Log To Console    🌌 Astro Privacy Option: ${astro_selected}

    # Highlight Element    ${ASTRO_HEADING}
    Highlight Element    ${ASTRO_DROPDOWN}


Verify Alerts Section
    [Documentation]    Verifies Alerts heading is visible, logs text, and highlights element
     Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s
    Scroll Element Into View    ${ALERTS_HEADING}
    Wait Until Element Is Visible    ${ALERTS_HEADING}    10s

    ${alerts_heading}=    Get Text    ${ALERTS_HEADING}
    Log To Console    "🚨 Alerts Section Heading: ${alerts_heading}"

    # Highlight Element    ${ALERTS_HEADING}

    # Optional: Assert heading text
    Should Be Equal    ${alerts_heading}    Alerts

Verify Personalized Profile Section ALERTS_TOGGLE
    [Documentation]    Verifies heading, description text and toggle state for Personalized Profile alerts
    Sleep    2
    Scroll Element Into View    ${PERSONALIZED_HEADING}
    Wait Until Element Is Visible    ${PERSONALIZED_HEADING}    10s

    # --- Get heading and description ---
    ${heading}=    Get Text    ${PERSONALIZED_HEADING}
    ${description}=    Get Text    ${PERSONALIZED_DESC}

    # --- Log values ---
    Log To Console    "📌 Heading: ${heading}"
    Log To Console    "📝 Description: ${description}"

    # --- Highlight elements ---
    Highlight Element    ${PERSONALIZED_HEADING}
    Highlight Element    ${PERSONALIZED_DESC}

    # --- Verify toggle checkbox ---
    ${toggle_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${ALERTS_TOGGLE}
    Run Keyword If    ${toggle_displayed}    Log To Console    "✅ Toggle is displayed"    ELSE    Log To Console    "❌ Toggle not displayed"

    ${toggle_selected}=    Get Element Attribute    ${ALERTS_TOGGLE}    checked
    Run Keyword If    '${toggle_selected}'=='true'    Log To Console    "🔘 Toggle is ON"    ELSE    Log To Console    "⚪ Toggle is OFF"

    Highlight Element    ${ALERTS_TOGGLE}



Verify Recent Visitor Section ALERTS_TOGGLE
    [Documentation]    Verifies heading, description text and toggle state for Recent Visitor alerts
    Sleep    2
    Scroll Element Into View    ${RECENT_VISITOR_HEADING}
    Wait Until Element Is Visible    ${RECENT_VISITOR_HEADING}    10s

    # --- Get heading and description ---
    ${heading}=    Get Text    ${RECENT_VISITOR_HEADING}
    ${description}=    Get Text    ${RECENT_VISITOR_DESC}

    # --- Log values ---
    Log To Console    "📌 Heading: ${heading}"
    Log To Console    "📝 Description: ${description}"

    # --- Highlight elements ---
    Highlight Element    ${RECENT_VISITOR_HEADING}
    Highlight Element    ${RECENT_VISITOR_DESC}

    # --- Verify toggle checkbox ---
    ${toggle_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${RECENT_VISITOR_TOGGLE}
    Run Keyword If    ${toggle_displayed}    Log To Console    "✅ Toggle is displayed"    ELSE    Log To Console    "❌ Toggle not displayed"

    ${toggle_selected}=    Get Element Attribute    ${RECENT_VISITOR_TOGGLE}    checked
    Run Keyword If    '${toggle_selected}'=='true'    Log To Console    "🔘 Toggle is ON"    ELSE    Log To Console    "⚪ Toggle is OFF"

    Highlight Element    ${RECENT_VISITOR_TOGGLE}



Verify Chat Alerts Section ALERTS_TOGGLE
    [Documentation]    Verifies heading, description text and toggle state for Chat Alerts
    Sleep    2
    Scroll Element Into View    ${CHAT_ALERTS_HEADING}
    Wait Until Element Is Visible    ${CHAT_ALERTS_HEADING}    10s

    # --- Get heading and description ---
    ${heading}=    Get Text    ${CHAT_ALERTS_HEADING}
    ${description}=    Get Text    ${CHAT_ALERTS_DESC}

    # --- Log values ---
    Log To Console    "📌 Heading: ${heading}"
    Log To Console    "📝 Description: ${description}"

    # --- Highlight elements ---
    Highlight Element    ${CHAT_ALERTS_HEADING}
    Highlight Element    ${CHAT_ALERTS_DESC}

    # --- Verify toggle checkbox ---
    ${toggle_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${CHAT_ALERTS_TOGGLE}
    Run Keyword If    ${toggle_displayed}    Log To Console    "✅ Toggle is displayed"    ELSE    Log To Console    "❌ Toggle not displayed"

    ${toggle_selected}=    Get Element Attribute    ${CHAT_ALERTS_TOGGLE}    checked
    Run Keyword If    '${toggle_selected}'=='true'    Log To Console    "🔘 Toggle is ON"    ELSE    Log To Console    "⚪ Toggle is OFF"

    Highlight Element    ${CHAT_ALERTS_TOGGLE}


Verify Message Section
    [Documentation]    Verifies the "Message" heading is visible and correct
    Sleep    1
    Scroll Element Into View    ${MESSAGE_HEADING}
    Wait Until Element Is Visible    ${MESSAGE_HEADING}    10s

    ${heading}=    Get Text    ${MESSAGE_HEADING}
    Log To Console    "📌 Message Section Heading: ${heading}"

    Highlight Element    ${MESSAGE_HEADING}
    Should Be Equal    ${heading}    Message


Verify Automated Message Section
    [Documentation]    Verifies heading and description text for Automated Message on Connection
    Sleep    1
    Scroll Element Into View    ${AUTO_MSG_HEADING}
    Wait Until Element Is Visible    ${AUTO_MSG_HEADING}    10s

    # --- Get heading text ---
    ${heading}=    Get Text    ${AUTO_MSG_HEADING}
    Log To Console    "📌 Heading: ${heading}"
    Highlight Element    ${AUTO_MSG_HEADING}
    Should Be Equal    ${heading}    Automated message on connection

    # --- Get description text ---
    ${description}=    Get Text    ${AUTO_MSG_DESC}
    Log To Console    "📝 Description: ${description}"
    Highlight Element    ${AUTO_MSG_DESC}
    Should Be Equal    ${description}    A message will be delivered to the person who has accepted your connection request

Verify Automated Message Acceptance Section
    [Documentation]    Verifies heading and description text for Automated Message on Connection Acceptance
    Sleep    1
    Scroll Element Into View    ${AUTO_MSG_ACCEPT_HEADING}
    Wait Until Element Is Visible    ${AUTO_MSG_ACCEPT_HEADING}    10s

    # --- Get heading text ---
    ${heading}=    Get Text    ${AUTO_MSG_ACCEPT_HEADING}
    Log To Console    "📌 Heading: ${heading}"
    Highlight Element    ${AUTO_MSG_ACCEPT_HEADING}
    Should Be Equal    ${heading}    Automated message on connection acceptance

    # --- Get description text ---
    ${description}=    Get Text    ${AUTO_MSG_ACCEPT_DESC}
    Log To Console    "📝 Description: ${description}"
    Highlight Element    ${AUTO_MSG_ACCEPT_DESC}
    Should Be Equal    ${description}    A message will be delivered to the person whose request you have accepted


Verify Automated Message Reminder Section
    [Documentation]    Verifies heading and description text for Automated Message for Reminders
    Sleep    1
    Scroll Element Into View    ${AUTO_MSG_REMINDER_HEADING}
    Wait Until Element Is Visible    ${AUTO_MSG_REMINDER_HEADING}    10s

    # --- Get heading text ---
    ${heading}=    Get Text    ${AUTO_MSG_REMINDER_HEADING}
    Log To Console    "📌 Heading: ${heading}"
    Highlight Element    ${AUTO_MSG_REMINDER_HEADING}
    Should Be Equal    ${heading}    Automated message for reminders

    # --- Get description text ---
    ${description}=    Get Text    ${AUTO_MSG_REMINDER_DESC}
    Log To Console    "📝 Description: ${description}"
    Highlight Element    ${AUTO_MSG_REMINDER_DESC}
    Should Be Equal    ${description}    A message will be delivered to the person who has not responded to your messages.




Verify Hide Delete Profile Section
    [Documentation]    Verifies the "Hide / Delete Profile" heading

    Sleep    1
    Scroll Element Into View    ${HIDE_DELETE_HEADING}
    Wait Until Element Is Visible    ${HIDE_DELETE_HEADING}    10s

    ${heading}=    Get Text    ${HIDE_DELETE_HEADING}
    Log To Console    "📌 Heading: ${heading}"

    Highlight Element    ${HIDE_DELETE_HEADING}
    Should Be Equal    ${heading}    Hide / Delete Profile

Verify Hide Profile Section
    [Documentation]    Verifies title, description, and button for Hide Profile section
    Sleep    1
    Sleep    1
    Scroll Element Into View    ${HIDE_PROFILE_TITLE}
    Wait Until Element Is Visible    ${HIDE_PROFILE_TITLE}    10s

    # --- Title ---
    ${title}=    Get Text    ${HIDE_PROFILE_TITLE}
    Log To Console    "📌 Title: ${title}"
    Highlight Element    ${HIDE_PROFILE_TITLE}
    Should Be Equal    ${title}    Hide Profile

    # --- Description ---
    ${desc}=    Get Text    ${HIDE_PROFILE_DESC}
    Log To Console    "📝 Description: ${desc}"
    Highlight Element    ${HIDE_PROFILE_DESC}
    Should Contain    ${desc}    When you hide profile you will not be visible

    # --- Button ---
    ${btn_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${HIDE_PROFILE_BUTTON}
    Run Keyword If    ${btn_visible}    Log To Console    "✅ Hide button is displayed"    ELSE    Log To Console    "❌ Hide button is NOT displayed"

    Highlight Element    ${HIDE_PROFILE_BUTTON}


Verify Delete Profile Section
    [Documentation]    Verifies title, description, and button for Delete Profile section
     Execute JavaScript    window.scrollBy(0,400)
    Sleep    1
    Scroll Element Into View    ${${HIDE_DELETE_PROFILE_HEADING}}
    Wait Until Element Is Visible    ${${HIDE_DELETE_PROFILE_HEADING}}    10s

    # --- Title ---
    ${title}=    Get Text    ${${HIDE_DELETE_PROFILE_HEADING}}
    Log To Console    "📌 Title: ${title}"
    Highlight Element    ${${HIDE_DELETE_PROFILE_HEADING}}
    Should Be Equal    ${title}    Delete Profile

    # --- Description ---
    ${desc}=    Get Text    ${DELETE_PROFILE_DESC}
    Log To Console    "📝 Description: ${desc}"
    Highlight Element    ${DELETE_PROFILE_DESC}
    Should Contain    ${desc}    You will permanently loss all profile information

    # --- Button ---
    ${btn_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${DELETE_PROFILE_BUTTON}
    Run Keyword If    ${btn_visible}    Log To Console    "✅ Delete button is displayed"    ELSE    Log To Console    "❌ Delete button is NOT displayed"

    # Highlight Element    ${DELETE_PROFILE_BUTTON}


Verify Logout Button
    [Documentation]    Verifies the Log out button is displayed
    Sleep    1
    Scroll Element Into View    ${LOGOUT_BUTTON}
    ${btn_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${LOGOUT_BUTTON}

    Run Keyword If    ${btn_visible}    Log To Console    "✅ Log out button is displayed"    ELSE    Log To Console    "❌ Log out button is NOT displayed"

    Highlight Element    ${LOGOUT_BUTTON}