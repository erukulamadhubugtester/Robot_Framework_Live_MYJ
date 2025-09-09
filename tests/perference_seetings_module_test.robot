*** Settings ***
Resource    ../resources/user_preference_settings_keyword.robot

Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User perference Settings Page
    Open Landing Page
    Verify Login User Preference Settings Page
    Verify User Preference Settings URL 
    Verify Preference Settings Title
    Verify Clear And Save Buttons
    Verify Height Section
    Verify Age Section
    Verify Marital Status
    Verify Religion Field
    Verify Community Field
    Verify Mother Tongue Field
    Verify Family Status Field
    Verify Manglik Field
    Verify KundaliDosham Field
    Verify Origin Country Field
    Verify Origin State Field
    Verify Origin City Field
    Verify Current State Field
    Verify Current City Field
    Verify Qualification Field
    Verify Employment Type Field
    Verify Job Role Field
    Verify Annual Income Field
    Verify Diet Preference Field
    Verify Smoking Habit Field
    Verify Drinking Habit Field





