*** Variables ***
# ${}                    xpath=
# 0.Home page 
${LOGIN_BUTTON}  xpath=//a[@href="/login" and contains(@class,"py-2")]


# 1. Login and user home/Dashboard  page 

${LOGIN_LINK}        xpath=//a[@href="/login" and contains(@class,"py-2")]
${LOGIN_HEADER}      xpath=//h1[contains(@class,"title-outsidelogin") and text()="Login"]
${PHONE_INPUT}       xpath=//input[@type='tel']
${PHONE_NUMBER}      6303481147
${PASSWORD_INPUT}    id=password
${PASSWORD}          Qwerty@1
${CONTINUE_BUTTON}   xpath=//button[contains(@class,"submit-buttonlogin")]





# 2. Dashboard XPaths
${dashboard}                                    xpath=//a[text()='Dashboard']
${dashboard_url}                               https://makeyourjodi.com/home
${home_title_check}                            xpath=//h1[contains(text(), "Meet Your Matrimonial Soulmate")]
${AGE_DROPDOWN}                                xpath=//div[contains(@class,"cursor-pointer") and text()="18 - 27"]
${EDUCATION_INPUT}                             xpath=//div[@class='select__control css-axpaj6-control']
${PROFESSION_INPUT}                            xpath=//input[@placeholder='Enter Profession']
${FIND_BUTTON}                                 xpath=//button[contains(text(), "Find")]

${Profiles_which_match_your_preferences_headline}    xpath=//h2[normalize-space(.)="Profiles which match your preferences"]

${PREFERENCES_TITLE}    xpath=//h2[normalize-space()='Profiles which match your preferences']
${PREFERENCES_GRID}     xpath=//h2[normalize-space()='Profiles which match your preferences']/following::div[contains(@class,'grid')][1]
${PROFILE_CARDS}        xpath=//h2[normalize-space()='Profiles which match your preferences']/following::div[contains(@class,'grid')][1]//div[contains(@class,'transition-transform')]
${NEXT_BUTTON}          xpath=//h2[normalize-space()='Profiles which match your preferences']/following::button[contains(@class,'right-5')][1]



#  3. profile  xpaths 
${profile_link}      xpath=//a[text()='Profile']

#  4. VIP  xpaths 
${VIP_link}      xpath=//a[text()='VIP']

#  5. Connections  xpaths 
${Connections_link}      xpath=//a[text()='Connections']