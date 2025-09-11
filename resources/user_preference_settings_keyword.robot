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
Verify Login User Preference Settings Page
    
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
Verify User Preference Settings URL    

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${preference_settings_link}    10s
    Highlight Element    ${preference_settings_link}
    Click Element    ${preference_settings_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${preference_settings_URL}    msg=❌ URL Mismatch! Expected: ${preference_settings_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!


Verify Preference Settings Title
    Wait Until Element Is Visible    ${preference_SETTINGS_TITLE}    10s
    ${title_text}=    Get Text    ${preference_SETTINGS_TITLE}
    Log To Console    \n📌 Preference Settings Title: ${title_text}
    Should Be Equal As Strings    ${title_text}    Preference settings
    Highlight Element    ${preference_SETTINGS_TITLE}

Verify Clear And Save Buttons
    [Documentation]    Checks if Clear and Save buttons are displayed
    Sleep    1

    # --- Clear Button ---
    ${clear_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${CLEAR_BUTTON}
    Run Keyword If    ${clear_visible}    Log To Console    "✅ Clear button is displayed"    ELSE    Log To Console    "❌ Clear button is NOT displayed"
    Highlight Element    ${CLEAR_BUTTON}

    # --- Save Button ---
    ${save_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${SAVE_BUTTON}
    Run Keyword If    ${save_visible}    Log To Console    "✅ Save button is displayed"    ELSE    Log To Console    "❌ Save button is NOT displayed"
    Highlight Element    ${SAVE_BUTTON}

Verify Height Section
    [Documentation]    Verifies Height title and prints selected height value
    Sleep    1
    Scroll Element Into View    ${HEIGHT_TITLE}
    Wait Until Element Is Visible    ${HEIGHT_TITLE}    10s

    # --- Title ---
    ${title}=    Get Text    ${HEIGHT_TITLE}
    Log To Console    "📌 Title: ${title}"
    Highlight Element    ${HEIGHT_TITLE}
    Should Be Equal    ${title}    Height

    # --- Value ---
    ${value}=    Get Text    ${HEIGHT_VALUE}
    Log To Console    "📏 Selected Height: ${value}"
    Highlight Element    ${HEIGHT_VALUE}
    Should Not Be Empty    ${value}
Verify Age Section
    [Documentation]    Verifies Age title and prints selected age range
    Sleep    1
    Scroll Element Into View    ${AGE_TITLE}
    Wait Until Element Is Visible    ${AGE_TITLE}    10s

    # --- Title ---
    ${title}=    Get Text    ${AGE_TITLE}
    Log To Console    "📌 Title: ${title}"
    Highlight Element    ${AGE_TITLE}
    Should Be Equal    ${title}    Age

    # --- Value ---
    ${value}=    Get Text    ${AGE_VALUE}
    Log To Console    "🎂 Selected Age: ${value}"
    Highlight Element    ${AGE_VALUE}
    Should Not Be Empty    ${value}
Verify Marital Status
    [Documentation]    Verifies Marital status title and prints selected value
    Sleep    2
    Scroll Element Into View    ${MARITAL_TITLE}
    Wait Until Element Is Visible    ${MARITAL_TITLE}    10s

    # --- Title ---
    ${title}=    Get Text    ${MARITAL_TITLE}
    Log To Console    "📌 Title: ${title}"
    Highlight Element    ${MARITAL_TITLE}
    Should Be Equal    ${title}    Marital status
    Reload Page

    Sleep    5s

    # --- Value ---
    ${value}=    Get Text    ${MARITAL_VALUE}
    Log To Console    "❤️ Selected Marital Status: ${value}"
    Highlight Element    ${MARITAL_VALUE}
    Should Not Be Empty    ${value}
    Sleep    5s
Verify Religion Field
    Wait Until Element Is Visible    ${RELIGION_TITLE}    10s
    ${title}=    Get Text    ${RELIGION_TITLE}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Religion

    Wait Until Element Is Visible    ${RELIGION_INPUT}    10s
    ${value}=    Get Element Attribute    ${RELIGION_INPUT}    value
    Log To Console    "🙏 Religion Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ Religion not entered yet"
    Run Keyword If    '${value}' != ''    Log To Console    "✅ Religion entered: ${value}"

Verify Community Field
    Wait Until Element Is Visible    ${COMMUNITY_TITLE}    10s
    ${title}=    Get Text    ${COMMUNITY_TITLE}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Community

    Wait Until Element Is Visible    ${COMMUNITY_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${COMMUNITY_INPUT}    placeholder
    ${value}=          Get Element Attribute    ${COMMUNITY_INPUT}    value
    ${disabled}=       Get Element Attribute    ${COMMUNITY_INPUT}    disabled

    Log To Console    "🔹 Placeholder: ${placeholder}"
    Log To Console    "🔹 Value: ${value}"
    Log To Console    "🔹 Disabled: ${disabled}"

    Should Be Equal    ${placeholder}    Select Religion first
    Should Be Equal    ${disabled}       true



Verify Mother Tongue Field
    Wait Until Element Is Visible    ${MOTHER_TONGUE_TITLE}    10s
    ${title}=    Get Text    ${MOTHER_TONGUE_TITLE}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Mother Tongue

    Wait Until Element Is Visible    ${MOTHER_TONGUE_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${MOTHER_TONGUE_INPUT}    placeholder
    ${value}=          Get Element Attribute    ${MOTHER_TONGUE_INPUT}    value

    Log To Console    "🔹 Placeholder: ${placeholder}"
    Log To Console    "🗣️ Mother Tongue Value: ${value}"

    Should Be Equal    ${placeholder}    Enter Mother Tongue
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ Mother Tongue not entered yet"
    Run Keyword If    '${value}' != ''    Log To Console    "✅ Mother Tongue entered: ${value}"


Verify Family Status Field
    Wait Until Element Is Visible    ${FAMILY_STATUS_LABEL}    10s
    ${title}=    Get Text    ${FAMILY_STATUS_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Family Status

    Wait Until Element Is Visible    ${FAMILY_STATUS_VALUE}    10s
    ${selected}=    Get Text    ${FAMILY_STATUS_VALUE}
    Log To Console    "🔹 Selected Value: ${selected}"

    ${hidden_value}=    Get Element Attribute    ${FAMILY_STATUS_HIDDEN}    value
    Log To Console    "🗂️ Hidden Value: ${hidden_value}"

    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    "⚠️ Default Family Status is selected"
    Run Keyword If    "${selected}" != "Doesn't matter"    Log To Console    "✅ Family Status chosen: ${selected}"
Verify Manglik Field
    Wait Until Element Is Visible    ${MANGLIK_LABEL}    10s
    ${title}=    Get Text    ${MANGLIK_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Manglik

    Wait Until Element Is Visible    ${MANGLIK_INPUT}    10s
    ${value}=    Get Element Attribute    ${MANGLIK_INPUT}    value
    Log To Console    "🔹 Current Manglik Selection: ${value}"

    Run Keyword If    "${value}" == ""    Log To Console    "⚠️ No Manglik value selected"
    Run Keyword If    "${value}" != ""    Log To Console    "✅ Manglik selected: ${value}"

Verify KundaliDosham Field
    Wait Until Element Is Visible    ${KUNDALI_LABEL}    10s
    ${title}=    Get Text    ${KUNDALI_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    KundaliDosham

    # Check selected dropdown value
    Wait Until Element Is Visible    ${KUNDALI_VALUE}    10s
    ${selected}=    Get Text    ${KUNDALI_VALUE}
    Log To Console    "🔹 Selected KundaliDosham: ${selected}"

    # Hidden input actual value
    ${hidden_value}=    Get Element Attribute    ${KUNDALI_HIDDEN}    value
    Log To Console    "🗂️ Hidden Value: ${hidden_value}"

    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    "⚠️ Default KundaliDosham is selected"
    Run Keyword If    "${selected}" != "Doesn't matter"    Log To Console    "✅ User selected KundaliDosham: ${selected}"

Verify Origin Country Field
    Wait Until Element Is Visible    ${ORIGIN_COUNTRY_LABEL}    10s
    ${title}=    Get Text    ${ORIGIN_COUNTRY_LABEL}
    Log To Console    "📌 Title: ${title}"
    # Should Be Equal    ${title}    Origin  Country

    Wait Until Element Is Visible    ${ORIGIN_COUNTRY_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${ORIGIN_COUNTRY_INPUT}    placeholder
    Log To Console    "🔹 Placeholder: ${placeholder}"
    Should Be Equal    ${placeholder}    Search Country

    ${value}=    Get Element Attribute    ${ORIGIN_COUNTRY_INPUT}    value
    Log To Console    "🗂️ Current Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ No country selected yet"
    ...    ELSE    Log To Console    "✅ Country entered: ${value}"



Verify Origin State Field
    Wait Until Element Is Visible    ${ORIGIN_STATE_LABEL}    10s
    ${title}=    Get Text    ${ORIGIN_STATE_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Origin State

    Wait Until Element Is Visible    ${ORIGIN_STATE_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${ORIGIN_STATE_INPUT}    placeholder
    Log To Console    "🔹 Placeholder: ${placeholder}"
    Should Be Equal    ${placeholder}    Search State

    ${value}=    Get Element Attribute    ${ORIGIN_STATE_INPUT}    value
    Log To Console    "🗂️ Current Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ No state selected yet"
    ...    ELSE    Log To Console    "✅ State entered: ${value}"



Verify Origin City Field
    Wait Until Element Is Visible    ${ORIGIN_CITY_LABEL}    10s
    ${title}=    Get Text    ${ORIGIN_CITY_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Origin City

    Wait Until Element Is Visible    ${ORIGIN_CITY_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${ORIGIN_CITY_INPUT}    placeholder
    Log To Console    "🔹 Placeholder: ${placeholder}"
    Should Be Equal    ${placeholder}    Search City

    ${value}=    Get Element Attribute    ${ORIGIN_CITY_INPUT}    value
    Log To Console    "🗂️ Current Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ No city selected yet"
    ...    ELSE    Log To Console    "✅ City entered: ${value}"
    ...    
Verify Current State Field
    Wait Until Element Is Visible    ${CURRENT_STATE_LABEL}    10s
    ${title}=    Get Text    ${CURRENT_STATE_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Current State

    Wait Until Element Is Visible    ${CURRENT_STATE_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${CURRENT_STATE_INPUT}    placeholder
    Log To Console    "🔹 Placeholder: ${placeholder}"
    Should Be Equal    ${placeholder}    Search State

    ${value}=    Get Element Attribute    ${CURRENT_STATE_INPUT}    value
    Log To Console    "🗂️ Current Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ No state selected yet"
    ...    ELSE    Log To Console    "✅ State entered: ${value}"

Verify Current City Field
    Wait Until Element Is Visible    ${CURRENT_CITY_LABEL}    10s
    ${title}=    Get Text    ${CURRENT_CITY_LABEL}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal    ${title}    Current City

    Wait Until Element Is Visible    ${CURRENT_CITY_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${CURRENT_CITY_INPUT}    placeholder
    Log To Console    "🔹 Placeholder: ${placeholder}"
    Should Be Equal    ${placeholder}    Search City

    ${value}=    Get Element Attribute    ${CURRENT_CITY_INPUT}    value
    Log To Console    "🗂️ Current Value: ${value}"
    Run Keyword If    '${value}' == ''    Log To Console    "⚠️ No city selected yet"
    ...    ELSE    Log To Console    "✅ City entered: ${value}"


    Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s 
*** Keywords ***
*** Keywords ***
Verify Qualification Field
    # Verify Label
    Wait Until Element Is Visible    ${QUALIFICATION_LABEL}    10s
    ${title}=    Get Text    ${QUALIFICATION_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Qualification

    # Try to get selected value safely
    ${status}    ${selected}=    Run Keyword And Ignore Error    Get Text    ${QUALIFICATION_VALUE}
    Run Keyword If    '${status}' == 'FAIL'    Log To Console    ⚠️ Selected value not rendered yet

    Log To Console    🔹 Selected Qualification: ${selected}

    # Hidden input value
    ${hidden_value}=    Get Element Attribute    ${QUALIFICATION_HIDDEN}    value
    Log To Console    🗂️ Hidden Value: ${hidden_value}

    # Conditional Logging
    Run Keyword If    '${selected}' == "Doesn't matter"    Log To Console    ⚠️ Default Qualification is selected
    Run Keyword Unless    '${selected}' == "Doesn't matter"    Log To Console    ✅ User selected Qualification: ${selected}



Verify Employment Type Field
    Wait Until Element Is Visible    ${EMPLOYMENT_TYPE_LABEL}    10s
    ${title}=    Get Text    ${EMPLOYMENT_TYPE_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Employment Type

    Wait Until Element Is Visible    ${EMPLOYMENT_TYPE_VALUE}    10s
    ${selected}=    Get Text    ${EMPLOYMENT_TYPE_VALUE}
    Log To Console    🔹 Selected Value: ${selected}
    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    ⚠️ Default value shown
    ...    ELSE    Log To Console    ✅ Employment type selected: ${selected}

    ${hidden}=    Get Element Attribute    ${EMPLOYMENT_TYPE_HIDDEN}    value
    Log To Console    🗂️ Hidden Input Value: ${hidden}

Verify Job Role Field
    Wait Until Element Is Visible    ${JOB_ROLE_LABEL}    10s
    ${title}=    Get Text    ${JOB_ROLE_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Job Role

    Wait Until Element Is Visible    ${JOB_ROLE_INPUT}    10s
    ${placeholder}=    Get Element Attribute    ${JOB_ROLE_INPUT}    placeholder
    Log To Console    🔹 Placeholder: ${placeholder}
    Should Be Equal    ${placeholder}    Search for a job role

    ${value}=    Get Element Attribute    ${JOB_ROLE_INPUT}    value
    Log To Console    🗂️ Current Value: ${value}
    Run Keyword If    "${value}" == ""    Log To Console    ⚠️ No job role entered yet
    ...    ELSE    Log To Console    ✅ Job role entered: ${value}


*** Keywords ***
Verify Annual Income Field
    Wait Until Element Is Visible    ${ANNUAL_INCOME_LABEL}    10s
    ${title}=    Get Text    ${ANNUAL_INCOME_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Annual Income

    Wait Until Element Is Visible    ${ANNUAL_INCOME_PLACEHOLDER}    10s
    ${placeholder}=    Get Text    ${ANNUAL_INCOME_PLACEHOLDER}
    Log To Console    🔹 Placeholder: ${placeholder}
    Should Be Equal    ${placeholder}    Select Annual Income

    ${hidden}=    Get Element Attribute    ${ANNUAL_INCOME_HIDDEN}    value
    Log To Console    🗂️ Hidden Input Value: ${hidden}
    Run Keyword If    "${hidden}" == ""    Log To Console    ⚠️ No annual income selected yet
    ...    ELSE    Log To Console    ✅ Annual income selected: ${hidden}


*** Keywords ***
Verify Diet Preference Field
    Wait Until Element Is Visible    ${DIET_PREFERENCE_LABEL}    10s
    ${title}=    Get Text    ${DIET_PREFERENCE_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Diet preferences

    Wait Until Element Is Visible    ${DIET_PREFERENCE_VALUE}    10s
    ${selected}=    Get Text    ${DIET_PREFERENCE_VALUE}
    Log To Console    🔹 Selected Value: ${selected}
    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    ⚠️ Default value shown
    ...    ELSE    Log To Console    ✅ Diet preference selected: ${selected}

    ${hidden}=    Get Element Attribute    ${DIET_PREFERENCE_HIDDEN}    value
    Log To Console    🗂️ Hidden Input Value: ${hidden}


*** Keywords ***
Verify Smoking Habit Field
    Wait Until Element Is Visible    ${SMOKING_HABIT_LABEL}    10s
    ${title}=    Get Text    ${SMOKING_HABIT_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Smoking Habit

    Wait Until Element Is Visible    ${SMOKING_HABIT_VALUE}    10s
    ${selected}=    Get Text    ${SMOKING_HABIT_VALUE}
    Log To Console    🔹 Selected Value: ${selected}
    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    ⚠️ Default value shown
    ...    ELSE    Log To Console    ✅ Smoking habit selected: ${selected}

    ${hidden}=    Get Element Attribute    ${SMOKING_HABIT_HIDDEN}    value
    Log To Console    🗂️ Hidden Input Value: ${hidden}



*** Keywords ***
Verify Drinking Habit Field
    Wait Until Element Is Visible    ${DRINKING_HABIT_LABEL}    10s
    ${title}=    Get Text    ${DRINKING_HABIT_LABEL}
    Log To Console    📌 Title: ${title}
    Should Be Equal    ${title}    Drinking Habit

    Wait Until Element Is Visible    ${DRINKING_HABIT_VALUE}    10s
    ${selected}=    Get Text    ${DRINKING_HABIT_VALUE}
    Log To Console    🔹 Selected Value: ${selected}
    Run Keyword If    "${selected}" == "Doesn't matter"    Log To Console    ⚠️ Default value shown
    ...    ELSE    Log To Console    ✅ Drinking habit selected: ${selected}

    ${hidden}=    Get Element Attribute    ${DRINKING_HABIT_HIDDEN}    value
    Log To Console    🗂️ Hidden Input Value: ${hidden}
