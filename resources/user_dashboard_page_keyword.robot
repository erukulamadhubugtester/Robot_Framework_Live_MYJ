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
    

    Wait Until Element Is Visible    ${Promoted_users_headline} 
    Scroll Element Into View  ${Promoted_users_headline}
    Highlight Element     ${Promoted_users_headline}






  Set Browser Implicit Wait    2

Close Browser Session
    Close Browser

Validate Footer Links
 # ---- Section 1: Follow us on ----
    Wait Until Element Is Visible    ${Follow_us_on}    
    Scroll Element Into View         ${Follow_us_on}
    Highlight Element                ${Follow_us_on}

    Wait Until Element Is Visible    ${LinkedIn_link}  
    Scroll Element Into View         ${LinkedIn_link}
    Highlight Element                ${LinkedIn_link}

    Wait Until Element Is Visible    ${Facebook_link}   
    Scroll Element Into View         ${Facebook_link}
    Highlight Element                ${Facebook_link}

    Wait Until Element Is Visible    ${Instagram_link}   
    Scroll Element Into View         ${Instagram_link}
    Highlight Element                ${Instagram_link}

    Wait Until Element Is Visible    ${Twitte_X___link} 
    Scroll Element Into View         ${Twitte_X___link}
    Highlight Element                ${Twitte_X___link}

    Wait Until Element Is Visible    ${YouTube_link}     
    Scroll Element Into View         ${YouTube_link}
    Highlight Element                ${YouTube_link}

    # ---- Section 2: Quick Links ----
    Wait Until Element Is Visible    ${Quick_links}   
    Scroll Element Into View         ${Quick_links}
    Highlight Element                ${Quick_links}

    Wait Until Element Is Visible    ${QuickLinks_Home}    
    Scroll Element Into View         ${QuickLinks_Home}
    Highlight Element                ${QuickLinks_Home}

    Wait Until Element Is Visible    ${QuickLinks_Connect}   
    Scroll Element Into View         ${QuickLinks_Connect}
    Highlight Element                ${QuickLinks_Connect}

    Wait Until Element Is Visible    ${QuickLinks_Chat}    
    Scroll Element Into View         ${QuickLinks_Chat}
    Highlight Element                ${QuickLinks_Chat}

    Wait Until Element Is Visible    ${QuickLinks_FAQ}    
    Scroll Element Into View         ${QuickLinks_FAQ}
    Highlight Element                ${QuickLinks_FAQ}

    Wait Until Element Is Visible    ${QuickLinks_Support}    
    Scroll Element Into View         ${QuickLinks_Support}
    Highlight Element                ${QuickLinks_Support}

    Wait Until Element Is Visible    ${QuickLink_Account_Settings}    
    Scroll Element Into View         ${QuickLink_Account_Settings}
    Highlight Element                ${QuickLink_Account_Settings}

    Wait Until Element Is Visible    ${QuickLink_Preference_Settings}    
    Scroll Element Into View         ${QuickLink_Preference_Settings}
    Highlight Element                ${QuickLink_Preference_Settings}

    Wait Until Element Is Visible    ${QuickLink_Referral_Rewards}    
    Scroll Element Into View         ${QuickLink_Referral_Rewards}
    Highlight Element                ${QuickLink_Referral_Rewards}

    Wait Until Element Is Visible    ${QuickLink_Terms_Conditions}    
    Scroll Element Into View         ${QuickLink_Terms_Conditions}
    Highlight Element                ${QuickLink_Terms_Conditions}
  
    Wait Until Element Is Visible    ${QuickLink_Privacy_Policy}    
    Scroll Element Into View         ${QuickLink_Privacy_Policy}
    Highlight Element                ${QuickLink_Privacy_Policy}

    # ---- Section 3: Company ----
    Wait Until Element Is Visible    ${Company}    
    Scroll Element Into View         ${Company}
    Highlight Element                ${Company}

    Wait Until Element Is Visible    ${Company_AboutUs}    
    Scroll Element Into View         ${Company_AboutUs}
    Highlight Element                ${Company_AboutUs}

    Wait Until Element Is Visible    ${Company_SupportEmail}    
    Scroll Element Into View         ${Company_SupportEmail}
    Highlight Element                ${Company_SupportEmail}

    Wait Until Element Is Visible    ${Company_Matchmaking}    
    Scroll Element Into View         ${Company_Matchmaking}
    Highlight Element                ${Company_Matchmaking}
         
