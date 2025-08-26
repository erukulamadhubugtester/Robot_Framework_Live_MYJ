*** Variables ***
${BROWSER}       chrome
${BASE_URL}      https://makeyourjodi.com/

# Home page 
${LOGIN_BUTTON}  xpath=//a[@href="/login" and contains(@class,"py-2")]


# Login page 
${LOGIN_LINK}        xpath=//a[@href="/login" and contains(@class,"py-2")]
${LOGIN_HEADER}      xpath=//h1[contains(@class,"title-outsidelogin") and text()="Login"]
${PHONE_INPUT}       xpath=//input[@type='tel']
${PHONE_NUMBER}      6303481147
${PASSWORD_INPUT}    id=password
${PASSWORD}          Qwerty@1
${CONTINUE_BUTTON}   xpath=//button[contains(@class,"submit-buttonlogin")]

${profile}           xpath=//a[text()='Profile']